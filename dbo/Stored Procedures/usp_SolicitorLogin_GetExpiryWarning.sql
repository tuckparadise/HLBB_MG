CREATE procedure [dbo].[usp_SolicitorLogin_GetExpiryWarning]
@scode nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	declare @expirydate date 

	if exists 
	(
		select 1
		from SQLSolicitor
		where SolicitorCode = @scode
			and PasswordExpiryWarningDate <= getdate()
	)
	begin 
		
		select @expirydate = PasswordExpiryDate
		from SQLSolicitor
		where SolicitorCode = @scode
			and PasswordExpiryWarningDate <= getdate()
			
		set @error = 'Your password is going to expired on ' +convert(varchar, @expirydate, 103)+'. Please change your password as soon as possible to avoid service interuption'

	end 
end