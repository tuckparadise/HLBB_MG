CREATE       procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main_delete]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	update aaIntDisbursementSubmission
	set RCOCheckerEmailAddress = null,
		RCOCheckerDecision = null, 
		RCOCheckerSubmissionCompleted = null, 
		RCOCheckerRejectionReason = null, 
		RCOCheckerSubmissionDate = null,
		RCOCheckerPDFID = null
	where arn = @arn 		
end