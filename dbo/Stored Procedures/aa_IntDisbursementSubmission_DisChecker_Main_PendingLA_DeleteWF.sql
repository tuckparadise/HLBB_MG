CREATE                 procedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]
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

	if (@Error = '')
	begin						
		
		if (@DisbursementCheckerDecision = 'Approve')
		begin
			update aaIntDisbursementSubmissionPendingLA_DeleteWF
			set DisbursementCheckerEmailAddress = @DisbursementCheckerEmailAddress, 
				DisbursementCheckerDecision = @DisbursementCheckerDecision, 
				DisbursementCheckerSubmissionCompleted = @DisbursementCheckerSubmissionCompleted, 
				DisbursementCheckerRejectionReason = @DisbursementCheckerRejectionReason,	
				[DisbursementCheckerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
				and BillingRunningID = @billingid 
			
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Delete Workflow Approved By Disbursement Checker(Pending LA)',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)

			insert into aaIntDisbursementSubmissionPendingLA_DeleteWF_Log
			select * from aaIntDisbursementSubmissionPendingLA_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 

			delete from aaIntDisbursementSubmissionPendingLA_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 

			delete from aaIntDisbursementSubmission
			where arn = @arn 			
				and BillingRunningID = @billingid
		end 
		else
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Delete Workflow Rejected By Disbursement Checker(Pending LA)',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)

			/*
			insert into aaIntDisbursementSubmission
			select * from aaIntDisbursementSubmissionPendingLA_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 			
			*/

			delete from aaIntDisbursementSubmissionPendingLA_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 

			
		end 
			
	end

end