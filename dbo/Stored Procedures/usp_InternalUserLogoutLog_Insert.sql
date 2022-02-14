CREATE   procedure [dbo].[usp_InternalUserLogoutLog_Insert]
@UserName nvarchar(max) = null 
as
begin

	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')						
		
	end 

	insert into InternalUserLogoutLog
	values (@UserName, getdate(), getdate())
end