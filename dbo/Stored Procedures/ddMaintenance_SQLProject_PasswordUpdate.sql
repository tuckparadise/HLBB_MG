CREATE     procedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate]
@Code nvarchar(100),
@NewPassword nvarchar(100) = null,
@NewPasswordConfirmation nvarchar(100) = null,
@CurrentPassword nvarchar(100) = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	--declare @IsSubUser bit 

	--set @IsSubUser = (select [IsSubUser] from ddProject_vw_DeveloperLogin where ID = @Code)

	if (				
		@NewPassword is null or
		rtrim(ltrim(@NewPassword)) = '' or
		@NewPasswordConfirmation is null or
		rtrim(ltrim(@NewPasswordConfirmation)) = '' 
	)
	begin
		set @Error = 'Please fill in all mandatory fields'
	end 
	else
	begin 
		if (@NewPasswordConfirmation <> @NewPassword)
		begin
			set @Error = 'New Password and New Password Confirmation are not the same'
		end 
		else 
		begin 			
			if not exists 
			(
				select 1 
				from ddProject_vw_DeveloperLogin 
				where ID = @Code
			)
			begin
				set @Error = 'ID does not exists in the system'
			end 
			else
			begin
				if not exists 
				(
					select 1 
					from ddProject_vw_DeveloperLogin 
					where ID = @Code
						and [status] = 'Active'
				)
				begin
					set @Error = 'ID is not active in the system'
				end 
				else
				begin						
					-- password requirement check

					declare @minlength int 
					select @minlength = ProjectPasswordMinCharacters
					from ddSettingsExt 

					if (len(@NewPassword)<@minlength)
					BEGIN
						--set @Error = @Error + 'New Password must have at least 12 characters<br>' 
						set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
						--set @error = 'New Password must have at least ' + str(@minlength)+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case<br>'
					END 
		
					if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @NewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
					begin 		
						set @Error = @Error + 'New Password must have at least 1 lowercase character<br>'
						--set @error = 'New Password must have at least ' + str(@minlength)+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case<br>'
					end	
	
					if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @NewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
					begin 		
						set @Error = @Error + 'New Password must have at least 1 uppercase character<br>'
						--set @error = 'New Password must have at least ' + str(@minlength)+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case<br>'
					end	

					if ( PATINDEX('%[0-9]%', @NewPassword) = 0)	
					begin 
						set @Error = @Error + 'New Password must have at least 1 number<br>'
						--set @error = 'New Password must have at least ' + str(@minlength)+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case<br>'
					end 	

					if ( PATINDEX('%[^A-Za-z0-9, ]%', @NewPassword) = 0)	
					begin 
						set @Error = @Error + 'New Password must have at least 1 special character<br>'
						--set @error = 'New Password must have at least ' + str(@minlength)+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case<br>'
					end 	
					
					if ( @CurrentPassword = @NewPassword)	
					begin 
						set @Error = @Error + 'New Password cannot be the same as Current Password<br>'
					end 
				end 
			end 												
		end 
	end 

 
end