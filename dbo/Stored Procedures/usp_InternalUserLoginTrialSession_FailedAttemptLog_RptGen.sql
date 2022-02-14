CREATE     procedure [dbo].[usp_InternalUserLoginTrialSession_FailedAttemptLog_RptGen]
as
begin
	select a.username as username
      ,a.[loginDatetime] as [loginDatetime]
      ,a.[CreatedDate] as [CreatedDate]
	  ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]     
      ,[IDLastLockedDatetime]
	from InternalUserLoginTrialSession_FailedAttemptLog a 
	inner join InternalUser u on u.UserName = a.username 
	order by loginDatetime desc 
end