--truncate table AdminOperationAuditLog

  CREATE procedure [dbo].[usp_Admin_Attorney_Create]
  @AttorneyName nvarchar(max) = null,
  @AttorneyCentreID bigint = null, 
  @AttorneyStatus nvarchar(max) = null,
  @LoginUserEmail nvarchar(max) = null, 	
  @Error nvarchar(max) = null output 
  as
  begin
	
	set @Error = ''

	if (
		ltrim(rtrim(@AttorneyName)) = '' or @AttorneyName is null 
	)
	begin 
		set @Error = 'Please fill in all compulsory fields'
	end 
	
	if (@Error = '')
	begin 
		if not exists 
		(
			SELECT AttorneyName
			FROM [dbo].SQLDUMakerDP_AttorneyName
			WHERE AttorneyName = ltrim(rtrim(@AttorneyName))
				and AttorneyCentreID <> @AttorneyCentreID
		)
		BEGIN																					 

			insert into SQLDUMakerDP_AttorneyName (AttorneyName, [AttorneyCentreID], [status], createddate, updateddate, createduser, updateduser)
			VALUES (@AttorneyName, @AttorneyCentreID, @AttorneyStatus, getdate(), getdate(), @LoginUserEmail, @LoginUserEmail)						

			IF (@@ROWCOUNT <> 0) 
			BEGIN
				-- start get new inserted primary key value 
				declare @OperationPrimaryKeysValue nvarchar(max)

				select @OperationPrimaryKeysValue = AttorneyNameID
				from SQLDUMakerDP_AttorneyName
				where AttorneyName = @AttorneyName
				-- end get new inserted primary key value

				-- start get table name, primary keys and operation 
				declare @tablename nvarchar(100),
					@operation nvarchar(100),
					@OperationPrimaryKeys nvarchar(max)

				set @tablename = 'SQLDUMakerDP_AttorneyName' 
				set @operation = 'ADD'
				set @OperationPrimaryKeys = 'AttorneyNameID'
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
				set @query = @query + ' where AttorneyNameID = ' + @OperationPrimaryKeysValue

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
		END 
		ELSE
		BEGIN
			SET @Error = 'Attorney Existed for this Attorney Center'
		END 
	end 
	
  end