CREATE procedure [dbo].[usp_Admin_Solicitor_Update_Status]
@SolicitorCode nvarchar(max),
--@SolicitorPassword nvarchar(max) = null,
@Status nvarchar(max) = null,
--@SolicitorName nvarchar(max) = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''

	if (@Error = '')
	BEGIN 
		delete from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode

		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue =  @SolicitorCode
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'sqlsolicitor' 
		set @operation = 'UPDATE'
		set @OperationPrimaryKeys = 'SolicitorCode'
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
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		--set @query = @query + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '
		--select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedOriginalValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields original values

		update sqlSolicitor 
		set 
			--SolicitorPassword = @SolicitorPassword,
			[Status] = @Status,
			--SolicitorName = @SolicitorName, 	
			SolicitorLastLoginDatetime = getdate(), 
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate(),
			IDLastLockedDatetime = null 
		where SolicitorCode= @SolicitorCode	 	

		if (@@ROWCOUNT<> 0)
		BEGIN
			-- start get Concatenated fields new values 
			declare @ConcatenatedFieldsNamePlus2 nvarchar(max), 															
				@ConcatenatedNewValue nvarchar(max)
						
			SET @ConcatenatedFieldsNamePlus2 = ''						
			
			select @ConcatenatedFieldsNamePlus2 = @ConcatenatedFieldsNamePlus2 + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE TABLE_NAME = @tablename
				and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
			declare @queryResult2 nvarchar(max)
	
			declare @query2 nvarchar(max)
			set @query2 = ''
			set @query2 = @query2 + ' select @tempqueryResult2=' + SUBSTRING(@ConcatenatedFieldsNamePlus2, 0, LEN(@ConcatenatedFieldsNamePlus2)) 
			set @query2 = @query2 + ' from ' + @tablename
			--set @query2 = @query2 + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue
			set @query2 = @query2 + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '			

			EXECUTE sp_executesql @query2, N'@tempqueryResult2 nvarchar(max) OUTPUT', @tempqueryResult2=@queryResult2 OUTPUT
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
	END 
	
end