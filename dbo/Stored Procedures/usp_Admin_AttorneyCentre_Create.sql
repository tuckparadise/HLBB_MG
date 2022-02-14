--[usp_Admin_AttorneyCentre_Create] 'asdasdas', 'Active', 'a@a.com'

  --select cast(AttorneyCentreID as varchar(max)) + ',' +cast(AttorneyCentre as varchar(max)) + ',' +cast(status as varchar(max)) + ','  from SQLDUMakerDP_AttorneyCentre where AttorneyCentre = 9

CREATE procedure [dbo].[usp_Admin_AttorneyCentre_Create]
@AttorneyCentre nvarchar(max) = null,
@AttorneyCentreStatus nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null, 
@Error nvarchar(max)  = null output
as
begin
	
	set @Error = ''

	if (
		ltrim(rtrim(@AttorneyCentre)) = '' or 
		@AttorneyCentre is null 
	)
	begin 
		set @Error = 'Please fill in all compulsory fields'
	end 

	if @Error = ''
	begin 
		if not exists 
		(
			SELECT [AttorneyCentreID]
				,[AttorneyCentre]
			FROM [dbo].[SQLDUMakerDP_AttorneyCentre]
			WHERE [AttorneyCentre] = ltrim(rtrim(@AttorneyCentre))
		)
		BEGIN
			insert into [SQLDUMakerDP_AttorneyCentre] ([AttorneyCentre], [status], createddate, updateddate,  createduser, updateduser)
			VALUES (@AttorneyCentre, @AttorneyCentreStatus, getdate(), getdate(),  @LoginUserEmail, @LoginUserEmail)

			IF (@@ROWCOUNT <> 0) 
			BEGIN
				-- start get new inserted primary key value 
				declare @OperationPrimaryKeysValue nvarchar(max)

				select @OperationPrimaryKeysValue = AttorneyCentreID
				from SQLDUMakerDP_AttorneyCentre
				where AttorneyCentre = @AttorneyCentre
				-- end get new inserted primary key value

				-- start get table name, primary keys and operation 
				declare @tablename nvarchar(100),
					@operation nvarchar(100),
					@OperationPrimaryKeys nvarchar(max)

				set @tablename = 'SQLDUMakerDP_AttorneyCentre' 
				set @operation = 'ADD'
				set @OperationPrimaryKeys = 'AttorneyCentreID'
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
				set @query = @query + ' where AttorneyCentreID = ' + @OperationPrimaryKeysValue

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
			SET @Error = 'Record Existed'
		END 
	end 
	
end