CREATE   procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_Main_delete]
@arn nvarchar(100) = null 
as
begin
	update aaSolDisbursementSubmission
	set DisbursementCheckerEmailAddress = null,
		DisbursementCheckerDecision = null, 
		DisbursementCheckerSubmissionCompleted = null, 
		DisbursementCheckerRejectionReason = null, 
		DisbursementCheckerSubmissionDate = null,
		DisbursementCheckerPDFID = null
	where arn = @arn 
end