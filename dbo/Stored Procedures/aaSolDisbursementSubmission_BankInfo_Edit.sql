CREATE      procedure [dbo].[aaSolDisbursementSubmission_BankInfo_Edit]
@id bigint = null,
@bank nvarchar(200) = null,
@RentasFlag bit = null,
@IBGFlag bit = null,
@HLBFlag bit = null,
@LoginUserEmail nvarchar(max) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_BankInfo
		where Bank = @Bank 
			and id <> @id 
	)
	begin
		set @error = 'Same Bank existed in another record'
	end 

	if (@error = '')
	begin
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = @id			
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'aaSolDisbursementSubmission_BankInfo' 
		set @operation = 'UPDATE'
		set @OperationPrimaryKeys = 'id'
		-- end get table name, primary keys and operation 		
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @LoginUserEmail
		-- end get operator 

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
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue
		--set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

		--select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedOriginalValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields original values

		update [aaSolDisbursementSubmission_BankInfo]
		set bank = @bank,
			RentasFlag = isnull(@RentasFlag,0),
			IBGFlag = isnull(@IBGFlag,0),
			HLBFlag = isnull(@HLBFlag,0),
			updateddate = getdate(),
			updateduser = @LoginUserEmail
		where id = @id 
	  
		if (@@ROWCOUNT<> 0)
		BEGIN						
			-- start get Concatenated fields new values 
			declare @ConcatenatedNewValue nvarchar(max)
			declare @queryResult2 nvarchar(max)

			EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult2 OUTPUT
			set @queryResult2 = ltrim(rtrim(@queryResult2))

			set @ConcatenatedNewValue = SUBSTRING(@queryResult2,1, LEN(@queryResult2)-1)
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