CREATE   procedure [dbo].[usp_InternalUserLoginTrial]
as
begin
	select *
	from 
	(
	select 'Login' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
	from InternalUserLogoutLog
	union 
	select 'Login' as [Action],
		UserName, 
		loginDatetime as LogDatetime
	from InternalUserLoginLog
	) tbl
	order by LogDatetime desc
end