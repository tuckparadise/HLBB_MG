CREATE       procedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main_delete]
@arn nvarchar(100) = null 
as
begin
	update aaSolDisbursementSubmission
	set RCOCheckerEmailAddress = null,
		RCOCheckerDecision = null, 
		RCOCheckerSubmissionCompleted = null, 
		RCOCheckerRejectionReason = null, 
		RCOCheckerSubmissionDate = null,
		RCOCheckerPDFID = null
	where arn = @arn 
end