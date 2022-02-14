CREATE   procedure [dbo].[ddProjectAnnouncement_delete]
@RemarkID bigint = null, 
@ChangedUser nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@RowCount bigint = null output 
as
begin
	
	if (@ChangedUser like 'K2:%')
	begin		
		set @ChangedUser = Stuff(@ChangedUser, 1, 3, '')					
	end 
		
	-- start get new inserted primary key value 
	declare @OperationPrimaryKeysValue nvarchar(max)

	select @OperationPrimaryKeysValue =  @RemarkID
	-- end get new inserted primary key value

	-- start get table name, primary keys and operation 
	declare @tablename nvarchar(100),
		@operation nvarchar(100),
		@OperationPrimaryKeys nvarchar(max)

	set @tablename = 'ddProjectAnnouncement' 
	set @operation = 'UPDATE'
	set @OperationPrimaryKeys = 'RemarkID'
	-- end get table name, primary keys and operation 		
			
	-- start get operator 
	declare @operator nvarchar(100)
	set @operator = @ChangedUser
	-- end get operator 

	-- start get Concatenated field name 
	declare @fieldname nvarchar(max), 
		@ConcatenatedFieldsName nvarchar(max)
			
	SET @fieldname = ''
	select @fieldname = @fieldname + COLUMN_NAME + ', ' 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_NAME = @tablename
		and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
		and column_name not in ('Attachment')

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
		and column_name not in ('Attachment')
		
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

	update [ddProjectAnnouncement]
	set DeletedUser = @ChangedUser,
		deleteddate = getdate()
	where RemarkID = @RemarkID
		
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
			and column_name not in ('Attachment')

		declare @queryResult2 nvarchar(max)
	
		declare @query2 nvarchar(max)
		set @query2 = ''
		set @query2 = @query2 + ' select @tempqueryResult2=' + SUBSTRING(@ConcatenatedFieldsNamePlus2, 0, LEN(@ConcatenatedFieldsNamePlus2)) 
		set @query2 = @query2 + ' from ' + @tablename
		--set @query2 = @query2 + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue
		set @query2 = @query2 + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

		--select @query

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
end