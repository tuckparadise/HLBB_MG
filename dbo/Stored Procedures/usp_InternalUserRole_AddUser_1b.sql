CREATE     procedure [dbo].[usp_InternalUserRole_AddUser_1b]
@UserName nvarchar(max) = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	delete from UserRoleMetric_staging

	insert into UserRoleMetric_staging
	select * from UserRoleMetric
	where UserName= @UserName

	delete from UserRoleMetric
	where UserName= @UserName

	
end