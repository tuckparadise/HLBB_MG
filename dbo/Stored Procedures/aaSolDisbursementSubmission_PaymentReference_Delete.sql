CREATE      procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Delete]
@id bigint = null,
@PaymentReference nvarchar(200) = null,
@LoginUserEmail nvarchar(max) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	-- start get new inserted primary key value 
	declare @OperationPrimaryKeysValue nvarchar(max)

	--select @OperationPrimaryKeysValue = @PaymentReference
	select @OperationPrimaryKeysValue = @id
	-- end get new inserted primary key value

	-- start get table name, primary keys and operation 
	declare @tablename nvarchar(100),
		@operation nvarchar(100),
		@OperationPrimaryKeys nvarchar(max)

	set @tablename = 'aaSolDisbursementSubmission_PaymentReference' 
	set @operation = 'DELETE'
	set @OperationPrimaryKeys = 'ID'
	-- end get table name, primary keys and operation 	
			
	-- start get operator 
	declare @operator nvarchar(100)
	set @operator = @LoginUserEmail
	-- start get operator 

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

	-- end get Concatenated fields original values 
	declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
		@ConcatenatedOriginalValue nvarchar(max)
						
	SET @ConcatenatedFieldsNamePlus = ''						
			
	select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'cast(' + COLUMN_NAME + ' as varchar(max)) + '','' +' 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @tablename
		and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
	declare @queryResult nvarchar(max)
	
	declare @query nvarchar(max)
	set @query = ''
	set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
	set @query = @query + ' from ' + @tablename
	set @query = @query + ' where '+ @OperationPrimaryKeys +' = ' + @OperationPrimaryKeysValue
	--set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '
	--select @query

	EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
	set @queryResult = ltrim(rtrim(@queryResult))

	set @ConcatenatedOriginalValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
	-- end get Concatenated fields original values 

	-- start get original fields value 		
	declare @ConcatenatedNewValue nvarchar(max)
	set @ConcatenatedNewValue = ''
	-- end get original fields value 

	delete aaSolDisbursementSubmission_PaymentReference	
	where 
		--PaymentReference = @PaymentReference
	  id = @id

	IF (@@ROWCOUNT <> 0) 
	BEGIN
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