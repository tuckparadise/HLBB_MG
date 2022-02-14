create    procedure [dbo].[ddProjectDisbursementSubmission_draft_getDeveloperCodeFromLoginID]
@DeveloperLoginID nvarchar(max) = null ,
@DeveloperCode nvarchar(max) = null output
as
begin
	set @DeveloperCode = (select developercode from ddProject_vw_DeveloperLogin where ID = @DeveloperLoginID)
end