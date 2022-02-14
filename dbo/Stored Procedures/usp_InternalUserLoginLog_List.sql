CREATE   procedure [dbo].[usp_InternalUserLoginLog_List]
as
begin
	select tbl.*,u.UserEmail,  u.UserFullName, u.Branch
	from 
	(
	select 'Logout' as [Action],
		UserName, 
		logoutDatetime as LogDatetime
	from InternalUserLogoutLog
	union 
	select 'Login' as [Action],
		UserName, 
		loginDatetime as LogDatetime
	from InternalUserLoginLog
	) tbl
	inner join InternalUser u on u.UserName = tbl.username 
	order by LogDatetime desc
end