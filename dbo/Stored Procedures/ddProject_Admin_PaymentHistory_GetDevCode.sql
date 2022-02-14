create   procedure [dbo].[ddProject_Admin_PaymentHistory_GetDevCode]
as
begin
	select DevCode.DeveloperCode, DevDetail.[Name] as DeveloperName, DevCode.DeveloperCode + '-' + DevDetail.[Name] as [Developer]
	from (select distinct developercode
	from ddProjectPhase	
	)	DevCode	
		inner join ddProjectDeveloper DevDetail on DevDetail.id = DevCode.developercode
end