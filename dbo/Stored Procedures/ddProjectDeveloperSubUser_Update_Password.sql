CREATE     procedure [dbo].[ddProjectDeveloperSubUser_Update_Password]
@ID nvarchar(max) = null,
@Password nvarchar(max) = null,
@PasswordConfirmation nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
	
	if (
		@Password is null or
		rtrim(ltrim(@Password)) = '' or 
		@PasswordConfirmation is null or
		rtrim(ltrim(@PasswordConfirmation)) = '' 
	)
	begin
		set @Error = 'Please fill in New Password and Comfirmation Password'
	end 
	else
	begin
		if (
			@Password <> @PasswordConfirmation			
		)
		begin
			set @Error = 'New Password and Confirmation Password are not the same'
		end 
		else
		begin
			
			declare @minlength int 
			select @minlength = ProjectPasswordMinCharacters
			from ddSettingsExt 

			-- password requirement check
			if (len(@Password)<@minlength)
			BEGIN
				--set @Error = 'Password must have at least 12 characters<br>'
				set @Error = 'Password must have at least ' + str(@minlength)+ ' characters<br>'
			END 

			if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @Password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
			end

			if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @Password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
			begin 		
				set @Error =  @Error +'Password must have at least 1 uppercase character<br>'
			end
	
			if ( PATINDEX('%[0-9]%', @Password) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 number<br>'
			end 	

			if ( PATINDEX('%[^A-Za-z0-9, ]%', @Password) = 0)	
			begin 
				set @Error =  @Error +'Password must have at least 1 special character<br>'
			end 		
			
		end 
	end 

	
	/*
	if (@Error = '')
	BEGIN 
		update sqlvaluer 
		set 
			ValuerPassword = @ValuerPassword,
			--[Status] = @Status,
			--ValuerName = @ValuerName, 	
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate()
		where ValuerCode= @ValuerCode	 	
	END 
	*/
end