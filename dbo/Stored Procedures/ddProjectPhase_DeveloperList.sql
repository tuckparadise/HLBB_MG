CREATE     procedure [dbo].[ddProjectPhase_DeveloperList]
as
begin
	select ddProjectDeveloper.[name] as DeveloperName, ddProjectDeveloper.id as DeveloperCode, ddProjectDeveloper.id + '-' + ddProjectDeveloper.[name] as [Developer]
	from (
	SELECT distinct DeveloperCode	  
  FROM [dbo].ddProjectDeveloperProjectMapping
  ) tbl 
  inner join ddProjectDeveloper on ddProjectDeveloper.id = tbl.DeveloperCode

end