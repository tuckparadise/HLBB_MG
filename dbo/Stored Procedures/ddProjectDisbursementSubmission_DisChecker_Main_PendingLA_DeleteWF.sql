CREATE                   procedure [dbo].[ddProjectDisbursementSubmission_DisChecker_Main_PendingLA_DeleteWF]
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

	end 

	if (@Error = '')
	begin						
		
		if (@DisbursementCheckerDecision = 'Approve')
		begin
			update ddProjectDisbursementSubmission_DeleteWF
			set DisbursementCheckerEmailAddress = @DisbursementCheckerEmailAddress, 
				DisbursementCheckerDecision = @DisbursementCheckerDecision, 
				DisbursementCheckerSubmissionCompleted = @DisbursementCheckerSubmissionCompleted, 
				DisbursementCheckerRejectionReason = @DisbursementCheckerRejectionReason,	
				[DisbursementCheckerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
				and BillingRunningID = @billingid 
			
			insert into WorkflowHistory_ProjectBilling
			values ('Disbursement By Developer- Disbursement Checker',@arn,'Delete Workflow Approved By Disbursement Checker(Pending LA)',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)

			insert into ddProjectDisbursementSubmission_DeleteWF_log
			select * from ddProjectDisbursementSubmission_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 

			delete from ddProjectDisbursementSubmission_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 

			delete from ddProjectDisbursementSubmission_DisMaker
			where arn = @arn 			
				and BillingRunningID = @billingid
		end 
		else
		begin
			insert into WorkflowHistory_ProjectBilling
			values ('Disbursement By Developer- Disbursement Checker',@arn,'Delete Workflow Rejected By Disbursement Checker(Pending LA)',@DisbursementCheckerEmailAddress,null,getdate(), @billingid)

			delete from ddProjectDisbursementSubmission_DeleteWF
			where arn = @arn 			
				and BillingRunningID = @billingid 
			
		end 
			
	end

end