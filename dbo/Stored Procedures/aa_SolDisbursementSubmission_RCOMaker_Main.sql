/*
select * from aaSolDisbursementSubmission_DisMakerSubmission

select * into aaSolDisbursementSubmission_RCOMakerSubmission_History from aaSolDisbursementSubmission_DisMakerSubmission_History

select * into aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history

truncate table aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history

update aaSolDisbursementSubmission_DisMakerSubmission
set BalanceAdviceLetterApplicableFlag = 1,
	DisbursementCheckerSubmissionCompleted = 0
where arn = 'TAI/RB/2019/Z0002023'



--[aa_SolDisbursementSubmission_DisChecker_Main] 'arn20', 'jason@jason.com', 'approve', 0, 'aaa'
*/

CREATE            procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main]
@arn nvarchar(max) = null ,
@RCOMakerEmailAddress  nvarchar(max) = null ,
@RCOMakerDecision nvarchar(max) = null ,
@RCOMakerSubmissionCompleted nvarchar(max) = null ,
@RCOMakerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@RCOMakerEmailAddress like 'K2:%')
	begin		
		set @RCOMakerEmailAddress = Stuff(@RCOMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@RCOMakerRejectionReason)) = '' or @RCOMakerRejectionReason is null)
		begin
			set @Error = 'Please fill in Rejection Remarks'
		end 
	end 

	if (@Error = '')
	begin		
		/*
		delete from [aaSolDisbursementSubmission_RCOMakerRejected]
		where arn = @arn 
		*/
		
		/*
		if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
		begin
						
			
			INSERT INTO [dbo].[aaSolDisbursementSubmission_RCOMakerRejected]
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
			   ,[UpdatedDate])
		   
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
				  ,[DisbursementCheckerEmailAddress]
				  ,[DisbursementCheckerDecision]
				  ,[DisbursementCheckerSubmissionCompleted]
				  ,[DisbursementCheckerRejectionReason]
				  ,[DisbursementCheckerSubmissionDate]
				  ,[DisbursementCheckerPDFID]
				  ,@RCOMakerEmailAddress
				  ,@RCOMakerDecision
				  ,@RCOMakerSubmissionCompleted
				  ,@RCOMakerRejectionReason
				  ,getdate()
				  ,null
				  ,[RCOCheckerEmailAddress]
				  ,[RCOCheckerDecision]
				  ,[RCOCheckerSubmissionCompleted]
				  ,[RCOCheckerRejectionReason]
				  ,[RCOCheckerSubmissionDate]
				  ,[RCOCheckerPDFID]
				  ,[CreatedDate]
				  ,getdate()
			  FROM [dbo].aaSolDisbursementSubmission_DisMakerSubmission
			  where arn = @arn 

			  update aaSolDisbursementSubmission_DisMakerSubmission
				set [RCOMakerEmailAddress] = null, 
					[RCOMakerDecision] = null, 
					[RCOMakerSubmissionCompleted] = null, 
					[RCOMakerRejectionReason] = null,
					RCOMakerSubmissionDate = null,
					[DisbursementCheckerSubmissionCompleted] = 0, 
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
			where workflow = 'DisbRCOMakerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbRCOMakerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By RCO Maker',@RCOMakerEmailAddress,null,getdate())

		end 
		else
		begin
			update aaSolDisbursementSubmission_DisMakerSubmission
			set [RCOMakerEmailAddress] = @RCOMakerEmailAddress, 
				[RCOMakerDecision] = @RCOMakerDecision, 
				[RCOMakerSubmissionCompleted] = @RCOMakerSubmissionCompleted, 
				[RCOMakerRejectionReason] = @RCOMakerRejectionReason,				
				RCOMakerSubmissionDate = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 

			declare @SolicitorSubmissionOption nvarchar(max)

			select @SolicitorSubmissionOption  = SolicitorSubmissionOption
			from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @RCOMakerDecision = 'Approve' and @RCOMakerSubmissionCompleted = 1)
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
				where workflow = 'DisbRCOMakerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbRCOMakerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By RCO Maker',@RCOMakerEmailAddress,null,getdate())

				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin

					update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					set RCOMakerEmail = @RCOMakerEmailAddress,
						RCOMakerApprovedDate = getdate()
					where arn = @arn 

				end 
			end 

			
		end 
		*/

		update aaSolDisbursementSubmission_RCOMakerSubmission
		set [RCOMakerEmailAddress] = @RCOMakerEmailAddress, 
			[RCOMakerDecision] = @RCOMakerDecision, 
			[RCOMakerSubmissionCompleted] = @RCOMakerSubmissionCompleted, 
			[RCOMakerRejectionReason] = @RCOMakerRejectionReason,				
			RCOMakerSubmissionDate = getdate(),
			[UpdatedDate] = getdate()
		where arn = @arn 

		declare @SolicitorSubmissionOption nvarchar(max)

		select @SolicitorSubmissionOption  = SolicitorSubmissionOption
		from aaSolDisbursementSubmission_RCOMakerSubmission
		where arn = @arn

		if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @RCOMakerDecision = 'Approve' and @RCOMakerSubmissionCompleted = 1)
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
			where workflow = 'DisbRCOMakerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbRCOMakerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Approved By RCO Maker',@RCOMakerEmailAddress,null,getdate())

			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
				where arn = @arn 
			)
			begin

				update aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
				set RCOMakerEmail = @RCOMakerEmailAddress,
					RCOMakerApprovedDate = getdate()
				where arn = @arn 

			end 

			-- 20210311- move aaSolDisbursementSubmission_RCOMakerSubmission and aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail to history
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_RCOMakerSubmission
				where RCOMakerSubmissionCompleted = 1 
					and arn = @arn 
			)
			begin
			
				insert into aaSolDisbursementSubmission_RCOMakerSubmission_History
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
				   ,[ConfirmationOfArchitectRemark])
				select [arn]
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
				from aaSolDisbursementSubmission_RCOMakerSubmission
				where arn = @arn 
			
				declare @RunningIDForCompletedSubmissionMainTable bigint 

				set @RunningIDForCompletedSubmissionMainTable = SCOPE_IDENTITY()

				delete from aaSolDisbursementSubmission_RCOMakerSubmission
				where arn = @arn 

				-- move aaSolDisbursementSubmission_PaymentDetail to aaSolDisbursementSubmission_PaymentDetail_history
				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin				
				
					insert into aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history
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
					   ,[RunningIDForCompletedSubmissionMainTable])
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
					from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
					where arn = @arn 

					delete from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
					where arn = @arn					

				end 
			
			
			end 
		
		end 

		
	end

end