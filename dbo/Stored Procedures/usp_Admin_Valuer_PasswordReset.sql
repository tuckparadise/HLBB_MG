CREATE procedure [dbo].[usp_Admin_Valuer_PasswordReset]
@ValuerCode nvarchar(max),
@LoginUserEmail nvarchar(max) = null, 	
@DecryptedDefaultPassword nvarchar(max) = null output 
as
begin

	--set @Error = ''

	declare @defaultpassword nvarchar(max)

	declare @random nvarchar(max),
		@random_withoutdot nvarchar(max)

	set  @random = convert (nvarchar(max), rand() ) 

	--select @random

	set @random_withoutdot = replace (@random, '.','')
	--select @random_withoutdot


	select @defaultpassword = [password]
	from [DefaultPassword_Setting]
	where [type] = 'ValuerLogin'

	set @DecryptedDefaultPassword = @defaultpassword + @random_withoutdot
	/*
	if (@Error = '')
	BEGIN 
		update sqlValuer 
		set 
			ValuerPassword = @defaultpassword,			
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate()
		where ValuerCode= @ValuerCode	 	
	END 
	*/
end