CREATE   procedure [dbo].[ddproject_DeveloperLoginTrialSession_FailedAttemptLog_RptGen]
as
begin	
	select attempt.ProjectCode as LoginID
		--,attempt.[loginDatetime] as [loginDatetime]
		,FORMAT (attempt.[loginDatetime], 'dd/MM/yyyy HH:mm:ss') as [loginDatetime]
      
      --,attempt.[CreatedDate] as [CreatedDate]
	  ,FORMAT (attempt.[CreatedDate], 'dd/MM/yyyy HH:mm:ss') as CreatedDate
	  ,[Status]
      ,developer.Name as [LoginName]
      --,LastLoginDatetime LastLoginDatetime
	  ,FORMAT (LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as LastLoginDatetime
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      --,[PasswordExpiryWarningDate]
	  ,FORMAT (PasswordExpiryWarningDate, 'dd/MM/yyyy HH:mm:ss') as PasswordExpiryWarningDate
      --,[IDLastLockedDatetime]
	  ,FORMAT (IDLastLockedDatetime, 'dd/MM/yyyy HH:mm:ss') as IDLastLockedDatetime
	  ,[Email] as [LoginEmail]
	  ,[DeveloperCode] 
	from ddProjectLoginTrialSession_FailedAttemptLog attempt 
	inner join [ddProject_vw_DeveloperLogin] developer on attempt.ProjectCode = developer.ID	
end