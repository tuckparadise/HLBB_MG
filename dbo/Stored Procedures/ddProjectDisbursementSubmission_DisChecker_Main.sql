CREATE                 procedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@DisbursementCheckerEmailAddress  nvarchar(max) = null ,
@DisbursementCheckerDecision nvarchar(max) = null ,
@DisbursementCheckerSubmissionCompleted nvarchar(max) = null ,
@DisbursementCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@DisbursementCheckerEmailAddress like 'K2:%')
	begin		
		set @DisbursementCheckerEmailAddress = Stuff(@DisbursementCheckerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if (@DisbursementCheckerSubmissionCompleted = 1)
	begin
		if (@DisbursementCheckerDecision is null or @DisbursementCheckerDecision = '')
		begin
			set @Error = 'Please Select Decision'
		end 
	end 
	

	if (@Error = '')
	begin
		if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
		begin
			if (ltrim(rtrim(@DisbursementCheckerRejectionReason)) = '' or @DisbursementCheckerRejectionReason is null)
			begin
				set @Error = 'Please fill in Remarks'
			end 
		
		end 
	
	end 

	declare @dm nvarchar(max) 
	set @dm = (select disbursementmanner from SQLLOADS where arn = @arn )

	if (@dm = 'PR' and @DisbursementCheckerSubmissionCompleted = 1)
	begin		
		-- 20211204 - check if phase code added into the system 
		declare @phasecode2 nvarchar(max) 
		declare @projectcode2 nvarchar(max) 
		declare @devcode2 nvarchar(max) 

		set @phasecode2 = (select phasecode from SQLLOADS where arn = @arn)
		set @projectcode2 = (select ProjectCode from SQLLOADS where arn = @arn)
		set @devcode2 = (select DeveloperCode from SQLLOADS where arn = @arn)
			
		if not exists 
		(
			select 1 
			from ddProjectPhase
			where phasecode = @phasecode2 and projectcode = @projectcode2 and developercode = @devcode2				
		)
		begin		
			set @Error = @Error + 'No phase code set in the parameter. Please check with MG Admin / CRA.<br>'	
		end 
		-- 20211204 - check if phase code added into the system 
	end 

	if (@Error = '')
	begin						

		declare @DisbursementMakerDecision nvarchar(max) 

		select @DisbursementMakerDecision = DisbursementMakerDecision
		from ddProjectDisbursementSubmission_DisMaker
		where arn = @arn 	
		and BillingRunningID = @billingid

		-- 20220105 - remove rejected status after action taken by maker instead of checker 
		-- 20220112 - keep it for now since there will be existing rejected data while in checker pool 
		
		if (@DisbursementCheckerSubmissionCompleted = 1)
		begin
			delete from ddProjectDisbursementSubmission_DisCheckerRejected
			where arn = @arn 
				and BillingRunningID = 	@billingid	

			delete from ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail
			where arn = @arn 
				and BillingRunningID = 	@billingid	
		end 
		

		if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
		begin
			INSERT INTO [dbo].ddProjectDisbursementSubmission_DisCheckerRejected
			   (
				[arn]
				  ,[BalanceAdviceLetterApplicableFlag]
				  ,[UrgentFlag]
				  ,[LS_RedemptionDueDateFlag]
				  ,[LS_RedemptionDueDate]
				  ,[LS_ExtendedCompletionDateFlag]
				  ,[LS_CompletionDate]
				  ,[LS_ExtendedCompletionDate]
				  ,[PR_DeveloperBillingDueDateFlag]
				  ,[PR_Stage2AFlag]
				  ,[PR_Stage2BFlag]
				  ,[PR_Stage2CFlag]
				  ,[PR_Stage2DFlag]
				  ,[PR_Stage2EFlag]
				  ,[PR_Stage2FFlag]
				  ,[PR_Stage2GFlag]
				  ,[PR_Stage2HFlag]
				  ,[PR_StageOthers]
				  ,[PR_EarliestBillingDueDate]
				  ,[PR_TotalBillingAmount]
				  ,[PR_AnyBridgingFinancierFlag]
				  ,[PR_BridgingFinancier]
				  ,[PR_BridgingFinancierEmailAddress]
				  ,[PR_BridgingFinancierRedemptionSum]
				  ,[PR_RedemptionPaymentAccountNumber]
				  ,[PR_BeneficiaryBank]
				  ,[PR_BridgingFinancierRedemptionExpiryDate]
				  ,[PR_DeveloperName]
				  ,[PR_DeveloperEmailAddress]
				  ,[PR_DeveloperPIC]
				  ,[PR_DeveloperHDA]
				  ,[PR_DeveloperHDABank]
				  ,[LF_PayeeName]
				  ,[LF_BilledAmount]
				  ,[LF_AccountNumber]
				  ,[LF_Bank]
				  ,[LF_PaymentDescription]
				  ,[LF_PaymentMode]
				  ,[UpdateInfo_Reason]
				  ,[UpdateInfo_Others]
				  ,[CancelLoan_Remarks]
				  ,[CancelLoan_File]
				  ,[SolicitorSubmissionOption]
				  ,[SolicitorSubmissionCompleted]
				  ,[SolicitorCode]
				  ,[SolicitorSubmissionDate]
				  ,[SolicitorSubmissionPDFID]
				  ,[DisbursementMakerEmailAddress]
				  ,[DisbursementMakerDecision]
				  ,[DisbursementMakerSubmissionCompleted]
				  ,[DisbursementMakerRejectionReason]
				  ,[DisbursementMakerSubmissionDate]
				  ,[DisbursementMakerSubmissionPDFID]
				  ,[DisbursementCheckerEmailAddress]
				  ,[DisbursementCheckerDecision]
				  ,[DisbursementCheckerSubmissionCompleted]
				  ,[DisbursementCheckerRejectionReason]
				  ,[DisbursementCheckerSubmissionDate]
				  ,[DisbursementCheckerPDFID]
				  ,[RCOMakerEmailAddress]
				  ,[RCOMakerDecision]
				  ,[RCOMakerSubmissionCompleted]
				  ,[RCOMakerRejectionReason]
				  ,[RCOMakerSubmissionDate]
				  ,[RCOMakerPDFID]
				  ,[RCOCheckerEmailAddress]
				  ,[RCOCheckerDecision]
				  ,[RCOCheckerSubmissionCompleted]
				  ,[RCOCheckerRejectionReason]
				  ,[RCOCheckerSubmissionDate]
				  ,[RCOCheckerPDFID]
				  ,[CreatedDate]
				  ,[UpdatedDate]
				  ,[FinalBillingFlag]
				  ,[ProjectSubmissionOption]
				  ,[ProjectSubmissionCompleted]
				  ,[DeveloperCode]
				  ,[ProjectCode]
				  ,[PhaseCode]
				  ,[DeveloperLoginID]
				  ,[ProjectSubmissionDate]
				  ,[ProjectSubmissionPDFID]
				  ,[PR_Stage2IFlag]
				  ,[PR_Stage2JFlag]
				  ,[PR_Stage2KFlag]
				  ,[PR_Stage3]
				  ,[PR_Stage4]
				  ,[PR_Stage5]
				  ,[PR_Stage6]
				  ,[PR_Stage7]
				  ,[PR_Stage8]
				  ,[PR_Stage9]
				  ,[Attachment1]
				  ,[Attachment2]
				  ,[DraftID]
				  ,[SadaFlag]
				  ,[ConfirmationOfArchitectFlag]
				  ,[ConfirmationOfArchitectRemark]
				  ,[BillingRunningID]
				  ,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
			   )
			   SELECT 
					[arn]
				  ,[BalanceAdviceLetterApplicableFlag]
				  ,[UrgentFlag]
				  ,[LS_RedemptionDueDateFlag]
				  ,[LS_RedemptionDueDate]
				  ,[LS_ExtendedCompletionDateFlag]
				  ,[LS_CompletionDate]
				  ,[LS_ExtendedCompletionDate]
				  ,[PR_DeveloperBillingDueDateFlag]
				  ,[PR_Stage2AFlag]
				  ,[PR_Stage2BFlag]
				  ,[PR_Stage2CFlag]
				  ,[PR_Stage2DFlag]
				  ,[PR_Stage2EFlag]
				  ,[PR_Stage2FFlag]
				  ,[PR_Stage2GFlag]
				  ,[PR_Stage2HFlag]
				  ,[PR_StageOthers]
				  ,[PR_EarliestBillingDueDate]
				  ,[PR_TotalBillingAmount]
				  ,[PR_AnyBridgingFinancierFlag]
				  ,[PR_BridgingFinancier]
				  ,[PR_BridgingFinancierEmailAddress]
				  ,[PR_BridgingFinancierRedemptionSum]
				  ,[PR_RedemptionPaymentAccountNumber]
				  ,[PR_BeneficiaryBank]
				  ,[PR_BridgingFinancierRedemptionExpiryDate]
				  ,[PR_DeveloperName]
				  ,[PR_DeveloperEmailAddress]
				  ,[PR_DeveloperPIC]
				  ,[PR_DeveloperHDA]
				  ,[PR_DeveloperHDABank]
				  ,[LF_PayeeName]
				  ,[LF_BilledAmount]
				  ,[LF_AccountNumber]
				  ,[LF_Bank]
				  ,[LF_PaymentDescription]
				  ,[LF_PaymentMode]
				  ,[UpdateInfo_Reason]
				  ,[UpdateInfo_Others]
				  ,[CancelLoan_Remarks]
				  ,[CancelLoan_File]
				  ,[SolicitorSubmissionOption]
				  ,[SolicitorSubmissionCompleted]
				  ,[SolicitorCode]
				  ,[SolicitorSubmissionDate]
				  ,[SolicitorSubmissionPDFID]
				  ,[DisbursementMakerEmailAddress]
				  ,[DisbursementMakerDecision]
				  ,[DisbursementMakerSubmissionCompleted]
				  ,[DisbursementMakerRejectionReason]
				  ,[DisbursementMakerSubmissionDate]
				  ,[DisbursementMakerSubmissionPDFID]
				  ,@DisbursementCheckerEmailAddress
				  ,@DisbursementCheckerDecision
				  ,@DisbursementCheckerSubmissionCompleted
				  ,@DisbursementCheckerRejectionReason
				  ,getdate()
				  ,[DisbursementCheckerPDFID]
				  ,[RCOMakerEmailAddress]
				  ,[RCOMakerDecision]
				  ,[RCOMakerSubmissionCompleted]
				  ,[RCOMakerRejectionReason]
				  ,[RCOMakerSubmissionDate]
				  ,[RCOMakerPDFID]
				  ,[RCOCheckerEmailAddress]
				  ,[RCOCheckerDecision]
				  ,[RCOCheckerSubmissionCompleted]
				  ,[RCOCheckerRejectionReason]
				  ,[RCOCheckerSubmissionDate]
				  ,[RCOCheckerPDFID]
				  ,[CreatedDate]
				  ,[UpdatedDate]
				  ,[FinalBillingFlag]
				  ,[ProjectSubmissionOption]
				  ,[ProjectSubmissionCompleted]
				  ,[DeveloperCode]
				  ,[ProjectCode]
				  ,[PhaseCode]
				  ,[DeveloperLoginID]
				  ,[ProjectSubmissionDate]
				  ,[ProjectSubmissionPDFID]
				  ,[PR_Stage2IFlag]
				  ,[PR_Stage2JFlag]
				  ,[PR_Stage2KFlag]
				  ,[PR_Stage3]
				  ,[PR_Stage4]
				  ,[PR_Stage5]
				  ,[PR_Stage6]
				  ,[PR_Stage7]
				  ,[PR_Stage8]
				  ,[PR_Stage9]
				  ,[Attachment1]
				  ,[Attachment2]
				  ,[DraftID]
				  ,[SadaFlag]
				  ,[ConfirmationOfArchitectFlag]
				  ,[ConfirmationOfArchitectRemark]
				  ,[BillingRunningID]
				  ,SPADate 
				,SPAConstructionPeriodInMonths
				,ExtendedConstructionPeriodInMonths 
			  FROM [dbo].ddProjectDisbursementSubmission_DisMaker
			  where arn = @arn 			
				and BillingRunningID = @billingid 

			insert into ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail
			select * from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			 where arn = @arn 			
				and BillingRunningID = @billingid 

			update ddProjectDisbursementSubmission_DisMaker
			set DisbursementCheckerEmailAddress = null, 
				DisbursementCheckerDecision = null, 
				DisbursementCheckerSubmissionCompleted = null, 
				DisbursementCheckerRejectionReason = null,
				[DisbursementMakerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 			
				and BillingRunningID = @billingid 
			
			-- move WF history entry upfront before assignment 			
			if (@DisbursementMakerDecision = 'Approve' and @DisbursementCheckerSubmissionCompleted=1 and @DisbursementCheckerDecision = 'Reject')
			begin
				insert into WorkflowHistory_ProjectBilling
				values ('Disbursement By Developer- Disbursement Checker',@arn,'Case Rejected By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)
			end 
		

			if (@DisbursementMakerDecision = 'Delete Workflow' and @DisbursementCheckerSubmissionCompleted=1 and @DisbursementCheckerDecision = 'Reject')
			begin
				insert into WorkflowHistory_ProjectBilling
				values ('Disbursement By Developer- Disbursement Checker',@arn,'Delete Workflow Rejected By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)
			end 
		

			--start locate last billing dis maker from logs and assign to him/her. 
			declare @LastDisMakerFromLog nvarchar(max)

			select top 1 @LastDisMakerFromLog= taskowner 
			from ddProject_MortgageAppTaskInstance_logs
			where workflow = 'DisbDUMakerBillingApproval'
				and Completed = 1
				and arn = @arn 
				and BillingRunningID = @billingid
			order by updateddate desc

			if (isnull(@LastDisMakerFromLog,'') <> '')
			begin
				insert into ddProject_MortgageAppTaskInstance
				values ('DisbDUMakerBillingApproval', @arn, @LastDisMakerFromLog, getdate(), getdate(), @LastDisMakerFromLog, @LastDisMakerFromLog, @billingid)

				insert into WorkflowHistory_ProjectBilling
				values ('Disbursement By Developer- Disbursement Checker',@arn,'Case Accepted By Disbursement Maker',@LastDisMakerFromLog,null,getdate(), @billingid)
			end 

			--end locate last billing dis maker from logs and assign to him/her. .
		end 
		else
		begin
			update ddProjectDisbursementSubmission_DisMaker
			set DisbursementCheckerEmailAddress = @DisbursementCheckerEmailAddress, 
				DisbursementCheckerDecision = @DisbursementCheckerDecision, 
				DisbursementCheckerSubmissionCompleted = @DisbursementCheckerSubmissionCompleted, 
				DisbursementCheckerRejectionReason = @DisbursementCheckerRejectionReason,	
				[DisbursementCheckerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
				and BillingRunningID = @billingid 
			
			 


			if (@DisbursementMakerDecision = 'Approve' and @DisbursementCheckerSubmissionCompleted=1 and @DisbursementCheckerDecision = 'Approve')
			begin
				if exists 
				(
					select 1
					from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
					where arn = @arn 
						and BillingRunningID = @billingid 
				)
				begin
					update ddProjectDisbursementSubmission_DisMaker_PaymentDetail
					set DisCheckerEmail=@DisbursementCheckerEmailAddress,
						DisCheckerApprovedDate= getdate()
					where arn = @arn 	
					and BillingRunningID = @billingid 

					-- start notification of payment enhancement					
					INSERT INTO [dbo].[aaNotificationOfPayment]
						([arn]
						,[RunningIDForCurrentSubmission]
						,[FacilityAccountNumber]
						,[PaymentMode]
						,[PayeeID]
						,[PayeeName]
						,[BeneficiaryBank]
						,[BeneficiaryBankAccountNumber]
						,[AmountDisburse]
						,[PaymentReference]
						,[PaymentDescription]
						,[PaymentCreatedDate]
						,[PaymentUpdatedDate]
						,[DisMakerEmail]
						,[DisMakerSubmissionDate]
						,[DisCheckerEmail]
						,[DisCheckerApprovedDate]
						,[RCOMakerEmail]
						,[RCOMakerApprovedDate]
						,[RCOCheckerEmail]
						,[RCOCheckerApprovedDate]
						,[AccountFrom]
						,[DevName]
						,[SolName]
						,[CreatedDate]
						,[UpdatedDate]
						,locked
						,DevCode
						, SolCode
						, DevEmail
						, SolEmail
						)
					select pd.[arn]
						,[RunningIDForCurrentSubmission]
						,[FacilityAccountNumber]
						,[PaymentMode]
						,[PayeeID]
						,[PayeeName]
						,[BeneficiaryBank]
						,[BeneficiaryBankAccountNumber]
						,[AmountDisburse]
						,[PaymentReference]
						,[PaymentDescription]
						,pd.[CreatedDate] 
						,pd.[UpdatedDate]
						,[DisMakerEmail]
						,[DisMakerSubmissionDate]
						,[DisCheckerEmail]
						,[DisCheckerApprovedDate]
						,[RCOMakerEmail]
						,[RCOMakerApprovedDate]
						,[RCOCheckerEmail]
						,[RCOCheckerApprovedDate]
						,[AccountFrom]
						,loads.DeveloperName
						,loads.SolicitorName
						,getdate()
						,getdate()
						,0
						,loads.DeveloperCode
						,loads.SolicitorCode
						,submission.PR_DeveloperEmailAddress
						,loads.SolicitorEmail
					from ddProjectDisbursementSubmission_DisMaker_PaymentDetail pd
						inner join ddProjectDisbursementSubmission_DisMaker submission on submission.arn = pd.arn and pd.BillingRunningID = submission.BillingRunningID						
						left join SQLLOADS loads on loads.arn = pd.arn 
					where pd.arn = @arn 
						and pd.BillingRunningID = @billingid 
						and PaymentReference <> 'Legal Fee' 
						and PaymentReference <> 'Valuation Fee'
						and PaymentReference <> 'Legal Fee - Principal Pymt'
						and PaymentReference <> 'Valuation Fee - Principal Pymt'
						and PaymentReference <> 'MDTA/ MRTT'
						and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'
					-- end notification of payment enhancement

					-- 20210904- start notification of payment enhancement for developer	
					
					declare @DisbursementManner nvarchar(max) 
					set @DisbursementManner = (select disbursementmanner from sqlloads where arn = @arn )

					if (@DisbursementManner = 'PR')
					begin
						INSERT INTO [dbo].ddProjectDisbursementSubmission_NotificationOfPayment
						([arn]
						,[RunningIDForCurrentSubmission]
						,[FacilityAccountNumber]
						,[PaymentMode]
						,[PayeeID]
						,[PayeeName]
						,[BeneficiaryBank]
						,[BeneficiaryBankAccountNumber]
						,[AmountDisburse]
						,[PaymentReference]
						,[PaymentDescription]
						,[PaymentCreatedDate]
						,[PaymentUpdatedDate]
						,[DisMakerEmail]
						,[DisMakerSubmissionDate]
						,[DisCheckerEmail]
						,[DisCheckerApprovedDate]
						,[RCOMakerEmail]
						,[RCOMakerApprovedDate]
						,[RCOCheckerEmail]
						,[RCOCheckerApprovedDate]
						,[AccountFrom]
						,[DevName]
						,[SolName]
						,[CreatedDate]
						,[UpdatedDate]
						,locked
						,DevCode
						, SolCode
						, DevEmail
						, SolEmail
						, ProjectCode
						, ProjectName
						, PhaseCode
						, PhaseName
						, AddressLine1
						, PrimaryCustomerName
						, BillingAmount
						, FinalBillingFlag
						, DeveloperLoginID
						, BillingStage
						, pdfid
						, ExtraField1
						, ExtraField2
						, ExtraField3
						, ExtraField4
						)
					select pd.[arn]
						,[RunningIDForCurrentSubmission]
						,[FacilityAccountNumber]
						,[PaymentMode]
						,[PayeeID]
						,[PayeeName]
						,[BeneficiaryBank]
						,[BeneficiaryBankAccountNumber]
						,[AmountDisburse]
						,[PaymentReference]
						,[PaymentDescription]
						,pd.[CreatedDate] 
						,pd.[UpdatedDate]
						,[DisMakerEmail]
						,[DisMakerSubmissionDate]
						,[DisCheckerEmail]
						,[DisCheckerApprovedDate]
						,[RCOMakerEmail]
						,[RCOMakerApprovedDate]
						,[RCOCheckerEmail]
						,[RCOCheckerApprovedDate]
						,[AccountFrom]
						--,loads.DeveloperName
						,ddprojectdeveloper.name as DeveloperName
						,loads.SolicitorName
						,getdate()
						,getdate()
						,0
						,loads.DeveloperCode
						,loads.SolicitorCode
						,phase.PhaseEmail as DevEmail
						,loads.SolicitorEmail
						, loads.ProjectCode
						, project.ProjectName
						, loads.PhaseCode
						, phase.PhaseName
						, AddressLine1
						, loads.ApplicantName as PrimaryCustomerName
						, loads.loanamount as BillingAmount
						, FinalBillingFlag
						, DeveloperLoginID
						,stuff(		
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage3 = 1 then '3' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage4 = 1 then '4' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage5 = 1 then '5' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage6 = 1 then '6' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage7 = 1 then '7' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage8 = 1 then '8' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.PR_Stage9 = 1 then '9' else null end),     '') + 
							COALESCE(', ' +  RTRIM( case when submission.[PR_StageOthers] = '' then null else submission.[PR_StageOthers] end),     '') 
							--COALESCE(', ' +  RTRIM( isnull(submission.[PR_StageOthers],'') ),     '') 
							, 1, 2, '') as BillingStage 
						--, BillingStage
						, null as pdfid
						, getdate() as ProcessingDate
						, null as ExtraField2
						, null as ExtraField3
						, null as ExtraField4
					from ddProjectDisbursementSubmission_DisMaker_PaymentDetail pd
						inner join ddProjectDisbursementSubmission_DisMaker submission on submission.arn = pd.arn and pd.BillingRunningID = submission.BillingRunningID						
						left join SQLLOADS loads on loads.arn = pd.arn 
						left join ddProjectPhase phase on phase.developercode = loads.DeveloperCode and phase.projectcode = loads.projectcode and phase.phasecode = loads.phasecode
						left join ddProjectDeveloperProjectMapping project on project.developercode = loads.DeveloperCode and project.projectcode = loads.projectcode 
						left join ddprojectdeveloper on ddprojectdeveloper.id = loads.DeveloperCode
					where pd.arn = @arn 
						and pd.BillingRunningID = @billingid 
						and PaymentReference <> 'Legal Fee' 
						and PaymentReference <> 'Valuation Fee'
						and PaymentReference <> 'Legal Fee - Principal Pymt'
						and PaymentReference <> 'Valuation Fee - Principal Pymt'
						and PaymentReference <> 'MDTA/ MRTT'
						and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'
					end 

			
					-- 20210904- end notification of payment enhancement for developer

					-- start move to RCOMaker table
					insert into ddProjectDisbursementSubmission_RCOMaker
					select * 
					from ddProjectDisbursementSubmission_DisMaker
					where arn = @arn 
						and BillingRunningID = @billingid 

					insert into ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
					select * 
					from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
					where arn = @arn 
						and BillingRunningID = @billingid 
					-- end move to RCOMaker table

				end 
			end 
			
		end 
		 
		 if (@DisbursementCheckerSubmissionCompleted=1)
		 begin
			insert into ddProject_MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
				,@billingid
			from ddProject_MortgageAppTaskInstance
			where workflow = 'DisbDUCheckerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 

			delete from ddProject_MortgageAppTaskInstance
			where workflow = 'DisbDUCheckerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 
		 end
		 
		
		if (@DisbursementMakerDecision = 'Approve' and @DisbursementCheckerSubmissionCompleted=1 and @DisbursementCheckerDecision = 'Approve')
		begin

			delete from ddProjectDisbursementSubmission_DisMaker_MRTA
			where arn = @arn	
				and BillingRunningID = @billingid

			insert into WorkflowHistory_ProjectBilling
			values ('Disbursement By Developer- Disbursement Checker',@arn,'Case Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)

			-- start move payment detail to payment history 
			insert into ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
			select * from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			where arn = @arn 					
				and BillingRunningID = @billingid 
			-- end move payment detail to payment history 
			
			delete from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			where arn = @arn 					
				and BillingRunningID = @billingid 

			
			insert into ddProjectDisbursementSubmission_DisMakerHistory  
			(
				[arn]
			,[BalanceAdviceLetterApplicableFlag]
			,[UrgentFlag]
			,[LS_RedemptionDueDateFlag]
			,[LS_RedemptionDueDate]
			,[LS_ExtendedCompletionDateFlag]
			,[LS_CompletionDate]
			,[LS_ExtendedCompletionDate]
			,[PR_DeveloperBillingDueDateFlag]
			,[PR_Stage2AFlag]
			,[PR_Stage2BFlag]
			,[PR_Stage2CFlag]
			,[PR_Stage2DFlag]
			,[PR_Stage2EFlag]
			,[PR_Stage2FFlag]
			,[PR_Stage2GFlag]
			,[PR_Stage2HFlag]
			,[PR_StageOthers]
			,[PR_EarliestBillingDueDate]
			,[PR_TotalBillingAmount]
			,[PR_AnyBridgingFinancierFlag]
			,[PR_BridgingFinancier]
			,[PR_BridgingFinancierEmailAddress]
			,[PR_BridgingFinancierRedemptionSum]
			,[PR_RedemptionPaymentAccountNumber]
			,[PR_BeneficiaryBank]
			,[PR_BridgingFinancierRedemptionExpiryDate]
			,[PR_DeveloperName]
			,[PR_DeveloperEmailAddress]
			,[PR_DeveloperPIC]
			,[PR_DeveloperHDA]
			,[PR_DeveloperHDABank]
			,[LF_PayeeName]
			,[LF_BilledAmount]
			,[LF_AccountNumber]
			,[LF_Bank]
			,[LF_PaymentDescription]
			,[LF_PaymentMode]
			,[UpdateInfo_Reason]
			,[UpdateInfo_Others]
			,[CancelLoan_Remarks]
			,[CancelLoan_File]
			,[SolicitorSubmissionOption]
			,[SolicitorSubmissionCompleted]
			,[SolicitorCode]
			,[SolicitorSubmissionDate]
			,[SolicitorSubmissionPDFID]
			,[DisbursementMakerEmailAddress]
			,[DisbursementMakerDecision]
			,[DisbursementMakerSubmissionCompleted]
			,[DisbursementMakerRejectionReason]
			,[DisbursementMakerSubmissionDate]
			,[DisbursementMakerSubmissionPDFID]
			,[DisbursementCheckerEmailAddress]
			,[DisbursementCheckerDecision]
			,[DisbursementCheckerSubmissionCompleted]
			,[DisbursementCheckerRejectionReason]
			,[DisbursementCheckerSubmissionDate]
			,[DisbursementCheckerPDFID]
			,[RCOMakerEmailAddress]
			,[RCOMakerDecision]
			,[RCOMakerSubmissionCompleted]
			,[RCOMakerRejectionReason]
			,[RCOMakerSubmissionDate]
			,[RCOMakerPDFID]
			,[RCOCheckerEmailAddress]
			,[RCOCheckerDecision]
			,[RCOCheckerSubmissionCompleted]
			,[RCOCheckerRejectionReason]
			,[RCOCheckerSubmissionDate]
			,[RCOCheckerPDFID]
			,[CreatedDate]
			,[UpdatedDate]
			,[FinalBillingFlag]
			,[ProjectSubmissionOption]
			,[ProjectSubmissionCompleted]
			,[DeveloperCode]
			,[ProjectCode]
			,[PhaseCode]
			,[DeveloperLoginID]
			,[ProjectSubmissionDate]
			,[ProjectSubmissionPDFID]
			,[PR_Stage2IFlag]
			,[PR_Stage2JFlag]
			,[PR_Stage2KFlag]
			,[PR_Stage3]
			,[PR_Stage4]
			,[PR_Stage5]
			,[PR_Stage6]
			,[PR_Stage7]
			,[PR_Stage8]
			,[PR_Stage9]
			,[Attachment1]
			,[Attachment2]
			,[DraftID]
			,[SadaFlag]
			,[ConfirmationOfArchitectFlag]
			,[ConfirmationOfArchitectRemark]
			,[BillingRunningID]
			,SPADate 
			,SPAConstructionPeriodInMonths 
			,ExtendedConstructionPeriodInMonths 
			)						
			SELECT 
				IntSub.[arn]
				,[BalanceAdviceLetterApplicableFlag]
				,[UrgentFlag]
				,[LS_RedemptionDueDateFlag]
				,[LS_RedemptionDueDate]
				,[LS_ExtendedCompletionDateFlag]
				,[LS_CompletionDate]
				,[LS_ExtendedCompletionDate]
				,[PR_DeveloperBillingDueDateFlag]
				,[PR_Stage2AFlag]
				,[PR_Stage2BFlag]
				,[PR_Stage2CFlag]
				,[PR_Stage2DFlag]
				,[PR_Stage2EFlag]
				,[PR_Stage2FFlag]
				,[PR_Stage2GFlag]
				,[PR_Stage2HFlag]
				,[PR_StageOthers]
				,[PR_EarliestBillingDueDate]
				,[PR_TotalBillingAmount]
				,[PR_AnyBridgingFinancierFlag]
				,[PR_BridgingFinancier]
				,[PR_BridgingFinancierEmailAddress]
				,[PR_BridgingFinancierRedemptionSum]
				,[PR_RedemptionPaymentAccountNumber]
				,[PR_BeneficiaryBank]
				,[PR_BridgingFinancierRedemptionExpiryDate]
				,[PR_DeveloperName]
				,[PR_DeveloperEmailAddress]
				,[PR_DeveloperPIC]
				,[PR_DeveloperHDA]
				,[PR_DeveloperHDABank]
				,[LF_PayeeName]
				,[LF_BilledAmount]
				,[LF_AccountNumber]
				,[LF_Bank]
				,[LF_PaymentDescription]
				,[LF_PaymentMode]
				,[UpdateInfo_Reason]
				,[UpdateInfo_Others]
				,[CancelLoan_Remarks]
				,[CancelLoan_File]
				,[SolicitorSubmissionOption]
				,[SolicitorSubmissionCompleted]
				,sqlloads.[SolicitorCode]
				,[SolicitorSubmissionDate]
				,[SolicitorSubmissionPDFID]
				,[DisbursementMakerEmailAddress]
				,[DisbursementMakerDecision]
				,[DisbursementMakerSubmissionCompleted]
				,[DisbursementMakerRejectionReason]
				,[DisbursementMakerSubmissionDate]
				,[DisbursementMakerSubmissionPDFID]
				,[DisbursementCheckerEmailAddress]
				,[DisbursementCheckerDecision]
				,[DisbursementCheckerSubmissionCompleted]
				,[DisbursementCheckerRejectionReason]
				,[DisbursementCheckerSubmissionDate]
				,[DisbursementCheckerPDFID]
				,[RCOMakerEmailAddress]
				,[RCOMakerDecision]
				,[RCOMakerSubmissionCompleted]
				,[RCOMakerRejectionReason]
				,[RCOMakerSubmissionDate]
				,[RCOMakerPDFID]
				,[RCOCheckerEmailAddress]
				,[RCOCheckerDecision]
				,[RCOCheckerSubmissionCompleted]
				,[RCOCheckerRejectionReason]
				,[RCOCheckerSubmissionDate]
				,[RCOCheckerPDFID]
				,IntSub.[CreatedDate]
				,IntSub.[UpdatedDate]
				,[FinalBillingFlag]
				,[ProjectSubmissionOption]
				,[ProjectSubmissionCompleted]
				,sqlloads.[DeveloperCode]
				,sqlloads.[ProjectCode]
				,sqlloads.[PhaseCode]
				,[DeveloperLoginID]
				,[ProjectSubmissionDate]
				,[ProjectSubmissionPDFID]
				,[PR_Stage2IFlag]
				,[PR_Stage2JFlag]
				,[PR_Stage2KFlag]
				,[PR_Stage3]
				,[PR_Stage4]
				,[PR_Stage5]
				,[PR_Stage6]
				,[PR_Stage7]
				,[PR_Stage8]
				,[PR_Stage9]
				,[Attachment1]
				,[Attachment2]
				,[DraftID]
				,phase.[SadaFlag]
				,[ConfirmationOfArchitectFlag]
				,[ConfirmationOfArchitectRemark]
				,[BillingRunningID]
				,SPADate 
				,SPAConstructionPeriodInMonths
				,ExtendedConstructionPeriodInMonths 
			FROM [dbo].ddProjectDisbursementSubmission_DisMaker IntSub		
			left join sqlloads on sqlloads.arn = IntSub.arn 
					left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
			where IntSub.arn = @arn 
			and IntSub.BillingRunningID = @billingid 


			delete from ddProjectDisbursementSubmission_DisMaker
			where arn = @arn 				
			and BillingRunningID = @billingid 

		end 

		if (@DisbursementMakerDecision = 'Delete Workflow' and @DisbursementCheckerSubmissionCompleted=1 and @DisbursementCheckerDecision = 'Approve')
		begin
			insert into WorkflowHistory_ProjectBilling
			values ('Disbursement By Developer- Disbursement Checker',@arn,'Delete Workflow Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)
		end 

		
		if (@DisbursementMakerDecision = 'Delete Workflow' and @DisbursementCheckerSubmissionCompleted = 1 and @DisbursementCheckerDecision = 'Approve')
		begin
			
			-- move aaIntDisbursementSubmission to aaIntDisbursementSubmission_History
			declare @RunningIDForCompletedSubmission bigint 
			declare @LastMaxRunningIDForCompletedSubmission bigint 

			/*
			if not exists 
			(
				select 1
				from aaIntDisbursementSubmission_billing_History
				where arn = @arn 	
					and BillingRunningID = @billingid 
			)
			begin
				set @RunningIDForCompletedSubmission = 1
			end 
			else
			begin
						
				select @LastMaxRunningIDForCompletedSubmission = max(RunningIDForCompletedSubmission)
				from aaIntDisbursementSubmission_billing_History
				where arn = @arn 										

				set @RunningIDForCompletedSubmission = @LastMaxRunningIDForCompletedSubmission + 1
			end 
			*/
			
			insert into ddProjectDisbursementSubmission_DisMakerHistory
			(
				[arn]
				,[BalanceAdviceLetterApplicableFlag]
				,[UrgentFlag]
				,[LS_RedemptionDueDateFlag]
				,[LS_RedemptionDueDate]
				,[LS_ExtendedCompletionDateFlag]
				,[LS_CompletionDate]
				,[LS_ExtendedCompletionDate]
				,[PR_DeveloperBillingDueDateFlag]
				,[PR_Stage2AFlag]
				,[PR_Stage2BFlag]
				,[PR_Stage2CFlag]
				,[PR_Stage2DFlag]
				,[PR_Stage2EFlag]
				,[PR_Stage2FFlag]
				,[PR_Stage2GFlag]
				,[PR_Stage2HFlag]
				,[PR_StageOthers]
				,[PR_EarliestBillingDueDate]
				,[PR_TotalBillingAmount]
				,[PR_AnyBridgingFinancierFlag]
				,[PR_BridgingFinancier]
				,[PR_BridgingFinancierEmailAddress]
				,[PR_BridgingFinancierRedemptionSum]
				,[PR_RedemptionPaymentAccountNumber]
				,[PR_BeneficiaryBank]
				,[PR_BridgingFinancierRedemptionExpiryDate]
				,[PR_DeveloperName]
				,[PR_DeveloperEmailAddress]
				,[PR_DeveloperPIC]
				,[PR_DeveloperHDA]
				,[PR_DeveloperHDABank]
				,[LF_PayeeName]
				,[LF_BilledAmount]
				,[LF_AccountNumber]
				,[LF_Bank]
				,[LF_PaymentDescription]
				,[LF_PaymentMode]
				,[UpdateInfo_Reason]
				,[UpdateInfo_Others]
				,[CancelLoan_Remarks]
				,[CancelLoan_File]
				,[SolicitorSubmissionOption]
				,[SolicitorSubmissionCompleted]
				,[SolicitorCode]
				,[SolicitorSubmissionDate]
				,[SolicitorSubmissionPDFID]
				,[DisbursementMakerEmailAddress]
				,[DisbursementMakerDecision]
				,[DisbursementMakerSubmissionCompleted]
				,[DisbursementMakerRejectionReason]
				,[DisbursementMakerSubmissionDate]
				,[DisbursementMakerSubmissionPDFID]
				,[DisbursementCheckerEmailAddress]
				,[DisbursementCheckerDecision]
				,[DisbursementCheckerSubmissionCompleted]
				,[DisbursementCheckerRejectionReason]
				,[DisbursementCheckerSubmissionDate]
				,[DisbursementCheckerPDFID]
				,[RCOMakerEmailAddress]
				,[RCOMakerDecision]
				,[RCOMakerSubmissionCompleted]
				,[RCOMakerRejectionReason]
				,[RCOMakerSubmissionDate]
				,[RCOMakerPDFID]
				,[RCOCheckerEmailAddress]
				,[RCOCheckerDecision]
				,[RCOCheckerSubmissionCompleted]
				,[RCOCheckerRejectionReason]
				,[RCOCheckerSubmissionDate]
				,[RCOCheckerPDFID]
				,[CreatedDate]
				,[UpdatedDate]
				,[FinalBillingFlag]
				,[ProjectSubmissionOption]
				,[ProjectSubmissionCompleted]
				,[DeveloperCode]
				,[ProjectCode]
				,[PhaseCode]
				,[DeveloperLoginID]
				,[ProjectSubmissionDate]
				,[ProjectSubmissionPDFID]
				,[PR_Stage2IFlag]
				,[PR_Stage2JFlag]
				,[PR_Stage2KFlag]
				,[PR_Stage3]
				,[PR_Stage4]
				,[PR_Stage5]
				,[PR_Stage6]
				,[PR_Stage7]
				,[PR_Stage8]
				,[PR_Stage9]
				,[Attachment1]
				,[Attachment2]
				,[DraftID]
				,[SadaFlag]
				,[ConfirmationOfArchitectFlag]
				,[ConfirmationOfArchitectRemark]
				,[BillingRunningID]     
				,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths
			)
			SELECT 
				sqlloads.[arn]
				,[BalanceAdviceLetterApplicableFlag]
				,[UrgentFlag]
				,[LS_RedemptionDueDateFlag]
				,[LS_RedemptionDueDate]
				,[LS_ExtendedCompletionDateFlag]
				,[LS_CompletionDate]
				,[LS_ExtendedCompletionDate]
				,[PR_DeveloperBillingDueDateFlag]
				,[PR_Stage2AFlag]
				,[PR_Stage2BFlag]
				,[PR_Stage2CFlag]
				,[PR_Stage2DFlag]
				,[PR_Stage2EFlag]
				,[PR_Stage2FFlag]
				,[PR_Stage2GFlag]
				,[PR_Stage2HFlag]
				,[PR_StageOthers]
				,[PR_EarliestBillingDueDate]
				,[PR_TotalBillingAmount]
				,[PR_AnyBridgingFinancierFlag]
				,[PR_BridgingFinancier]
				,[PR_BridgingFinancierEmailAddress]
				,[PR_BridgingFinancierRedemptionSum]
				,[PR_RedemptionPaymentAccountNumber]
				,[PR_BeneficiaryBank]
				,[PR_BridgingFinancierRedemptionExpiryDate]
				,[PR_DeveloperName]
				,[PR_DeveloperEmailAddress]
				,[PR_DeveloperPIC]
				,[PR_DeveloperHDA]
				,[PR_DeveloperHDABank]
				,[LF_PayeeName]
				,[LF_BilledAmount]
				,[LF_AccountNumber]
				,[LF_Bank]
				,[LF_PaymentDescription]
				,[LF_PaymentMode]
				,[UpdateInfo_Reason]
				,[UpdateInfo_Others]
				,[CancelLoan_Remarks]
				,[CancelLoan_File]
				,[SolicitorSubmissionOption]
				,[SolicitorSubmissionCompleted]
				,sqlloads.[SolicitorCode]
				,[SolicitorSubmissionDate]
				,[SolicitorSubmissionPDFID]
				,[DisbursementMakerEmailAddress]
				,[DisbursementMakerDecision]
				,[DisbursementMakerSubmissionCompleted]
				,[DisbursementMakerRejectionReason]
				,[DisbursementMakerSubmissionDate]
				,[DisbursementMakerSubmissionPDFID]
				,[DisbursementCheckerEmailAddress]
				,[DisbursementCheckerDecision]
				,[DisbursementCheckerSubmissionCompleted]
				,[DisbursementCheckerRejectionReason]
				,[DisbursementCheckerSubmissionDate]
				,[DisbursementCheckerPDFID]
				,[RCOMakerEmailAddress]
				,[RCOMakerDecision]
				,[RCOMakerSubmissionCompleted]
				,[RCOMakerRejectionReason]
				,[RCOMakerSubmissionDate]
				,[RCOMakerPDFID]
				,[RCOCheckerEmailAddress]
				,[RCOCheckerDecision]
				,[RCOCheckerSubmissionCompleted]
				,[RCOCheckerRejectionReason]
				,[RCOCheckerSubmissionDate]
				,[RCOCheckerPDFID]
				,IntSub.[CreatedDate]
				,IntSub.[UpdatedDate]
				,[FinalBillingFlag]
				,[ProjectSubmissionOption]
				,[ProjectSubmissionCompleted]
				,sqlloads.[DeveloperCode]
				,sqlloads.[ProjectCode]
				,sqlloads.[PhaseCode]
				,[DeveloperLoginID]
				,[ProjectSubmissionDate]
				,[ProjectSubmissionPDFID]
				,[PR_Stage2IFlag]
				,[PR_Stage2JFlag]
				,[PR_Stage2KFlag]
				,[PR_Stage3]
				,[PR_Stage4]
				,[PR_Stage5]
				,[PR_Stage6]
				,[PR_Stage7]
				,[PR_Stage8]
				,[PR_Stage9]
				,[Attachment1]
				,[Attachment2]
				,[DraftID]
				,phase.[SadaFlag]
				,[ConfirmationOfArchitectFlag]
				,[ConfirmationOfArchitectRemark]
				,[BillingRunningID]      	
				,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
			  FROM [dbo].ddProjectDisbursementSubmission_DisMaker IntSub
			  left join sqlloads on sqlloads.arn = IntSub.arn 
					left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
			  /*
			  left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 	
				*/
				where IntSub.arn = @arn 
				and IntSub.BillingRunningID = @billingid 

			delete from ddProjectDisbursementSubmission_DisMaker
			where arn = @arn 
				and BillingRunningID = @billingid 

			-- return RunningIDForCompletedSubmission
			SELECT top 1  @RunningIDForCompletedSubmission = RunningIDForCompletedSubmission 
			FROM ddProjectDisbursementSubmission_DisMakerHistory 
			where arn = @arn 				
			order by RunningIDForCompletedSubmission desc
		end 

	end

end