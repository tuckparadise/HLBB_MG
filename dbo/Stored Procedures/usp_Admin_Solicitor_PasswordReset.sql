CREATE procedure [dbo].[usp_Admin_Solicitor_PasswordReset]
@SolicitorCode nvarchar(max),
@LoginUserEmail nvarchar(max) = null, 	
@DecryptedDefaultPassword nvarchar(max) = null output 
as
begin

	--set @Error = ''

	--declare @defaultpassword nvarchar(max)

	declare @defaultpassword nvarchar(max)

	declare @random nvarchar(max),
		@random_withoutdot nvarchar(max)

	set  @random = convert (nvarchar(max), rand() ) 

	--select @random

	set @random_withoutdot = replace (@random, '.','')

	select @defaultpassword = [password]
	from [DefaultPassword_Setting]
	where [type] = 'SolicitorLogin'

	set @DecryptedDefaultPassword = @defaultpassword + @random_withoutdot
	/*
	if (@Error = '')
	BEGIN 
		update sqlSolicitor 
		set 
			SolicitorPassword = @defaultpassword,			
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate()
		where SolicitorCode= @SolicitorCode	 	
	END 
	*/
end