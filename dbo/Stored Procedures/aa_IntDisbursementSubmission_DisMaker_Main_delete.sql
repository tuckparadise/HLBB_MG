CREATE     procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_Main_delete]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	update aaIntDisbursementSubmission
	set DisbursementMakerEmailAddress = null,
		DisbursementMakerDecision = null, 
		DisbursementMakerSubmissionCompleted = null, 
		DisbursementMakerRejectionReason = null, 
		DisbursementMakerSubmissionDate = null,
		DisbursementMakerSubmissionPDFID = null
	where arn = @arn 		
end