CREATE procedure [dbo].[usp_Admin_Valuer_Create]
@ValuerCode nvarchar(max) = null,
@ValuerPassword nvarchar(max) = null,
@Status nvarchar(max) = null,
@ValuerName nvarchar(max) = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
	
	if (
		@ValuerCode is null or
		rtrim(ltrim(@ValuerCode)) = '' or  
		@ValuerPassword is null or
		rtrim(ltrim(@ValuerPassword)) = '' or 
		@ValuerName is null or
		rtrim(ltrim(@ValuerName)) = '' 
	)
	begin
		set @Error = 'Please fill in all compulsory fields'
	end 

	declare @minlength int 
	select @minlength = ValuerPasswordMinCharacters
	from settings 
	
	-- password requirement check
	if (len(@ValuerPassword)<@minlength)
	BEGIN
		set @Error = @Error + 'Password must have at least '+str(@minlength)+' characters<br>'
	END 

	if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @ValuerPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
	end

	if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @ValuerPassword COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 uppercase character<br>'
	end
	
	if ( PATINDEX('%[0-9]%', @ValuerPassword) = 0)	
	begin 
		set @Error =  @Error +'Password must have at least 1 number<br>'
	end 	

	if ( PATINDEX('%[^A-Za-z0-9, ]%', @ValuerPassword) = 0)	
	begin 
		set @Error =  @Error +'Password must have at least 1 special character<br>'
	end 		


	if (@Error = '')
	BEGIN 
		if exists 
		(
			SELECT ValuerCode
			FROM [dbo].[SQLValuer]
			WHERE ValuerCode = @ValuerCode
		)
		/*
		BEGIN
			INSERT INTO [dbo].[SQLValuer]
			   (
				ValuerCode
			   ,[ValuerPassword]
			   ,[Status]
			   ,[ValuerName]
			   ,[CreatedDate]
			   ,[UpdatedDate]
			   ,[CreatedUser] 
			   ,[UpdatedUser] 
			   )
			VALUES (@ValuerCode, @ValuerPassword, ltrim(rtrim(@Status)), @ValuerName, getdate(),getdate(), @LoginUserEmail, @LoginUserEmail)
		END 
		ELSE
		*/
		BEGIN
			SET @Error = 'Record Existed'
		END 
	END 
	
end