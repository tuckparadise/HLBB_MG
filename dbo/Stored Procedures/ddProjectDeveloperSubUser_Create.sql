CREATE       procedure [dbo].[ddProjectDeveloperSubUser_Create]
@ID nvarchar(max) = null,
@Password nvarchar(max) = null,
@Status nvarchar(max) = null,
@Name nvarchar(max) = null, 	
@Email nvarchar(max) = null, 	
@DeveloperCode nvarchar(max) = null, 	
@SADA bit = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
	
	if (
		--@ID is null or
		--rtrim(ltrim(@ID)) = '' or  
		--@Password is null or
		--rtrim(ltrim(@Password)) = '' or 
		@Name is null or
		rtrim(ltrim(@Name)) = '' or
		@Email is null or
		rtrim(ltrim(@Email)) = '' --or
		--@SADA is null or
		--rtrim(ltrim(@SADA)) = '' 
	)
	begin
		set @Error = 'Please fill in all compulsory fields'
	end 
	/*
	declare @minlength int 
	select @minlength = ProjectPasswordMinCharacters
	from ddSettingsExt 
	
	-- password requirement check
	if (len(@Password)<@minlength)
	BEGIN
		set @Error = @Error + 'Password must have at least '+str(@minlength)+' characters<br>'
	END 

	if ( PATINDEX('%[abcdefghijklmnopqrstuvwxyz]%', @Password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 lowercase character<br>'
	end

	if ( PATINDEX('%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%', @Password COLLATE SQL_Latin1_General_Cp1_CS_AS)  = 0)
	begin 		
		set @Error = @Error + 'Password must have at least 1 uppercase character<br>'
	end
	
	if ( PATINDEX('%[0-9]%', @Password) = 0)	
	begin 
		set @Error =  @Error +'Password must have at least 1 number<br>'
	end 	

	if ( PATINDEX('%[^A-Za-z0-9, ]%', @Password) = 0)	
	begin 
		set @Error =  @Error +'Password must have at least 1 special character<br>'
	end 		
	*/

	/*
	if (@Error = '')
	BEGIN 
		if exists 
		(
			SELECT id
			FROM [dbo].ddProjectDeveloper
			WHERE id = @ID
		)		
		BEGIN
			SET @Error = 'Duplicate Developer Code'
		END 
	END 
	

	if (@Error = '')
	begin
		declare @ProjectCodeCount int 
		set @ProjectCodeCount  = ( select count(*) from ddProjectDeveloperProjectMapping_Draft WHERE developercode = @id )

		if (@ProjectCodeCount = 0)
		begin
			SET @Error = 'Please Add At Least 1 Project'
		end 
	end 
	
	if (@Error = '')
	begin
		if exists
		(
			select projectcode, count(*)
			from ddProjectDeveloperProjectMapping_Draft
			WHERE developercode = @id
			group by projectcode
			having count(*) >1

		)
		begin
			SET @Error = 'Duplicate Project Code'
		end 
	end 
	*/
	
end