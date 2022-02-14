CREATE     procedure [dbo].[ddProjectDeveloperSubUser_DeveloperList]
as
begin
	SELECT ID as DeveloperCode	  
  FROM [dbo].ddProjectDeveloper
end