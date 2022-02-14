--select * from [AdminOperationAuditLog] order by InsertedDateTime desc

--select * from [AdminOperationAuditLog2] order by InsertedDateTime desc


CREATE   procedure [dbo].[usp_InternalUserRole_Edit]
@UserRoleID bigint = null ,
@UserRoleName nvarchar(max)  = null ,
@UserRoleDescription nvarchar(max) = null ,
@IsDUMakerDocumentation nvarchar(max) = null ,
@IsDUMakerValuation nvarchar(max) = null ,
@IsMortgageAdmin nvarchar(max) = null ,
@IsITAdminApplication nvarchar(max) = null ,
@IsITAdminSecurity nvarchar(max) = null ,
@IsDisbMaker nvarchar(max) = null ,
@IsDisbChecker nvarchar(max) = null ,
@IsRCOMaker nvarchar(max) = null ,
@IsRCOChecker nvarchar(max) = null ,
@IsTBOMaker nvarchar(max) = null ,
@IsTBOChecker nvarchar(max) = null ,
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
		(@IsTBOMaker = '' or @IsTBOMaker is null) and 
		(@IsTBOChecker = '' or @IsTBOChecker is null) and 
		(@IsValuerEditer = '' or @IsValuerEditer is null) and 
		(@IsSolicitorEditer = '' or @IsSolicitorEditer is null) and
		(@IsDeveloperEditer = '' or @IsDeveloperEditer is null) and 
		(@IsManager = '' or @IsManager is null) and 
		(@IsDeveloperStatusEditor = '' or @IsDeveloperStatusEditor is null) 
	)	
	begin
		set @Error = @Error + 'Please select at least 1 access rights'
	end 

	if (@Error = '')
	begin
		if exists 
		(
			select 1
			from InternalUserRole
			where UserRoleName= @UserRoleName
				and UserRoleID <> @UserRoleID
		)
		begin
			set @Error = 'Role Name existed in another record'
		end 
	end

	if (@Error = '')
	begin		
		
		-- start get new inserted primary key value 
		declare @OperationPrimaryKeysValue nvarchar(max)
		declare @OperationPrimaryKeysValueView nvarchar(max)

		select @OperationPrimaryKeysValue = @UserRoleID

		/*
		declare @UserRoleName nvarchar(max)

		select @UserRoleName = UserRoleName
		from InternalUserRole
		where UserRoleID = @UserRoleID
		*/
		select @OperationPrimaryKeysValueView = @UserRoleName
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max),
			@OperationPrimaryKeysView nvarchar(max)

		set @tablename = 'InternalUserRole' 
		set @operation = 'UPDATE'
		set @OperationPrimaryKeys = 'UserRoleID'
		set @OperationPrimaryKeysView = 'UserRoleName'
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
		set @query = @query + ' where '+@OperationPrimaryKeys+' = ' + @OperationPrimaryKeysValue

		--select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))

		set @ConcatenatedOriginalValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		-- end get Concatenated fields original values

		update [InternalUserRole]
		set 
           [UserRoleName] = @UserRoleName
           ,[UserRoleDescription] = @UserRoleDescription
           ,[IsDUMakerDocumentation] = @IsDUMakerDocumentation
           ,[IsDUMakerValuation] = @IsDUMakerValuation
           ,[IsMortgageAdmin] = @IsMortgageAdmin
           ,[IsITAdminApplication] = @IsITAdminApplication
           ,[IsITAdminSecurity] = @IsITAdminSecurity
           ,[IsDisbMaker] = @IsDisbMaker
           ,[IsDisbChecker] = @IsDisbChecker
           ,[IsRCOMaker] = @IsRCOMaker
           ,[IsRCOChecker] = @IsRCOChecker
           ,[IsTBOMaker] = @IsTBOMaker
           ,[IsTBOChecker] = @IsTBOChecker         
           ,[UpdatedDate]    = getdate()     
           ,[UpdatedUser] = @LoginUserEmail
		   ,IsValuerEditer = @IsValuerEditer,
			IsSolicitorEditer = @IsSolicitorEditer,
			IsDeveloperEditer = @IsDeveloperEditer,
			IsManager = @IsManager,
			IsDeveloperStatusEditor = @IsDeveloperStatusEditor
		where [UserRoleID] = @UserRoleID

		if (@@ROWCOUNT<> 0)
		BEGIN
			-- start get Concatenated fields new values 
			declare @ConcatenatedNewValue nvarchar(max)
			declare @queryResult2 nvarchar(max)

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
				,[InsertedDateTime]
				,[OperationPrimaryKeysview]
				,[OperationPrimaryKeysValueview]				
				)
			values (@tablename, @operation, @OperationPrimaryKeys, @OperationPrimaryKeysValue, @ConcatenatedFieldsName, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate(),@OperationPrimaryKeysview, @OperationPrimaryKeysValueview )
		END
		
	end 
end