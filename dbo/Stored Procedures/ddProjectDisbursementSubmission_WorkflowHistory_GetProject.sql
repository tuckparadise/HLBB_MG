create   procedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetProject]
  @DeveloperCode nvarchar(max) = null 
  as
  begin
	select projectcode, projectname
	from ddProjectDeveloperProjectMapping
	where DeveloperCode = @DeveloperCode
  end