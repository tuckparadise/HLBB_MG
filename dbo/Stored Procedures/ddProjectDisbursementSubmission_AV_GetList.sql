create         procedure [dbo].[ddProjectDisbursementSubmission_AV_GetList]
as
begin

	select draftID, arn 	
	from ddProjectDisbursementSubmission_staging 	
	where  ProjectSubmissionPDFID is not null and ProjectSubmissionPDFID <> 0

end