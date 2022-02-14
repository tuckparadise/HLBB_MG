CREATE     procedure [dbo].[usp_SolicitorLoginLog_List]
as
begin

	with cte1([SolicitorCode], solicitoremail, UpdatedDate ) as (
	select [SolicitorCode], solicitoremail, UpdatedDate 
	from sqlloads 
	where solicitoremail is not null or solicitoremail <> ''
	),
	cte2 (SolicitorCode, UpdatedDate) as 
	(
		select SolicitorCode, max(UpdatedDate) as UpdatedDate
		from cte1 
		group by [SolicitorCode]		
	),	
	cte3 (SolicitorCode,SolicitorEmail) as (
	select cte1.SolicitorCode,max(cte1.SolicitorEmail)
		from cte1 
		inner join cte2 on cte2.SolicitorCode = cte1.SolicitorCode
			and cte2.UpdatedDate = cte1.UpdatedDate	
		group by cte1.SolicitorCode
	),
	cte4 ([Action],UserName,LogDatetime ) as
	(
		select 'Logout' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
		from SolicitorLogoutLog
		union 
		select 'Login' as [Action],
			UserName, 
			loginDatetime as LogDatetime
		from SolicitorUserLoginLog
	)
	select action, 
		a.UserName as [SolicitorCode]
      ,a.LogDatetime as LogDatetime      
	   ,[Status]
      ,[SolicitorName]     
      ,[SolicitorLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
	  ,cte3.SolicitorEmail as SolicitorEmail
	from cte4 a 
	inner join SQLSolicitor s on s.SolicitorCode = a.UserName
	left join cte3 on cte3.SolicitorCode = s.SolicitorCode
	order by a.LogDatetime desc 

end