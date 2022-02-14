CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword]
@SolicitorCode nvarchar(100),
@defaultPassword nvarchar(max)  = null output
as
begin
			
	declare @random nvarchar(max),
		@random_withoutdot nvarchar(max)

	set  @random = convert (nvarchar(max), rand() ) 

	--select @random

	set @random_withoutdot = replace (@random, '.','')
	--select @random_withoutdot

	
	SELECT @defaultpassword = [password]
	from DefaultPassword_Setting
	where [type] = 'SolicitorLogin'
	
	set @defaultpassword = @defaultpassword + @random_withoutdot

	--declare @defaultpassword nvarchar(max)

	/*
	update SQLSolicitor
	set SolicitorPassword = @defaultpassword
	where SolicitorCode = @SolicitorCode
	*/
end