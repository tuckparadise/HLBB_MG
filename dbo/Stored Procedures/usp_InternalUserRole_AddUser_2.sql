CREATE   procedure [dbo].[usp_InternalUserRole_AddUser_2]
@UserRoleID bigint = null ,
@UserName nvarchar(max) = null ,
@UserEmail nvarchar(max) = null ,
@UserFullName nvarchar(max) = null ,
@Branch nvarchar(max) = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''
	--declare @FullUserName nvarchar(max) 
	declare @index int 

	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 
	/*
	else
	begin
		if (@UserName like '%\%') 
		begin			
			select @index = CHARINDEX('\', @UserName)

			set @UserName = Stuff(@UserName, 1,@index, '')
		end 
		else
		begin
			set @UserName = @UserName
		end
	end 
	*/

	if exists 
	(
		select 1
		from UserRoleMetric
		where UserName = @UserName
			and UserRoleID = @UserRoleID
	)
	begin
		set @Error = 'Record existed'
	end 

	if (@Error = '')
	begin
		
		insert into UserRoleMetric (UserName, UserRoleID)
		values (@UserName, @UserRoleID)

		declare @RoleName nvarchar(max)
		select @RoleName = UserRoleName
		from InternalUserRole
		where UserRoleID = @UserRoleID
		
		if not exists
		(
			select 1 
			from UserRoleMetric_staging 
			where UserRoleID = @UserRoleID
				and UserName = @UserName 
		)
		begin
						
			INSERT INTO [dbo].AdminOperationAuditLog_UserMetric
				([TableName]
				,[Operation]
				,[OperationPrimaryKeys]
				,[OperationPrimaryKeysValue]
				,[ConcatenatedFieldsName]
				,[ConcatenatedOriginalValue]
				,[ConcatenatedNewValue]
				,[Operator]
				,[InsertedDateTime])
			values ('UserRoleMetric', 'ADD', 'UserRoleName', @RoleName, NULL, NULL,@UserName, @LoginUserEmail, getdate() )

		end 
				
		if not exists 
		(
			select 1
			from InternalUser
			where UserName = @UserName
		)
		begin
			INSERT INTO [dbo].[InternalUser]
				([UserName]
				,[UserEmail]
				,[UserFullName]
				,[Branch]
				,[LastLoginDatetime]
				,[Status]
				,[CreatedDate]
				,[UpdatedDate]
				,[IDLastLockedDatetime])
		 VALUES
			   (@UserName
			   ,@UserEmail
			   ,@UserFullName
			   ,@Branch 
			   ,getdate()
			   ,'Active'
			   ,getdate()
			   ,getdate()
			   ,null)

			IF (@@ROWCOUNT <> 0) 
			BEGIN
				-- start get new inserted primary key value 
				declare @OperationPrimaryKeysValue nvarchar(max)

				select @OperationPrimaryKeysValue = UserName
				from [InternalUser]
				where UserName = @UserName
				-- end get new inserted primary key value

				-- start get table name, primary keys and operation 
				declare @tablename nvarchar(100),
					@operation nvarchar(100),
					@OperationPrimaryKeys nvarchar(max)

				set @tablename = 'InternalUser' 
				set @operation = 'ADD'
				set @OperationPrimaryKeys = 'UserName'
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
				--set @query = @query + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue
				set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

				select @query

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
			end 
		end 
	end 
end