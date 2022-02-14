CREATE   procedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword]
@ID nvarchar(100),
@defaultPassword nvarchar(max)  = null output
as
begin
	
	declare @random nvarchar(max),
		@random_withoutdot nvarchar(max)

	set  @random = convert (nvarchar(max), rand() ) 

	--select @random

	set @random_withoutdot = replace (@random, '.','')
	--select @random_withoutdot

	--declare @defaultpassword nvarchar(max)

	select @defaultpassword = [password]
	from defaultpassword_setting
	where type = 'DeveloperLogin'

	set @defaultpassword = @defaultpassword + @random_withoutdot
	/*
	update SQLValuer
	set ValuerPassword = @defaultpassword
	where ValuerCode = @ValuerCode
	*/
end