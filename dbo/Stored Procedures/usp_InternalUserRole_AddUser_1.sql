CREATE   procedure [dbo].[usp_InternalUserRole_AddUser_1]
@UserRoleID bigint = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	delete from UserRoleMetric_staging

	insert into UserRoleMetric_staging
	select * from UserRoleMetric
	where UserRoleID= @UserRoleID

	delete from UserRoleMetric
	where UserRoleID= @UserRoleID
end