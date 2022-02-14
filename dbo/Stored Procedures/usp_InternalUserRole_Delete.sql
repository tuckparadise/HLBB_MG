CREATE     procedure [dbo].[usp_InternalUserRole_Delete]
@UserRoleID bigint = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	/*
	if exists 
	(
		select 1
		from UserRoleMetric
		where UserRoleID = @UserRoleID
	)
	begin
		set @Error = 'Remove all Users from role before continue'
	end 
	*/
	declare @UserRoleName nvarchar(max)

	-- start get new inserted primary key value 
	declare @OperationPrimaryKeysValue nvarchar(max)
	declare @OperationPrimaryKeysValueView nvarchar(max)

	if (@Error = '')
	begin
		
		select @UserRoleName = UserRoleName
		from InternalUserRole
		where UserRoleID = @UserRoleID
		
		select @OperationPrimaryKeysValueView = @UserRoleName
		select @OperationPrimaryKeysValue = @UserRoleID

		delete from UserRoleMetric
		where UserRoleID = @UserRoleID
	end 

	if (@Error = '')
	begin		

		

		--select @OperationPrimaryKeysValue = @UserRoleID
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max),
				@OperationPrimaryKeysView nvarchar(max)

		set @tablename = 'InternalUserRole' 
		set @operation = 'DELETE'
		set @OperationPrimaryKeys = 'UserRoleID'
		set @OperationPrimaryKeysView = 'UserRoleName'
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
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		set @query = @query + ' where '+ @OperationPrimaryKeys +' = ' + @OperationPrimaryKeysValue

		select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedOriginalValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields original values 

		-- start get original fields value 		
		declare @ConcatenatedNewValue nvarchar(max)
		set @ConcatenatedNewValue = ''
		-- end get original fields value 

		delete InternalUserRole
		where UserRoleID = @UserRoleID
		
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
				,[InsertedDateTime]
				,[OperationPrimaryKeysview]
				,[OperationPrimaryKeysValueview]	)
			values (@tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate(),@OperationPrimaryKeysview, @OperationPrimaryKeysValueview )

		END 

		/*
		if exists 
		(
			select 1
			from InternalUser
			where UserName not in (select username from UserRoleMetric)
		)
		begin
		
			declare @c_username nvarchar(max) 

			DECLARE cursor_name CURSOR FOR select username from InternalUser
			where UserName not in (select username from UserRoleMetric);

			OPEN cursor_name;

			FETCH NEXT FROM cursor_name INTO @c_username;

			WHILE @@FETCH_STATUS = 0  
			BEGIN

				-- start get new inserted primary key value 
				--declare @OperationPrimaryKeysValue nvarchar(max)

				select @OperationPrimaryKeysValue = @c_username
				-- end get new inserted primary key value

				-- start get table name, primary keys and operation 
				--declare @tablename nvarchar(100),
				--	@operation nvarchar(100),
				--	@OperationPrimaryKeys nvarchar(max)

				set @tablename = 'InternalUser' 
				set @operation = 'DELETE'
				set @OperationPrimaryKeys = 'username'
				-- end get table name, primary keys and operation 	
			
				-- start get operator 
				--declare @operator nvarchar(100)
				set @operator = @LoginUserEmail
				-- start get operator 

				-- start get Concatenated field name 
				--declare @fieldname nvarchar(max), 
				--	@ConcatenatedFieldsName nvarchar(max)
			
				SET @fieldname = ''
				select @fieldname = @fieldname + COLUMN_NAME + ', ' 
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @tablename
					and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')

				set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
				-- end get Concatenated field name 

				-- end get Concatenated fields original values 
				--declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
				--	@ConcatenatedOriginalValue nvarchar(max)
						
				SET @ConcatenatedFieldsNamePlus = ''						
			
				--select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'cast(' + COLUMN_NAME + ' as varchar(max)) + '','' +' 
				select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
				FROM INFORMATION_SCHEMA.COLUMNS
				WHERE TABLE_NAME = @tablename
					and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
				--declare @queryResult nvarchar(max)
	
				--declare @query nvarchar(max)
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
				--declare @ConcatenatedNewValue nvarchar(max)
				set @ConcatenatedNewValue = ''
				-- end get original fields value 

				delete from InternalUser
				where UserName = @c_username
		
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
			
				FETCH NEXT FROM cursor_name into @c_username;  
			END

			CLOSE cursor_name

			DEALLOCATE cursor_name
		end 
		*/
	end 
end