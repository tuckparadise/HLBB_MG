CREATE       procedure [dbo].[aa_IntDisbursementSubmission_DisChecker_Main_delete]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	update aaIntDisbursementSubmission
	set DisbursementCheckerEmailAddress = null,
		DisbursementCheckerDecision = null, 
		DisbursementCheckerSubmissionCompleted = null, 
		DisbursementCheckerRejectionReason = null, 
		DisbursementCheckerSubmissionDate = null,
		DisbursementCheckerPDFID = null
	where arn = @arn 		
end