CREATE   procedure [dbo].[usp_InternalUserRole_Insert]
@UserRoleName nvarchar(max) = null ,
@UserRoleDescription nvarchar(max) = null ,
@IsDUMakerDocumentation bit = null ,
@IsDUMakerValuation bit = null ,
@IsMortgageAdmin bit = null ,
@IsITAdminApplication bit = null ,
@IsITAdminSecurity bit = null ,
@IsDisbMaker bit = null ,
@IsDisbChecker bit = null ,
@IsRCOMaker bit = null ,
@IsRCOChecker bit = null ,
@IsTBOMaker bit = null ,
@IsTBOChecker bit = null ,
@IsValuerEditer bit = null ,
@IsSolicitorEditer bit = null ,
@IsDeveloperEditer bit = null ,
@IsManager bit = null ,
@IsDeveloperStatusEditor bit = null ,
@LoginUserEmail nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	if (ltrim(rtrim(@UserRoleName)) = '' or @UserRoleName is null )
	begin
		set @Error = @Error + 'Role Name cannot be empty<br>'	
	end 

	if 
	(
		(@IsDUMakerDocumentation = '' or @IsDUMakerDocumentation is null) and 
		(@IsDUMakerValuation = '' or @IsDUMakerValuation is null) and 
		(@IsMortgageAdmin = '' or @IsMortgageAdmin is null) and 
		(@IsITAdminApplication = '' or @IsITAdminApplication is null) and 
		(@IsITAdminSecurity = '' or @IsITAdminSecurity is null) and 
		(@IsDisbMaker = '' or @IsDisbMaker is null) and 
		(@IsDisbChecker = '' or @IsDisbChecker is null) and 
		(@IsRCOMaker = '' or @IsRCOMaker is null) and 
		(@IsRCOChecker = '' or @IsRCOChecker is null) and 
		(@IsValuerEditer = '' or @IsValuerEditer is null) and 
		(@IsSolicitorEditer = '' or @IsSolicitorEditer is null) and
		(@IsDeveloperEditer = '' or @IsDeveloperEditer is null) and 
		(@IsManager = '' or @IsManager is null) and
		(@IsDeveloperStatusEditor = '' or @IsDeveloperStatusEditor is null) 
	)	
	begin
		set @Error = @Error + 'Please select at least 1 access rights<br>'
	end 

	if (@Error = '')
	begin
		if exists 
		(
			select 1
			from InternalUserRole
			where UserRoleName= @UserRoleName
		)
		begin
			set @Error = 'Record Existed'
		end 
	end
	

	if (@Error = '')
	begin
		declare @UserRoleID bigint 
		set @UserRoleID = 1
		-- get latest id 
		if exists 
		(
			select 1
			from InternalUserRole
		)
		begin
			select @UserRoleID = max(UserRoleID) + 1
			from InternalUserRole
		end 

		INSERT INTO [dbo].[InternalUserRole]
           ([UserRoleID]
           ,[UserRoleName]
           ,[UserRoleDescription]
           ,[IsDUMakerDocumentation]
           ,[IsDUMakerValuation]
           ,[IsMortgageAdmin]
           ,[IsITAdminApplication]
           ,[IsITAdminSecurity]
           ,[IsDisbMaker]
           ,[IsDisbChecker]
           ,[IsRCOMaker]
           ,[IsRCOChecker]
           ,[IsTBOMaker]
           ,[IsTBOChecker]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedUser]
           ,[UpdatedUser]
		    ,IsValuerEditer 
			,IsSolicitorEditer 
			,IsDeveloperEditer 
			,IsManager
			, IsDeveloperStatusEditor
		   )
     VALUES
           (@UserRoleID 
           ,@UserRoleName
           ,@UserRoleDescription
           ,@IsDUMakerDocumentation
           ,@IsDUMakerValuation
           ,@IsMortgageAdmin
           ,@IsITAdminApplication
           ,@IsITAdminSecurity
           ,@IsDisbMaker
           ,@IsDisbChecker
           ,@IsRCOMaker
           ,@IsRCOChecker
           ,@IsTBOMaker
           ,@IsTBOChecker
           ,getdate()
           ,getdate()
           ,@LoginUserEmail
           ,@LoginUserEmail
		   ,@IsValuerEditer 
			,@IsSolicitorEditer 
			,@IsDeveloperEditer 
			,@IsManager
			, @IsDeveloperStatusEditor
		   )
		   
		IF (@@ROWCOUNT <> 0) 
		BEGIN
			-- start get new inserted primary key value 
			declare @OperationPrimaryKeysValue nvarchar(max)
			declare @OperationPrimaryKeysValueView nvarchar(max)
			
			select @OperationPrimaryKeysValue = UserRoleID
			from [InternalUserRole]
			where UserRoleName = @UserRoleName
						

			select @OperationPrimaryKeysValueView = @UserRoleName
			-- end get new inserted primary key value

			-- start get table name, primary keys and operation 
			declare @tablename nvarchar(100),
				@operation nvarchar(100),
				@OperationPrimaryKeys nvarchar(max),
				@OperationPrimaryKeysView nvarchar(max)

			set @tablename = 'InternalUserRole' 
			set @operation = 'ADD'
			set @OperationPrimaryKeys = 'UserRoleID'
			set @OperationPrimaryKeysView = 'UserRoleName'
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
			set @query = @query + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue

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
				,[InsertedDateTime]
				,[OperationPrimaryKeysview]
				,[OperationPrimaryKeysValueview]
				)
			values (@tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate(),@OperationPrimaryKeysview, @OperationPrimaryKeysValueview )
		end 
	end 
end