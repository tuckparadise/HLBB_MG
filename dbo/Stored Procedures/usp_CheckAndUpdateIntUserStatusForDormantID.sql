CREATE   procedure [dbo].[usp_CheckAndUpdateIntUserStatusForDormantID]
as
begin
	declare @InternalUserDormantIDReportPeriodInDays int 
	select @InternalUserDormantIDReportPeriodInDays = InternalUserDormantIDReportPeriodInDays
	from settings 
		

	update InternalUser
	set status = 'Inactive',
		IDLastLockedDatetime = getdate()
	--where DATEADD(DAY, @InternalUserDormantIDReportPeriodInDays, LastLoginDatetime) < getdate() 
	where CONVERT(DATETIME, CONVERT(DATETIME, DATEADD(DAY, @InternalUserDormantIDReportPeriodInDays, LastLoginDatetime))) < getdate() 
		and IDLastLockedDatetime is null 

end