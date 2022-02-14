create     procedure [dbo].[ddProjectDisbursementSubmission_ws_PDF_GetARN]
@draftID bigint = null 
as
begin	
	
	select arn 
	from ddProjectDisbursementSubmission_draft_Staging
	where draftID  = @draftID 
	
end