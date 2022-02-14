CREATE       procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_Add]
@PaymentReference nvarchar(200) = null,
@SolicitorFlag bit = null,
@BankFlag bit = null,
@LoginUserEmail nvarchar(max) = null, 	
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if (@PaymentReference is null or ltrim(rtrim(@PaymentReference)) = '')
	begin
		set @error = 'Please fill in Payment Reference'
	end 

	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_PaymentReference_FLVM
		where PaymentReference= @PaymentReference
	)	
	begin
		set @error = 'Keyword is reserved for FLVM. Please use another name'
	end 

	if (ltrim(rtrim(@PaymentReference)) = 'Others')
	begin
		set @error = 'Keyword is reserved. Please use another name'
	end 

	/*
	else 
	begin
		if (ltrim(rtrim(@PaymentReference)) ='Legal Fee' or ltrim(rtrim(@PaymentReference)) = 'Valuation Fee')
		begin
			set @error = 'Keyword is reserved. Please use another name'
		end 
	end
	*/

	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_PaymentReference
		where PaymentReference = @PaymentReference
	)
	begin
		set @error = @PaymentReference + ' existed'
	end 

	if (@error='')	
	begin
		insert into aaSolDisbursementSubmission_PaymentReference
		values (@PaymentReference, isnull(@SolicitorFlag,0), isnull(@BankFlag,0), getdate(), getdate(),@LoginUserEmail, @LoginUserEmail )

		IF (@@ROWCOUNT <> 0) 
		BEGIN
			-- start get new inserted primary key value 
			declare @OperationPrimaryKeysValue nvarchar(max)

			select @OperationPrimaryKeysValue = ID
			from aaSolDisbursementSubmission_PaymentReference
			where PaymentReference = @PaymentReference
			-- end get new inserted primary key value

			-- start get table name, primary keys and operation 
			declare @tablename nvarchar(100),
				@operation nvarchar(100),
				@OperationPrimaryKeys nvarchar(max)

			set @tablename = 'aaSolDisbursementSubmission_PaymentReference' 
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
			
			select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'cast(' + COLUMN_NAME + ' as varchar(max)) + '','' +' 
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @tablename
				and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
			declare @queryResult nvarchar(max)
	
			declare @query nvarchar(max)
			set @query = ''
			set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
			set @query = @query + ' from ' + @tablename
			set @query = @query + ' where '+ @OperationPrimaryKeys +'= ' + @OperationPrimaryKeysValue
			--set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '
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
	
	  
end