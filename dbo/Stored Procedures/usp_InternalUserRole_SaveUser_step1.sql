CREATE     procedure [dbo].[usp_InternalUserRole_SaveUser_step1]
@UserName nvarchar(max) = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	delete from UserRoleMetric
	where username = @username 
end