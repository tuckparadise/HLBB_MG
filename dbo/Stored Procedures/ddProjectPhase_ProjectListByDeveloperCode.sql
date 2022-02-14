CREATE     procedure [dbo].[ddProjectPhase_ProjectListByDeveloperCode]
@DeveloperCode nvarchar(max) = null
as
begin
	SELECT ProjectCode	,DeveloperCode, ProjectName, 	ProjectCode + '-' + ProjectName as Project
  FROM [dbo].ddProjectDeveloperProjectMapping
  where DeveloperCode = @DeveloperCode
end