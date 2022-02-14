create   procedure [dbo].[ddProject_Admin_PaymentHistory_GetProjectCode]
@DeveloperCode nvarchar(max) = null 
as
begin
	select ProjCode.ProjectCode, ProjDetail.ProjectName as ProjectName, ProjCode.ProjectCode + '-' + ProjDetail.ProjectName as [Project]
	from (select distinct ProjectCode
			from ddProjectPhase	
			where DeveloperCode = @DeveloperCode
	)	ProjCode	
		inner join ddProjectDeveloperProjectMapping ProjDetail on ProjDetail.ProjectCode = ProjCode.ProjectCode
	

end