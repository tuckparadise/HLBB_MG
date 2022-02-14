create       procedure [dbo].[ddProjectDeveloperProjectMapping_List]
@DeveloperCode nvarchar(max) = null 
as
begin
	
	select ProjectCode, ProjectName
	from ddProjectDeveloperProjectMapping
	where developercode = @developercode
end