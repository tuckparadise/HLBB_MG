CREATE       procedure [dbo].[ddProject_DeveloperLoginLog_List]
as
begin

	with cte4 ([Action],UserName,LogDatetime ) as
	(
		select 'Logout' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
		from ddProjectLogoutLog
		union 
		select 'Login' as [Action],
			UserName, 
			loginDatetime as LogDatetime
		from ddProjectUserLoginLog
	)
	select [Action]
		,a.UserName as LoginID
      --,a.LogDatetime as LogDatetime      
	  ,FORMAT (a.LogDatetime, 'dd/MM/yyyy HH:mm:ss') as LogDatetime
	   ,[Status]
      ,l.Name as LoginName     
      --,LastLoginDatetime
	  ,FORMAT (LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as LastLoginDatetime
      ,[PasswordForceReset]
      --,[PasswordExpiryDate]
	  ,FORMAT (PasswordExpiryDate, 'dd/MM/yyyy HH:mm:ss') as PasswordExpiryDate
      --,[PasswordExpiryWarningDate]
      --,[IDLastLockedDatetime]
	  ,FORMAT ([IDLastLockedDatetime], 'dd/MM/yyyy HH:mm:ss') as [IDLastLockedDatetime]
	  ,l.Email as LoginEmail
	from cte4 a 
	inner join [ddProject_vw_DeveloperLogin] l on l.ID = a.UserName	
	order by a.LogDatetime desc 

end