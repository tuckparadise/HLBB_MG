CREATE     procedure [dbo].[aa_ws_SolicitorDisbursementSubmission_getallARNInStaging]
as
begin
	select arn from aaSolDisbursementSubmission_staging 
	where SolicitorSubmissionPDFID is not null and SolicitorSubmissionPDFID <> 0
		and arn not in (select arn from aaSolDisbursementSubmission)
end