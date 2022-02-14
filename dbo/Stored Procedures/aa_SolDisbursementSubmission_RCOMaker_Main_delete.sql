CREATE     procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_Main_delete]
@arn nvarchar(100) = null 
as
begin
	update aaSolDisbursementSubmission
	set RCOMakerEmailAddress = null,
		RCOMakerDecision = null, 
		RCOMakerSubmissionCompleted = null, 
		RCOMakerRejectionReason = null, 
		RCOMakerSubmissionDate = null,
		RCOMakerPDFID = null
	where arn = @arn 
end