CREATE     procedure [dbo].[ddProjectDisbursementSubmission_draft_Master_GetDraftCount]
@ProjectCode nvarchar(100) = null ,
@DraftCount int = null output
as
begin
	--set @DraftCount = 0

	set @DraftCount = (select count(*) from ddProjectDisbursementSubmission_draft_Master where DeveloperLoginID = @ProjectCode)
end