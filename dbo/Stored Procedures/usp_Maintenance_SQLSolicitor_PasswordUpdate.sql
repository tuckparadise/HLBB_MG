CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate]
@SolicitorCode nvarchar(100),
@SolicitorNewPassword nvarchar(100) = null,
@SolicitorNewPasswordConfirmation nvarchar(100) = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		--@SolicitorEnterredPassword is null or
		--rtrim(ltrim(@SolicitorEnterredPassword)) = ''  or
		@SolicitorNewPassword is null or
		rtrim(ltrim(@SolicitorNewPassword)) = '' or
		@SolicitorNewPasswordConfirmation is null or
		rtrim(ltrim(@SolicitorNewPasswordConfirmation)) = '' 
	)
	begin
		set @Error = 'Please fill in all mandatory fields'
	end 
	else
	begin 
		if (@SolicitorNewPasswordConfirmation <> @SolicitorNewPassword)
		begin
			set @Error = 'New Password and New Password Confirmation are not the same'
		end 
		else 
		begin 
			
			if not exists 
			(
				select 1 
				from sqlSolicitor 
				where SolicitorCode = @SolicitorCode
			)
			begin
				set @Error = 'Solicitor Code does not exists in the system'
			end 
			else
			begin
				if not exists 
				(
					select 1 
					from sqlSolicitor 
					where SolicitorCode = @SolicitorCode
						and status = 'Active'
				)
				begin
					set @Error = 'Solicitor Code is not Active in the system'
				end 
				else
				begin					
					-- password requirement check

					declare @minlength int 
					select @minlength = SolicitorPasswordMinCharacters
					from settings 

					if (len(@SolicitorNewPassword)<@minlength)
					BEGIN
						--set @Error = @Error + 'New Password must have at least 12 characters<br>' 
						set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
					END 
		
					if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @SolicitorNewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
					begin 		
						set @Error = @Error + 'New Password must have at least 1 lowercase character<br>'
					end	
	
					if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @SolicitorNewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
					begin 		
						set @Error = @Error + 'New Password must have at least 1 uppercase character<br>'
					end	

					if ( PATINDEX('%[0-9]%', @SolicitorNewPassword) = 0)	
					begin 
						set @Error = @Error + 'New Password must have at least 1 number<br>'
					end 	

					if ( PATINDEX('%[^A-Za-z0-9, ]%', @SolicitorNewPassword) = 0)	
					begin 
						set @Error = @Error + 'New Password must have at least 1 special character<br>'
					end 						
				end 
			end 												
		end 
	end 

	
 
end