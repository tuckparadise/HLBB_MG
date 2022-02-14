CREATE     procedure [dbo].[ddProjectDisbursementSubmission_GetProjectList]
@DeveloperCode nvarchar(max) = null
as
begin
	SELECT ProjectCode, ProjectName, ProjectCode + '- ' + 	 ProjectName as Project 
  FROM [dbo].ddProjectDeveloperProjectMapping
  where DeveloperCode = @DeveloperCode
end