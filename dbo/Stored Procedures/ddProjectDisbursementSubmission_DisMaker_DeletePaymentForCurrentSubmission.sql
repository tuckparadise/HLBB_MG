CREATE             procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@billingid nvarchar(max) = null  ,
@RunningIDForCurrentSubmission nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''

	if exists 
	(
		select 1
		from ddProjectDisbursementSubmission_DisMaker
		where DisbursementMakerSubmissionCompleted = 1
			and arn = @arn 			
			and BillingRunningID = @billingid 	
	)
	begin
		set @Error = 'The record is submitted. You are not allowed to add/delete further payment until bank approve/reject the current submission'
	end 

	if (@Error ='')
	begin
		delete from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
		where arn = @arn 
			and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission			
			and BillingRunningID = @billingid 	 
	end 
	

end