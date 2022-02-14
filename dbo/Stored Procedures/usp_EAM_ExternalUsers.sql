CREATE   procedure [dbo].[usp_EAM_ExternalUsers]
as
begin
	select 
		solicitorcode as LoginID, 
		SolicitorName as Name, 
		'true' as SolicitorAccess, 
		 'false' as ValuerAccess,
		 'false' as DeveloperAccess
	from sqlsolicitor 
	union all
	select
		valuercode as LoginID, 
		ValuerName as Name, 
		'false' as SolicitorAccess, 
		 'true' as ValuerAccess,
		 'false' as DeveloperAccess
	from sqlValuer 
	union
	select id as LoginID,
		[name] as [Name],
		'false' as SolicitorAccess, 
		 'false' as ValuerAccess,
		 'true' as DeveloperAccess
	from ddProject_vw_DeveloperLogin

end