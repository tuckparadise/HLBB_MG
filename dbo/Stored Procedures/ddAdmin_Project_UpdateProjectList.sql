CREATE     procedure [dbo].[ddAdmin_Project_UpdateProjectList]
@ID nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null
as
begin
		
	delete from ddProjectDeveloperProjectMapping where  developercode = @ID

	insert into ddProjectDeveloperProjectMapping
	select * from ddProjectDeveloperProjectMapping_Draft where developercode = @ID

	
	IF (@@ROWCOUNT <> 0) 
	BEGIN
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = @ID
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectDeveloperProjectMapping' 
		set @operation = 'EDIT'
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
		
		set @ConcatenatedFieldsName = 'projectcode,projectname'
		/*
		SET @fieldname = 'projectcode,projectname'
		
		select @fieldname = @fieldname + COLUMN_NAME + ', ' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
		

		set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
		-- end get Concatenated field name 
		*/

		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
		/*
		-- end get Concatenated fields new values 
		
						
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
		*/

		/*
		declare @tmp nvarchar(max)
		SET @tmp = ''
		select @tmp = @tmp + isnull(projectcode,'') + ',' + isnull(projectname,'') + '| ' from ddProjectDeveloperProjectMapping where developercode = @ID

		set @ConcatenatedNewValue = (select SUBSTRING(@tmp, 0, LEN(@tmp)))
		*/
		set @ConcatenatedNewValue = (
		select distinct 			  
			stuff((
			select '|' + u.projectcode + ',' + u.projectName
			from ddProjectDeveloperProjectMapping u
			where u.projectcode = projectcode 
				--and UserRoleID = @UserRoleID				
				and developercode = @ID
			order by u.projectcode
			for xml path('')
			),1,1,'') as NEWPROJECTLIST
			from ddProjectDeveloperProjectMapping
			group by projectcode
			)

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
	
	delete from ddProjectDeveloperProjectMapping_Draft where developercode = @ID
end