CREATE     procedure [dbo].[ddproject_DeveloperLogin_DormantID_RptGen]
@error nvarchar(max) = null output 
as
begin
	declare @dormantIDday int 	;
	declare @lastactivedate datetime ;
	
	select @dormantIDday = ProjectDormantIDReportPeriodInDays
	from ddSettingsExt;

	set @lastactivedate = DATEADD(DAY, - @dormantIDday, getdate());

	select [ID]  as LoginID , 
		--[LastLoginDatetime] as [LastLoginDatetime], 
		FORMAT (LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as LastLoginDatetime,
		--[IDLastLockedDatetime] as [IDLastLockedDatetime],
		FORMAT (IDLastLockedDatetime, 'dd/MM/yyyy HH:mm:ss') as IDLastLockedDatetime,
		 [Status]
      ,[Name] as LoginName            
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      --,[PasswordExpiryWarningDate]    
	  ,FORMAT (PasswordExpiryWarningDate, 'dd/MM/yyyy HH:mm:ss') as PasswordExpiryWarningDate
	  ,[Email] as LoginEmail
	from [ddProject_vw_DeveloperLogin] dlogin		
	where CONVERT(DATETIME, CONVERT(DATE, DATEADD(DAY, @dormantIDday, [LastLoginDatetime]))) < getdate() 
		and dlogin.Status = 'Inactive'
end