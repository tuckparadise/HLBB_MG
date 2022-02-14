CREATE       procedure [dbo].[ddProjectPhase_Update]
@SurrogateID bigint = null ,
@PhaseName nvarchar(max) = null, 	
@ProjectName nvarchar(max) = null, 	
@SADAFlag bit = null, 	
@Email nvarchar(max) = null, 	
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
	
	if (@LoginUserEmail like 'K2:%')
	begin		
		set @LoginUserEmail = Stuff(@LoginUserEmail, 1, 3, '')					
	end 
	/*
	if (		 		
		@ProjectName is null or
		rtrim(ltrim(@ProjectName)) = '' 
	)
	begin
		set @Error = @Error + 'Please fill in Project Name<br>'
	end 
	*/

	if (		 		
		@PhaseName is null or
		rtrim(ltrim(@PhaseName)) = '' 
	)
	begin
		set @Error = @Error + 'Please fill in Phase Name<br>'
	end 

	/*
	if (		 		
		@Email is null or
		rtrim(ltrim(@Email)) = '' 
	)
	begin
		set @Error = @Error + 'Please fill in Email<br>'
	end 
	*/
	if (		 		
		@SADAFlag is null or
		rtrim(ltrim(@SADAFlag)) = '' 
	)
	begin
		set @Error = @Error + 'Please fill in SADA Status<br>'
	end 

	if (@Error = '')
	BEGIN 
		
		declare @DeveloperCode nvarchar(max) ,  @ProjectCode nvarchar(max),  @PhaseCode nvarchar(max)

		set @DeveloperCode = (select developercode from ddProjectPhase where surrogateid = @SurrogateID )
		set @ProjectCode = (select ProjectCode from ddProjectPhase where surrogateid = @SurrogateID )
		set @PhaseCode = (select PhaseCode from ddProjectPhase where surrogateid = @SurrogateID )
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)

		select @OperationPrimaryKeysValue =  @SurrogateID
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectPhase' 
		set @operation = 'UPDATE'
		set @OperationPrimaryKeys = 'SurrogateID'
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

		update ddProjectPhase 
		set 			
			PhaseName = @PhaseName, 	
			UpdatedUser = @LoginUserEmail ,
			updateddate = getdate(),
			PhaseEmail = @Email,
			SADAFlag = @SADAFlag	
			--ProjectName = @ProjectName	
		where SurrogateID= @SurrogateID
		
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

			-- start insert trail for email 
		set @tablename = 'Phase Email' 
		set @operation = 'EDIT'
		set @OperationPrimaryKeys = 'SurrogateID'
		--select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode and [ProjectCode] = @ProjectCode and [DeveloperCode] = @DeveloperCode)
		--select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode )
		select @OperationPrimaryKeysValue = @SurrogateID
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
		--select @OperationPrimaryKeysValue = (select SurrogateID from [ddProjectPhase] where [PhaseCode] = @PhaseCode and [ProjectCode] = @ProjectCode and [DeveloperCode] = @DeveloperCode)
		select @OperationPrimaryKeysValue = @SurrogateID
		set @ConcatenatedFieldsName = 'Phase SADA' 
		set @ConcatenatedOriginalValue = (select TOP 1 ConcatenatedNewValue from ddProjectSADAAuditTrail where OperationPrimaryKeysValue = @OperationPrimaryKeysValue order by InsertedDateTime desc)
		set @operator = @LoginUserEmail
		set @ConcatenatedNewValue = (select case @SADAFlag when 1 then 'Yes' else 'No' end )

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
	END 
	

end