CREATE    procedure [dbo].[usp_InternalUser_SetInactive]
@UserName nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null,
@Remark nvarchar(max) = null,
@error nvarchar(max) = null output 
as
begin
	-- start get new inserted primary key value 
	declare @OperationPrimaryKeysValue nvarchar(max)

	select @OperationPrimaryKeysValue = @UserName
	-- end get new inserted primary key value

	-- start get table name, primary keys and operation 
	declare @tablename nvarchar(100),
		@operation nvarchar(100),
		@OperationPrimaryKeys nvarchar(max)

	set @tablename = 'InternalUser' 
	set @operation = 'UPDATE'
	set @OperationPrimaryKeys = 'UserName'
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

	delete from InternalUserLoginTrialSession
	where username = @username

	update InternalUser
	set [status] = 'Inactive',
		UpdatedDate = getdate(),
		--IDLastLockedDatetime = null 
		IDLastLockedByAdminDatetime = getdate(),
		Remarks = @Remark
	where username = @username

	if (@@ROWCOUNT<> 0)
	BEGIN
		-- start get Concatenated fields new values 
		declare @ConcatenatedNewValue nvarchar(max)
		declare @queryResult2 nvarchar(max)

		declare @zColumnNames nvarchar(max)
		declare @zOriValues nvarchar(max)
		declare @zNewValues nvarchar(max)
		declare @zTableName nvarchar(max)
		declare @zOperation nvarchar(max)
		declare @zOperationPrimaryKeysValue nvarchar(max)
		declare @zOperationPrimaryKeys nvarchar(max)
		declare @zOperator nvarchar(max)
		declare @zInsertedDateTime nvarchar(max)

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

		/*
		select 
			@zTableName = TableName,	
			@zOperation = Operation,	
			@zOperationPrimaryKeys = OperationPrimaryKeys,
			@zOperationPrimaryKeysValue = OperationPrimaryKeysValue,
			@zColumnNames= ConcatenatedFieldsName,
			@zOriValues= ConcatenatedOriginalValue,
			@zNewValues= ConcatenatedNewValue ,
			@zOperator = Operator,
			@zInsertedDateTime = InsertedDateTime
		from inserted

		/*
		from AdminOperationAuditLog
		where tablename = 'SQLDUMakerDP_AttorneyCentre' and operation = 'update'
			and InsertedDateTime = '2020-06-15 10:54:25.410'
		*/

		truncate table tbl_ValueChanged

		insert into tbl_ValueChanged
		select tbl1.column_id as ColID, 
				tbl1.value as ColumnName,
				tbl2.value as OriginalValue ,
				tbl3.value as NewValue ,
				case when (isnull(tbl2.value,'') <> isnull(tbl3.value,'') )then 'True' else '' end ValueChanged 	
			from [fn_split_string_to_column](@zColumnNames, ',') tbl1
				left join (select * from [fn_split_string_to_column](@zOriValues, ',')) tbl2 on tbl1.column_id = tbl2.column_id
				left join (select * from [fn_split_string_to_column](@zNewValues, ',')) tbl3 on tbl1.column_id = tbl3.column_id	

		Declare @zColumnNameValuesValue Varchar(MAX); 
		Declare @zOriginalValuesValue Varchar(MAX); 
		Declare @zNewValuesValue Varchar(MAX); 

		Select @zColumnNameValuesValue = COALESCE(@zColumnNameValuesValue + ', ' + ColumnName, ColumnName) ,
			@zOriginalValuesValue = COALESCE(@zOriginalValuesValue + ', ' + OriginalValue, OriginalValue) ,
			@zNewValuesValue = COALESCE(@zNewValuesValue + ', ' + NewValue, NewValue) 
		From tbl_ValueChanged 
		where  valuechanged = 'True'

		if (isnull(@zColumnNameValuesValue,'')<> '')
		begin
			insert into AdminOperationAuditLog2
			Select @zTableName, @zOperation, @zOperationPrimaryKeys, @zOperationPrimaryKeysValue, @zColumnNameValuesValue,@zOriginalValuesValue,@zNewValuesValue, @zOperator, @zInsertedDateTime
		end 
		*/
	END
end