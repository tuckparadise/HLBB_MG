CREATE   procedure [dbo].[ddAdmin_Project_Delete]
@ProjectCode nvarchar(max),
@LoginUserEmail nvarchar(max), 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''

	if (@LoginUserEmail like 'K2:%')
	begin		
		set @LoginUserEmail = Stuff(@LoginUserEmail, 1, 3, '')					
	end 

	-- to be enabled back after project completion 
	/*
	if exists 
	(
		select 1
		from SQLValuerDPSubmission
		where ValuerCode = @ValuerCode
	)
	begin 
		set @error = 'Record is in used'
	end 
	*/

	
	if exists
	(
		select 1
		from SQLLOADS
		where DeveloperCode = @ProjectCode
	)
	begin
		set @Error = 'Developer Code Is In Use<br>'
	end 
	

	if exists
	(
		select 1
		from ddProjectPhase
		where DeveloperCode = @ProjectCode
	)
	begin
		set @Error = 'Developer Code Is In Use in Phase Parameter<br>'
	end 

	if exists
	(
		select 1
		from ddProjectDeveloperSubUser
		where DeveloperCode = @ProjectCode
	)
	begin
		set @Error = 'Developer Code Is In Use in Sub User Paramater<br>'
	end 

	if (@Error = '')
	BEGIN 

		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = @ProjectCode
		--select @OperationPrimaryKeysValue = '20200310'
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectDeveloper' 
		set @operation = 'DELETE'
		set @OperationPrimaryKeys = 'ID'
		-- end get table name, primary keys and operation 	
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @LoginUserEmail
		--set @operator = 'aaa'
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

		-- start get original fields value 		
		declare @ConcatenatedNewValue nvarchar(max)
		set @ConcatenatedNewValue = ''
		-- end get original fields value 

		delete from ddProjectDeveloper
		where ID = @ProjectCode
		--where ValuerCode = '20200310'

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

	END 
	
end