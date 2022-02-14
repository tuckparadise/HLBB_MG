CREATE    procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_PendingLA_DeleteWF]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@DisbursementMakerEmailAddress  nvarchar(max) = null ,
@DisbursementMakerDecision nvarchar(max) = null ,
@DisbursementMakerSubmissionCompleted nvarchar(max) = null ,
@DisbursementMakerRejectionReason nvarchar(max) = null ,
@BalanceAdviceLetterApplicableFlag bit = null 
,@UrgentFlag bit = null 
,@LS_RedemptionDueDateFlag bit = null 
,@LS_RedemptionDueDate datetime = null 
,@LS_ExtendedCompletionDateFlag bit = null 
,@LS_CompletionDate datetime = null 
,@LS_ExtendedCompletionDate datetime = null 
,@PR_DeveloperBillingDueDateFlag bit = null 
,@PR_Stage2AFlag bit = null 
,@PR_Stage2BFlag bit = null 
,@PR_Stage2CFlag bit = null 
,@PR_Stage2DFlag bit = null 
,@PR_Stage2EFlag bit = null 
,@PR_Stage2FFlag bit = null 
,@PR_Stage2GFlag bit = null 
,@PR_Stage2HFlag bit = null 
,@PR_StageOthers nvarchar(max) = null 
,@PR_EarliestBillingDueDate datetime = null 
,@PR_TotalBillingAmount nvarchar(max) = null 
,@PR_AnyBridgingFinancierFlag bit = null 
,@PR_BridgingFinancier nvarchar(max) = null 
,@PR_BridgingFinancierEmailAddress nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionSum nvarchar(max) = null 
,@PR_RedemptionPaymentAccountNumber nvarchar(max) = null 
,@PR_BeneficiaryBank nvarchar(max) = null 
,@PR_BridgingFinancierRedemptionExpiryDate datetime = null 
,@PR_DeveloperName nvarchar(max) = null 
,@PR_DeveloperEmailAddress nvarchar(max) = null 
,@PR_DeveloperPIC nvarchar(max) = null 
,@PR_DeveloperHDA nvarchar(max) = null 
,@PR_DeveloperHDABank nvarchar(max) = null 
,@LF_PayeeName nvarchar(max) = null 
,@LF_BilledAmount nvarchar(max) = null 
,@LF_AccountNumber nvarchar(max) = null 
,@LF_Bank nvarchar(max) = null 
,@LF_PaymentDescription nvarchar(max) = null 
,@LF_PaymentMode nvarchar(max) = null 
,@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@DisbursementMakerEmailAddress like 'K2:%')
	begin		
		set @DisbursementMakerEmailAddress = Stuff(@DisbursementMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 


	if (@Error = '')
	begin						
		
		update aaIntDisbursementSubmission
		set DisbursementMakerDecision = 'Delete Workflow',
			DisbursementMakerEmailAddress = @DisbursementMakerEmailAddress,
			DisbursementMakerSubmissionDate = getdate(),
			DisbursementMakerSubmissionCompleted = 1
		where arn = @arn 
			and BillingRunningID = @billingid
		
		 insert into aaIntDisbursementSubmissionPendingLA_DeleteWF
		select * from aaIntDisbursementSubmission
		where arn = @arn 
			and BillingRunningID = @billingid
		
		/*
		delete from aaIntDisbursementSubmission
		where arn = @arn 
			and BillingRunningID = @billingid
		*/

		 --if (@DisbursementMakerSubmissionCompleted=1)
		 --begin
			
			--if (@DisbursementMakerDecision = 'Delete Workflow' and @DisbursementMakerSubmissionCompleted=1)
			--begin
				--delete aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				--where arn = @arn and BillingRunningID = @billingid  

				insert into WorkflowHistory_Billing
				values ('Progressive Billing',@arn,'Delete Workflow By Disbursement Maker(Pending LA)',@DisbursementMakerEmailAddress,null,getdate(), @billingid)
			--end 
		 --end
		 
		
	end

	

end