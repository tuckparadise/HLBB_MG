CREATE   procedure [dbo].[ddAdmin_Project_Create_Final]
@ID nvarchar(max) = null,
@EncryptedPassword nvarchar(max) = null,
@Status nvarchar(max) = null,
@Name nvarchar(max) = null, 	
@Email nvarchar(max) = null, 	
@SADA bit = null, 		
@LoginUserEmail nvarchar(max) = null
as
begin
	
	if (@LoginUserEmail like 'K2:%')
	begin		
		set @LoginUserEmail = Stuff(@LoginUserEmail, 1, 3, '')		
	end 

	declare @expirydayscount int 
	select @expirydayscount = ProjectLoginPasswordMaxExpiryDays
	from ddSettingsExt

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ProjectLoginPasswordMaxExpiryWarningDays
	from ddSettingsExt

	INSERT INTO [dbo].ddProjectDeveloper
           (id
           ,[Password]
           ,[Status]
           ,[Name]                                 
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedUser]
           ,[UpdatedUser]
           ,[LastLoginDatetime]
           ,[PasswordForceReset]
           ,[PasswordExpiryDate]
           ,[PasswordExpiryWarningDate]           
           ,[AcknowledgementFlag]
           ,[Email])
	VALUES (@ID, @EncryptedPassword, ltrim(rtrim(@Status)), @Name, getdate(),getdate(),  @LoginUserEmail, @LoginUserEmail, getdate(), 'Yes', DATEADD(DAY, @expirydayscount, getdate()), DATEADD(DAY, @expirywarningdayscount, getdate()),NULL, @Email )
		
	IF (@@ROWCOUNT <> 0) 
	BEGIN
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = @ID
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectDeveloper' 
		set @operation = 'ADD'
		set @OperationPrimaryKeys = 'ID'
		-- end get table name, primary keys and operation 		
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @LoginUserEmail
		-- start get operator 

		-- start get original fields value 		
		declare @ConcatenatedOriginalValue nvarchar(max)
		set @ConcatenatedOriginalValue = ''
		-- end get original fields value 

		-- start get Concatenated field name 
		declare @fieldname nvarchar(max), 
			@ConcatenatedFieldsName nvarchar(max)
			
		SET @fieldname = ''
		select @fieldname = @fieldname + COLUMN_NAME + ', ' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')

		set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
		-- end get Concatenated field name 

		-- end get Concatenated fields new values 
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
						
		SET @ConcatenatedFieldsNamePlus = ''						
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

		--select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedNewValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields new values

		-- insert into admin log
		INSERT INTO [dbo].[AdminOperationAuditLog]
			([TableName]
			,[Operation]
			,[OperationPrimaryKeys]
			,[OperationPrimaryKeysValue]
			,[ConcatenatedFieldsName]
			,[ConcatenatedOriginalValue]
			,[ConcatenatedNewValue]
			,[Operator]
			,[InsertedDateTime])
		values (@tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate() )

	END

	
	insert into ddProjectDeveloperProjectMapping
	select * from ddProjectDeveloperProjectMapping_Draft where developercode = @ID and CreatedUser = @LoginUserEmail

	IF (@@ROWCOUNT <> 0) 
	BEGIN
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue2 nvarchar(max)

		select @OperationPrimaryKeysValue2 = @ID
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename2 nvarchar(100),
			@operation2 nvarchar(100),
			@OperationPrimaryKeys2 nvarchar(max)

		set @tablename2 = 'ddProjectDeveloperProjectMapping' 
		set @operation2 = 'EDIT'
		set @OperationPrimaryKeys2 = 'ID'
		-- end get table name, primary keys and operation 		
			
		-- start get operator 
		declare @operator2 nvarchar(100)
		set @operator2 = @LoginUserEmail
		-- start get operator 

		-- start get original fields value 		
		declare @ConcatenatedOriginalValue2 nvarchar(max)
		set @ConcatenatedOriginalValue2 = ''
		-- end get original fields value 

		-- start get Concatenated field name 
		declare @fieldname2 nvarchar(max), 
			@ConcatenatedFieldsName2 nvarchar(max)
		
		set @ConcatenatedFieldsName2 = 'projectcode,projectname'
		/*
		SET @fieldname = 'projectcode,projectname'
		
		select @fieldname = @fieldname + COLUMN_NAME + ', ' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
		

		set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
		-- end get Concatenated field name 
		*/

		declare @ConcatenatedFieldsNamePlus2 nvarchar(max), 															
			@ConcatenatedNewValue2 nvarchar(max)
		/*
		-- end get Concatenated fields new values 
		
						
		SET @ConcatenatedFieldsNamePlus = ''						
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

		--select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedNewValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields new values
		*/

		declare @tmp nvarchar(max)
		SET @tmp = ''
		select @tmp = @tmp + projectcode + ',' + projectname + '| ' from ddProjectDeveloperProjectMapping where developercode = @ID

		set @ConcatenatedNewValue2 = (select SUBSTRING(@tmp, 0, LEN(@tmp)))

		-- insert into admin log
		INSERT INTO [dbo].[AdminOperationAuditLog]
			([TableName]
			,[Operation]
			,[OperationPrimaryKeys]
			,[OperationPrimaryKeysValue]
			,[ConcatenatedFieldsName]
			,[ConcatenatedOriginalValue]
			,[ConcatenatedNewValue]
			,[Operator]
			,[InsertedDateTime])
		values (@tablename2, @operation2, @OperationPrimaryKeys2, @OperationPrimaryKeysValue2, @ConcatenatedFieldsName2, @ConcatenatedOriginalValue2,@ConcatenatedNewValue2, @operator2, getdate() )

	END
	delete from ddProjectDeveloperProjectMapping_Draft where developercode = @ID and CreatedUser = @LoginUserEmail
	
end