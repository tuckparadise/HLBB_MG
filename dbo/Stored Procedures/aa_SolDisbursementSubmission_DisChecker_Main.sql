CREATE             procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main]
@arn nvarchar(max) = null ,
@DisbursementCheckerEmailAddress  nvarchar(max) = null ,
@DisbursementCheckerDecision nvarchar(max) = null ,
@DisbursementCheckerSubmissionCompleted nvarchar(max) = null ,
@DisbursementCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@RunningIDForCompletedSubmission bigint = null output
as
begin	
	set @Error = ''

	if (@DisbursementCheckerEmailAddress like 'K2:%')
	begin		
		set @DisbursementCheckerEmailAddress = Stuff(@DisbursementCheckerEmailAddress, 1, 3, '')					

	end 

	if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@DisbursementCheckerRejectionReason)) = '' or @DisbursementCheckerRejectionReason is null)
		begin
			set @Error = 'Please fill in Rejection Remarks'
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

	declare @SolicitorSubmissionOption nvarchar(max)
	--declare @LastMaxRunningIDForCompletedSubmission int 

	set @SolicitorSubmissionOption  = (select SolicitorSubmissionOption
	from aaSolDisbursementSubmission_DisMakerSubmission
	where arn = @arn)

	if (@Error = '')
	begin		
		if (@DisbursementCheckerSubmissionCompleted = 1)
		begin
			
			-- 20220105 - remove rejected status after action taken by maker instead of checker 
			-- 20220112 - keep it for now since there will be existing rejected data while in checker pool 
		
			delete from aaSolDisbursementSubmission_DisCheckerRejected
			where arn = @arn 

			delete from aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
			where arn = @arn 
		end 		

		if (@DisbursementCheckerDecision = 'Reject' and @DisbursementCheckerSubmissionCompleted = 1)
		begin
						
			INSERT INTO [dbo].[aaSolDisbursementSubmission_DisCheckerRejected]
           ([arn]
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
				  ,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
				  )
		   SELECT [arn]
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
			  ,null
			  ,[CreatedDate]
			  ,getdate()
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
				  ,SPADate 
				,SPAConstructionPeriodInMonths 
				,ExtendedConstructionPeriodInMonths 
		  FROM [dbo].aaSolDisbursementSubmission_DisMakerSubmission
		  where arn = @arn 

		  insert into aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
		  select * from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
		  where arn = @arn 

		  update aaSolDisbursementSubmission_DisMakerSubmission
			set DisbursementCheckerEmailAddress = null, 
				DisbursementCheckerDecision = null, 
				DisbursementCheckerSubmissionCompleted = null, 
				DisbursementCheckerRejectionReason = null,
				[DisbursementMakerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 						

			insert into MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
			from MortgageAppTaskInstance
			where workflow = 'DisbDUCheckerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbDUCheckerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())

			--start locate last  dis maker from logs and assign to him/her. 
			declare @LastDisMakerFromLog nvarchar(max)

			select top 1 @LastDisMakerFromLog= taskowner 
			from [MortgageAppTaskInstance_logs]
			where workflow = 'DisbDUMakerSolicitorApproval'
				and Completed = 1
				and arn = @arn 
				--and BillingRunningID = @billingid
			order by updateddate desc

			if (isnull(@LastDisMakerFromLog,'') <> '')
			begin
				insert into MortgageAppTaskInstance
				values ('DisbDUMakerSolicitorApproval', @arn, @LastDisMakerFromLog, getdate(), getdate(), @LastDisMakerFromLog, @LastDisMakerFromLog)

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Maker',@LastDisMakerFromLog,null,getdate())
			end 

			--end locate last  dis maker from logs and assign to him/her. .


		end 
		else
		begin
			

			update aaSolDisbursementSubmission_DisMakerSubmission
			set DisbursementCheckerEmailAddress = @DisbursementCheckerEmailAddress, 
				DisbursementCheckerDecision = @DisbursementCheckerDecision, 
				DisbursementCheckerSubmissionCompleted = @DisbursementCheckerSubmissionCompleted, 
				DisbursementCheckerRejectionReason = @DisbursementCheckerRejectionReason,				
				DisbursementCheckerSubmissionDate = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @DisbursementCheckerDecision = 'Approve' and @DisbursementCheckerSubmissionCompleted = 1)
			begin
				
				-- delete mrta data 
				delete from [aaSolDisbursementSubmission_MRTA]
				where arn = @arn

				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbDUCheckerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbDUCheckerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())

				-- 20210311- start add record in WF history for balance advice

				declare @BalanceLetterApplicable bit				

				set  @BalanceLetterApplicable = (select BalanceAdviceLetterApplicableFlag
				from aaSolDisbursementSubmission_DisMakerSubmission
				where arn = @arn )

				declare @SolicitorCode nvarchar(max)

				set @SolicitorCode = (select SolicitorCode
				from aaSolDisbursementSubmission_DisMakerSubmission
				where arn = @arn )


				if (@BalanceLetterApplicable = 1)
				begin					
					insert into WorkflowHistory
					values ('Disbursement By Solicitor',@arn,'Case Received By Solicitor(Balance Advice Applicable)',@SolicitorCode,null,getdate())
				end 
				--20210311- end add record in WF history for balance advice 

				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin

					update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					set DisCheckerEmail = @DisbursementCheckerEmailAddress,
						DisCheckerApprovedDate = getdate()
					where arn = @arn 
					
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
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail pd
						inner join aaSolDisbursementSubmission_DisMakerSubmission submission on submission.arn = pd.arn 
						left join SQLLOADS loads on loads.arn = pd.arn 
					where pd.arn = @arn 
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
						--, ProjectName
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
							--COALESCE(', ' +  RTRIM( isnull(submission.[PR_StageOthers],'') ),     '') 
							COALESCE(', ' +  RTRIM( case when ltrim(rtrim(submission.[PR_StageOthers])) = '' then null else  submission.[PR_StageOthers] end ),     '') 
							, 1, 2, '') as BillingStage 
						--, BillingStage
						, null as pdfid
						, getdate() as ProcessingDate
						, null as ExtraField2
						, null as ExtraField3
						, null as ExtraField4
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail pd
						inner join aaSolDisbursementSubmission_DisMakerSubmission submission on submission.arn = pd.arn --and pd.BillingRunningID = submission.BillingRunningID						
						left join SQLLOADS loads on loads.arn = pd.arn 
						left join ddProjectPhase phase on phase.developercode = loads.DeveloperCode and phase.projectcode = loads.projectcode and phase.phasecode = loads.phasecode
						left join ddprojectdeveloper on ddprojectdeveloper.id = loads.DeveloperCode
						left join ddProjectDeveloperProjectMapping project on project.developercode = loads.DeveloperCode and project.projectcode = loads.projectcode 
					where pd.arn = @arn 
						--and pd.BillingRunningID = @billingid 
						and PaymentReference <> 'Legal Fee' 
						and PaymentReference <> 'Valuation Fee'
						and PaymentReference <> 'Legal Fee - Principal Pymt'
						and PaymentReference <> 'Valuation Fee - Principal Pymt'
						and PaymentReference <> 'MDTA/ MRTT'
						and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'
					end 
					
					-- 20210904- end notification of payment enhancement for developer

					-- start move to RCOMaker table
					insert into aaSolDisbursementSubmission_RCOMakerSubmission
					select * 
					from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 

					insert into aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
					select * 
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
					-- end move to RCOMaker table

					
				end 
				
				-- 20210419- start audit trails for PR related info for first advice 
				if not exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmission_History h
					inner join SQLLOADS on h.arn = SQLLOADS.arn 
					where (SolicitorSubmissionOption = 'Submitted' or SolicitorSubmissionOption = 'Resubmitted') 
						and h.arn = @arn 
						and SQLLOADS.DisbursementManner = 'PR'						
					group by h.arn 
					having count(*) = 1
				)
				begin
					/*
					-- get bridging financial flag 
					declare @BridgingFinancialFlag int

					set @BridgingFinancialFlag = (select isnull(PR_AnyBridgingFinancierFlag,0) from aaSolDisbursementSubmission where arn = @arn )

					if (@BridgingFinancialFlag = 1)
					begin
						
					end 
					*/					
					-- HDA / Project Account Bank
					insert into aaDI_ProjectAccountBankAuditLog
					select 'HDA / Project Account Bank',
						'EDIT', 
						'arn',
						@arn, 
						'HDA / Project Account Bank',
						null, 
						PR_DeveloperHDABank,
						DisbursementMakerEmailAddress,
						getdate(),
						null,
						null
					from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 			
					
					--Developer’s HDA / Project Account
					insert into aaDI_ProjectAccountAuditLog
					select 'Developer’s HDA / Project Account',
						'EDIT', 
						'arn',
						@arn, 
						'Developer’s HDA / Project Account',
						null, 
						PR_DeveloperHDA,
						DisbursementMakerEmailAddress,
						getdate(),
						null,
						null
					from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 		
					
					
					--Bridging Financier Redemption Sum
					insert into aaBF_BridgingFinancierRedemptionSumAuditLog
					select 'Bridging Financier Redemption Sum',
						'EDIT', 
						'arn',
						@arn, 
						'Bridging Financier Redemption Sum',
						null, 
						PR_BridgingFinancierRedemptionSum,
						DisbursementMakerEmailAddress,
						getdate(),
						null,
						null
					from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 	

					--Redemption Payment Account Number
					insert into aaBF_RedemptionPaymentAccountNumberAuditLog
					select 'Redemption Payment Account Number',
						'EDIT', 
						'arn',
						@arn, 
						'Redemption Payment Account Number',
						null, 
						PR_RedemptionPaymentAccountNumber,
						DisbursementMakerEmailAddress,
						getdate(),
						null,
						null
					from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 	
				end 
				-- 20210419- end 

				declare @RunningIDForCompletedSubmissionMainTable bigint 

				-- 2021913- start move to history after checker approves 
				insert into aaSolDisbursementSubmission_DisMakerSubmission_History
				           ([arn]
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
						   ,SPADate 
							,SPAConstructionPeriodInMonths 
							,ExtendedConstructionPeriodInMonths 
						   )
					select  sol.[arn]
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
					   ,sol.[CreatedDate]
					   ,sol.[UpdatedDate]
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
					   ,SPADate 
						,SPAConstructionPeriodInMonths 
						,ExtendedConstructionPeriodInMonths 
				from aaSolDisbursementSubmission_DisMakerSubmission sol
				left join sqlloads on sqlloads.arn = sol.arn 
					left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
				where sol.arn = @arn 
				
				set @RunningIDForCompletedSubmissionMainTable = SCOPE_IDENTITY()

				insert into aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
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
				   ,[CreatedDate]
				   ,[UpdatedDate]
				   ,[DisMakerEmail]
				   ,[DisMakerSubmissionDate]
				   ,[DisCheckerEmail]
				   ,[DisCheckerApprovedDate]
				   ,[RCOMakerEmail]
				   ,[RCOMakerApprovedDate]
				   ,[RCOCheckerEmail]
				   ,[RCOCheckerApprovedDate]
				   ,[AccountFrom]
				   ,[RunningIDForCompletedSubmissionMainTable]

				   )
				select 
					[arn]
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
				   ,[CreatedDate]
				   ,[UpdatedDate]
				   ,[DisMakerEmail]
				   ,[DisMakerSubmissionDate]
				   ,[DisCheckerEmail]
				   ,[DisCheckerApprovedDate]
				   ,[RCOMakerEmail]
				   ,[RCOMakerApprovedDate]
				   ,[RCOCheckerEmail]
				   ,[RCOCheckerApprovedDate]
				   ,[AccountFrom]           
					,@RunningIDForCompletedSubmissionMainTable 
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 	
					
				insert into aaSolDisbursementSubmission_PaymentDetail_history
				select * from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 	
												
				insert into aaSolDisbursementSubmission_History
				select * 
				from aaSolDisbursementSubmission
				where arn = @arn 				
				-- 2021913- end move to history after checker approves 

				-- 2021913- start delete original table after saving to history
				delete from aaSolDisbursementSubmission
				where arn = @arn 

				delete from aaSolDisbursementSubmission_DisMakerSubmission
				where arn = @arn 
				
				delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 	

				delete from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 
				-- 2021913- end delete original table after saving to history

				/*
				-- 20210318 - start update PR info for billing pending LA after first advice only 
				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmission_History h
					inner join SQLLOADS on h.arn = SQLLOADS.arn 
					where (SolicitorSubmissionOption = 'Submitted' or SolicitorSubmissionOption = 'Resubmitted') 
						and h.arn = @arn 
						and SQLLOADS.DisbursementManner = 'PR'						
					group by h.arn 
					having count(*) = 1
				)
				begin
					update aaIntDisbursementSubmission  
					set	PR_DeveloperBillingDueDateFlag = his.PR_DeveloperBillingDueDateFlag,
						PR_Stage2AFlag = his.PR_Stage2AFlag,
						PR_Stage2BFlag = his.PR_Stage2BFlag,
						PR_Stage2CFlag = his.PR_Stage2CFlag,
						PR_Stage2DFlag = his.PR_Stage2DFlag,

						PR_Stage2EFlag = his.PR_Stage2EFlag,
						PR_Stage2FFlag = his.PR_Stage2FFlag,
						PR_Stage2GFlag = his.PR_Stage2GFlag,
						PR_Stage2HFlag = his.PR_Stage2HFlag,
						PR_StageOthers = his.PR_StageOthers,

						PR_EarliestBillingDueDate = his.PR_EarliestBillingDueDate,
						PR_TotalBillingAmount = his.PR_TotalBillingAmount,
						PR_AnyBridgingFinancierFlag = his.PR_AnyBridgingFinancierFlag,
						PR_BridgingFinancier = his.PR_BridgingFinancier,
						PR_BridgingFinancierEmailAddress = his.PR_BridgingFinancierEmailAddress,

						PR_BridgingFinancierRedemptionSum = his.PR_BridgingFinancierRedemptionSum,
						PR_RedemptionPaymentAccountNumber = his.PR_RedemptionPaymentAccountNumber,
						PR_BeneficiaryBank = his.PR_BeneficiaryBank,
						PR_BridgingFinancierRedemptionExpiryDate = his.PR_BridgingFinancierRedemptionExpiryDate,
						PR_DeveloperName = his.PR_DeveloperName,

						PR_DeveloperEmailAddress = his.PR_DeveloperEmailAddress,
						PR_DeveloperPIC = his.PR_DeveloperPIC,
						PR_DeveloperHDA = his.PR_DeveloperHDA,
						PR_DeveloperHDABank = his.PR_DeveloperHDABank,
						LF_PayeeName = his.LF_PayeeName,
						
						LF_BilledAmount = his.LF_BilledAmount,
						LF_AccountNumber = his.LF_AccountNumber,
						LF_Bank = his.LF_Bank,
						LF_PaymentDescription = his.LF_PaymentDescription,
						LF_PaymentMode = his.LF_PaymentMode

					from aaIntDisbursementSubmission
					inner join aaSolDisbursementSubmission_DisMakerSubmission_History his on his.arn = aaIntDisbursementSubmission.arn 
					where aaIntDisbursementSubmission.arn = @arn 
				end 				
				-- 20210318 - end update PR info for billing pending LA after first advice only 
				*/
				-- 20210311- end move to history after checker approves 

				
			end 

			if (@SolicitorSubmissionOption = 'Cancelled' and @DisbursementCheckerSubmissionCompleted = 1)
				begin
					insert into MortgageAppTaskInstance_logs 
					select [workflow]
						,[arn]
						,[TaskOwner]
						,[CreatedDate]
						,getdate()
						,[CreatedUser]
						,[UpdatedUser]
						, 0
						, 1
					from MortgageAppTaskInstance
					where workflow = 'DisbDUCheckerSolicitorApproval'
					and arn = @arn 

					delete from MortgageAppTaskInstance
					where workflow = 'DisbDUCheckerSolicitorApproval'
					and arn = @arn 

					insert into WorkflowHistory
					values ('Disbursement By Solicitor',@arn,'Cancellation Approved By Disbursement Checker',@DisbursementCheckerEmailAddress,null,getdate())

					-- move aaSolDisbursementSubmission to aaSolDisbursementSubmission_History
					insert into aaSolDisbursementSubmission_History
					select * 
					from aaSolDisbursementSubmission
					where arn = @arn 
			
					delete from aaSolDisbursementSubmission
					where arn = @arn 
					
					
					insert into aaSolDisbursementSubmission_DisMakerSubmission_History
					 ([arn]
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
						   ,SPADate 
						,SPAConstructionPeriodInMonths 
						,ExtendedConstructionPeriodInMonths 
						   )
					select sol.[arn]
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
						   ,sol.[CreatedDate]
						   ,sol.[UpdatedDate]
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
						   ,SPADate 
						,SPAConstructionPeriodInMonths 
						,ExtendedConstructionPeriodInMonths 
					from aaSolDisbursementSubmission_DisMakerSubmission sol 
					left join sqlloads on sqlloads.arn = sol.arn 
					left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
					where sol.arn = @arn 
					
					delete from aaSolDisbursementSubmission_DisMakerSubmission
					where arn = @arn 
					
					/*
					-- return RunningIDForCompletedSubmission
					SELECT top 1  @RunningIDForCompletedSubmission = RunningIDForCompletedSubmission 
					FROM aaSolDisbursementSubmission_DisMakerSubmission_History 
					where arn = @arn 				
					order by RunningIDForCompletedSubmission desc
					*/

					/*
					--declare @RunningIDForCompletedSubmission int 
					if not exists 
					(
						select 1
						from aaSolDisbursementSubmission_History
						where arn = @arn 
					)
					begin
						set @RunningIDForCompletedSubmission = 1
					end 
					else
					begin
						
						select @LastMaxRunningIDForCompletedSubmission = max(RunningIDForCompletedSubmission)
						from aaSolDisbursementSubmission_History
						where arn = @arn 

						set @RunningIDForCompletedSubmission = @LastMaxRunningIDForCompletedSubmission + 1
					end 

					insert into aaSolDisbursementSubmission_History
					select * , @RunningIDForCompletedSubmission
					from aaSolDisbursementSubmission
					where arn = @arn 
			
					delete from aaSolDisbursementSubmission
					where arn = @arn 

					-- return RunningIDForCompletedSubmission
					SELECT top 1  @RunningIDForCompletedSubmission = RunningIDForCompletedSubmission 
					FROM aaSolDisbursementSubmission_History 
					where arn = @arn 				
					order by RunningIDForCompletedSubmission desc
					*/
				end 
		end 
		
	end

end