create       procedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetARNList_ByDraft]
@DraftID bigint = null ,
@error nvarchar(max) = null output
as
begin	
	
	select distinct arn from ddProjectDisbursementSubmission_draft_Staging
	where draftid = @DraftID

end