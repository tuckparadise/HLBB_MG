CREATE     procedure [dbo].[ddProjectPhase_Create_Final]
@PhaseCode nvarchar(max) = null,
@PhaseName nvarchar(max) = null,
@ProjectCode nvarchar(max) = null,
@ProjectName nvarchar(max) = null,
@DeveloperCode nvarchar(max) = null,
@Email nvarchar(max) = null, 	 	
@SADA bit = null, 	
@LoginUserEmail nvarchar(max) = null 	
as
begin	
	
	if (@LoginUserEmail like 'K2:%')
	begin		
		set @LoginUserEmail = Stuff(@LoginUserEmail, 1, 3, '')					
	end 

	INSERT INTO [dbo].[ddProjectPhase]
           ([PhaseCode]
           ,[PhaseName]
           ,[ProjectCode]
		   --,[ProjectName]
           ,[DeveloperCode]
           ,[PhaseEmail]
           ,[SADAFlag]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedUser]
           ,[UpdatedUser])
	VALUES (@PhaseCode, @PhaseName, @ProjectCode, @DeveloperCode, @Email, @SADA, getdate(),getdate(),  @LoginUserEmail, @LoginUserEmail )
		
	IF (@@ROWCOUNT <> 0) 
	BEGIN
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode and [ProjectCode] = @ProjectCode and [DeveloperCode] = @DeveloperCode)
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectPhase' 
		set @operation = 'ADD'
		set @OperationPrimaryKeys = 'SurrogateID'
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
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ''' + @OperationPrimaryKeysValue + ''' '

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

		-- start insert trail for email 
		set @tablename = 'Phase Email' 
		set @operation = 'EDIT'
		set @OperationPrimaryKeys = 'SurrogateID'
		select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode and [ProjectCode] = @ProjectCode and [DeveloperCode] = @DeveloperCode)
		set @ConcatenatedFieldsName = 'Phase Email' 
		set @ConcatenatedOriginalValue = (select TOP 1 ConcatenatedNewValue from ddProjectEmailAuditTrail where OperationPrimaryKeysValue = @OperationPrimaryKeysValue order by InsertedDateTime desc)
		set @operator = @LoginUserEmail
		set @ConcatenatedNewValue = @Email

		INSERT INTO [dbo].[ddProjectEmailAuditTrail]
           ([TableName]
           ,[Operation]
           ,[OperationPrimaryKeys]
           ,[OperationPrimaryKeysValue]
           ,[ConcatenatedFieldsName]
           ,[ConcatenatedOriginalValue]
           ,[ConcatenatedNewValue]
           ,[Operator]
           ,[InsertedDateTime]
           ,[OperationPrimaryKeysView]
           ,[OperationPrimaryKeysValueView]
           ,[DeveloperCode]
           ,[ProjectCode]
           ,[PhaseCode])
		values( @tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue, @ConcatenatedNewValue, @operator,getdate(), null,null, @DeveloperCode, @ProjectCode, @PhaseCode)
		-- end insert trail for email 

		-- start insert trail for SADA 
		set @tablename = 'Phase SADA' 
		set @operation = 'EDIT'
		set @OperationPrimaryKeys = 'SurrogateID'
		select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode and [ProjectCode] = @ProjectCode and [DeveloperCode] = @DeveloperCode)
		set @ConcatenatedFieldsName = 'Phase SADA' 
		set @ConcatenatedOriginalValue = (select TOP 1 ConcatenatedNewValue from ddProjectSADAAuditTrail where OperationPrimaryKeysValue = @OperationPrimaryKeysValue order by InsertedDateTime desc)
		set @operator = @LoginUserEmail
		set @ConcatenatedNewValue = (select case @SADA when 1 then 'Yes' else 'No' end )


		INSERT INTO [dbo].ddProjectSADAAuditTrail
           ([TableName]
           ,[Operation]
           ,[OperationPrimaryKeys]
           ,[OperationPrimaryKeysValue]
           ,[ConcatenatedFieldsName]
           ,[ConcatenatedOriginalValue]
           ,[ConcatenatedNewValue]
           ,[Operator]
           ,[InsertedDateTime]
           ,[OperationPrimaryKeysView]
           ,[OperationPrimaryKeysValueView]
           ,[DeveloperCode]
           ,[ProjectCode]
           ,[PhaseCode])
		values( @tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue, @ConcatenatedNewValue, @operator,getdate(), null,null, @DeveloperCode, @ProjectCode, @PhaseCode)
		-- end insert trail for SADA 
	END

end