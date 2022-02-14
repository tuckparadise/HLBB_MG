create   procedure [dbo].[ddProject_Admin_PasswordReset_SaveLog]
@ID nvarchar(max) = null ,
@LoginUserEmail nvarchar(max) = null 
as
begin
	if (@LoginUserEmail like 'K2:%')
	begin		
		set @LoginUserEmail = Stuff(@LoginUserEmail, 1, 3, '')					
	end 

	insert into ddProject_PasswordReset_Log
	values (@ID,@LoginUserEmail,getdate()) 
end