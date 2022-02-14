CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate]
@ValuerCode nvarchar(100),
--@ValuerPassword nvarchar(100) = null,
@ValuerNewPassword nvarchar(100) = null,
@ValuerNewPasswordConfirmation nvarchar(100) = null,
@error nvarchar(max)  = null output
as
begin

	set @Error = ''

	if (		
		--@ValuerPassword is null or
		--rtrim(ltrim(@ValuerPassword)) = ''  or
		@ValuerNewPassword is null or
		rtrim(ltrim(@ValuerNewPassword)) = '' or
		@ValuerNewPasswordConfirmation is null or
		rtrim(ltrim(@ValuerNewPasswordConfirmation)) = '' 
	)
	begin
		set @Error = 'Please fill in all mandatory fields'
	end 
	else
	begin 
		if (@ValuerNewPasswordConfirmation <> @ValuerNewPassword)
		begin
			set @Error = 'New Password and New Password Confirmation are not the same'
		end 
		else 
		begin 
			/*
			if (@ValuerPassword = @ValuerNewPassword)
			begin
				set @Error = 'Current Password and New Password are the same'
			end 
			else
			begin
			*/
				if not exists 
				(
					select 1 
					from sqlvaluer 
					where ValuerCode = @ValuerCode
				)
				begin
					set @Error = 'Valuer Code does not exists in the system'
				end 
				else
				begin
					if not exists 
					(
						select 1 
						from sqlvaluer 
						where ValuerCode = @ValuerCode
							and status = 'Active'
					)
					begin
						set @Error = 'Valuer Code is not Active in the system'
					end 
					else
					begin
						/*
						if not exists 
						(
							select 1 
							from sqlvaluer 
							where ValuerCode = @ValuerCode
								and status = 'Active'
								and ValuerPassword = @ValuerPassword
						)
						begin
							set @Error = 'Old Password is wrong'
						end 
						else
						begin
						*/
							-- password requirement check

							declare @minlength int 
							select @minlength = ValuerPasswordMinCharacters
							from settings 

							if (len(@ValuerNewPassword)<@minlength)
							BEGIN
								--set @Error = @Error + 'New Password must have at least 12 characters<br>' 
								set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
							END 
		
							if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @ValuerNewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
							begin 		
								set @Error = @Error + 'New Password must have at least 1 lowercase character<br>'
							end	
	
							if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @ValuerNewPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
							begin 		
								set @Error = @Error + 'New Password must have at least 1 uppercase character<br>'
							end	

							if ( PATINDEX('%[0-9]%', @ValuerNewPassword) = 0)	
							begin 
								set @Error = @Error + 'New Password must have at least 1 number<br>'
							end 	

							if ( PATINDEX('%[^A-Za-z0-9, ]%', @ValuerNewPassword) = 0)	
							begin 
								set @Error = @Error + 'New Password must have at least 1 special character<br>'
							end 	
						--end 
					end 
				end 									
			--end 
		end 
	end 

 
end