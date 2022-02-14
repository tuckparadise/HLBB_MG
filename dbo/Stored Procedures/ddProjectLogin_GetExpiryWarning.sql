CREATE   procedure [dbo].[ddProjectLogin_GetExpiryWarning]
@ProjectCode nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	declare @expirydate date 

	if exists 
	(
		select 1
		from ddProject_vw_DeveloperLogin
		where ID = @ProjectCode
			and PasswordExpiryWarningDate <= getdate()
	)
	begin 
		
		select @expirydate = PasswordExpiryDate
		from ddProject_vw_DeveloperLogin
		where ID = @ProjectCode
			and PasswordExpiryWarningDate <= getdate()
			
		set @error = 'Your password is going to expired on ' +convert(varchar, @expirydate, 103)+'. Please change your password as soon as possible to avoid service interuption'

	end 
end