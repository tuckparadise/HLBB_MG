CREATE       procedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_Main_delete]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	update aaIntDisbursementSubmission
	set RCOMakerEmailAddress = null,
		RCOMakerDecision = null, 
		RCOMakerSubmissionCompleted = null, 
		RCOMakerRejectionReason = null, 
		RCOMakerSubmissionDate = null,
		RCOMakerPDFID = null
	where arn = @arn 		
end