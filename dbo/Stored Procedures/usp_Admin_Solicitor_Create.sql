CREATE procedure [dbo].[usp_Admin_Solicitor_Create]
@SolicitorCode nvarchar(max) = null,
@SolicitorPassword nvarchar(max) = null,
@Status nvarchar(max) = null,
@SolicitorName nvarchar(max) = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''

	if (
		@SolicitorCode is null or
		rtrim(ltrim(@SolicitorCode)) = '' or  
		@SolicitorPassword is null or
		rtrim(ltrim(@SolicitorPassword)) = '' or 
		@SolicitorName is null or
		rtrim(ltrim(@SolicitorName)) = '' 
	)
	begin
		set @Error = 'Please fill in all compulsory fields'
	end 

	-- get default solicitor min password lenght 
	declare @SolicitorPasswordMinCharacters int  
	select @SolicitorPasswordMinCharacters = [SolicitorPasswordMinCharacters]
	from Settings

	-- password requirement check
	if (len(@SolicitorPassword)<@SolicitorPasswordMinCharacters)
	BEGIN
		set @Error = @Error + 'Password must have at least '+str(@SolicitorPasswordMinCharacters)+' characters<br>'
	END 

	declare @binarypassword varbinary(max),
		@binarypassword_lowercase varbinary(max),
		@binarypassword_uppercase varbinary(max)
		
	if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @SolicitorPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
	end

	if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @SolicitorPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 uppercase character<br>'
	end
	
	if ( PATINDEX('%[0-9]%', @SolicitorPassword) = 0)	
	begin 
		set @Error = @Error + 'Password must have at least 1 number<br>'
	end 	

	if ( PATINDEX('%[^A-Za-z0-9, ]%', @SolicitorPassword) = 0)	
	begin 
		set @Error = @Error + 'Password must have at least 1 special character<br>'
	end 		


	if (@Error = '')
	BEGIN 
		if exists 
		(
			SELECT [SolicitorCode]
			FROM [dbo].[SQLSolicitor]
			WHERE SolicitorCode = @SolicitorCode
		)
		/*
		BEGIN
			INSERT INTO [dbo].[SQLSolicitor]
			   (
				[SolicitorCode]
			   ,[SolicitorPassword]
			   ,[Status]
			   ,[SolicitorName]
			   ,[CreatedDate]
			   ,[UpdatedDate]
			   ,[CreatedUser] 
			   ,[UpdatedUser] 
			   )
			VALUES (@SolicitorCode, @SolicitorPassword, ltrim(rtrim(@Status)), @SolicitorName, getdate(),getdate(), @LoginUserEmail, @LoginUserEmail)
		END 
		ELSE
		*/
		BEGIN
			SET @Error = 'Record Existed'
		END 
	END 
	
end