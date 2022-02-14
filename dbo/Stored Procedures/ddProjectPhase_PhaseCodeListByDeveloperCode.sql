create   procedure [dbo].[ddProjectPhase_PhaseCodeListByDeveloperCode]
@devcode nvarchar(max) = null ,
@Projcode nvarchar(max) = null 
as
begin
		
	select distinct PhaseCode, PhaseName
	from SQLLOADS
	where DeveloperCode = @devcode
		and ProjectCode = @Projcode
		and PhaseCode not in (select PhaseCode from ddProjectPhase 
								where 
								DeveloperCode = @devcode
								and ProjectCode = @Projcode)
	
end