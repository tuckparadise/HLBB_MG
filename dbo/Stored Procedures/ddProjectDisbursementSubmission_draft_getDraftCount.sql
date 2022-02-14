CREATE         procedure [dbo].[ddProjectDisbursementSubmission_draft_getDraftCount]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@DraftCount int = null output 
as
begin

	set @DraftCount = (select count(*) from [ddProjectDisbursementSubmission_draft_PermenentTempTable] t 
	where t.DeveloperCode = @DeveloperCode
		--AND t.ProjectCode = @ProjectCode
		AND t.PhaseCode = @PhaseCode
		AND t.developerLoginID = @DeveloperLoginID )
	
end