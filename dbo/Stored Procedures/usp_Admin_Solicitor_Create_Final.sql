﻿CREATE procedure [dbo].[usp_Admin_Solicitor_Create_Final]
@SolicitorCode nvarchar(max) = null,
@EncryptedSolicitorPassword nvarchar(max) = null,
@Status nvarchar(max) = null,
@SolicitorName nvarchar(max) = null, 	
@LoginUserEmail nvarchar(max) = null
as
begin

	declare @expirydayscount int 
	select @expirydayscount = SolicitorLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = SolicitorLoginPasswordMaxExpiryWarningDays
	from settings

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
		, SolicitorLastLoginDatetime
		, passwordforcereset
		, PasswordExpiryDate
		, PasswordExpiryWarningDate
		)
	VALUES (@SolicitorCode, @EncryptedSolicitorPassword, ltrim(rtrim(@Status)), @SolicitorName, getdate(),getdate(), @LoginUserEmail, @LoginUserEmail, getdate(),'Yes', DATEADD(DAY, @expirydayscount, getdate()), DATEADD(DAY, @expirywarningdayscount, getdate()))
		
	IF (@@ROWCOUNT <> 0) 
	BEGIN
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = @SolicitorCode
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'SQLSolicitor' 
		set @operation = 'ADD'
		set @OperationPrimaryKeys = 'SolicitorCode'
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
end