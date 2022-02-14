CREATE   procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_Main_delete]
@arn nvarchar(100) = null 
as
begin
	update aaSolDisbursementSubmission
	set DisbursementMakerEmailAddress = null,
		DisbursementMakerDecision = null, 
		DisbursementMakerSubmissionCompleted = null, 
		DisbursementMakerRejectionReason = null, 
		DisbursementMakerSubmissionDate = null,
		DisbursementMakerSubmissionPDFID = null
	where arn = @arn 
end