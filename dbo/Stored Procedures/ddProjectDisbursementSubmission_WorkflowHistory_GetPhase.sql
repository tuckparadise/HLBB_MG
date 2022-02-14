create   procedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_GetPhase]
  @DeveloperCode nvarchar(max) = null   ,
  @ProjectCode nvarchar(max) = null   
  as
  begin
	select distinct phasecode, phasename, null as projectcode, null as projectname
	from ddProjectPhase p
	inner join ddProjectDeveloperProjectMapping m on m.DeveloperCode = p.DeveloperCode
	where p.DeveloperCode = @DeveloperCode
		and p.projectcode = case isnull(@ProjectCode,'') when '' then '*' else @ProjectCode end 
  end