CREATE procedure [dbo].[usp_CheckAndUpdateExtUserStatusForDormantID]
as
begin
	declare @SolicitorDormantIDReportPeriodInDays int 
	select @SolicitorDormantIDReportPeriodInDays = SolicitorDormantIDReportPeriodInDays
	from settings 
		
	update SQLSolicitor
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @SolicitorDormantIDReportPeriodInDays, SolicitorLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @SolicitorDormantIDReportPeriodInDays, SolicitorLastLoginDatetime))) < getdate() 
		and IDLastLockedDatetime is null 

	declare @ValuerDormantIDReportPeriodInDays int 
	select @ValuerDormantIDReportPeriodInDays = ValuerDormantIDReportPeriodInDays
	from settings 

	update SQLValuer 
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime))) < getdate()
		and IDLastLockedDatetime is null 
	
	declare @DeveloperDormantIDReportPeriodInDays int 
	select @DeveloperDormantIDReportPeriodInDays = ProjectDormantIDReportPeriodInDays
	from ddSettingsExt

	update ddProjectDeveloper 
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @DeveloperDormantIDReportPeriodInDays, LastLoginDatetime))) < getdate()
		and IDLastLockedDatetime is null 

	update ddProjectDeveloperSubUser 
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @ValuerDormantIDReportPeriodInDays, ValuerLastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @DeveloperDormantIDReportPeriodInDays, LastLoginDatetime))) < getdate()
		and IDLastLockedDatetime is null 
end