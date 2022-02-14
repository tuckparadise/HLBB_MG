CREATE     procedure [dbo].[ddProjectNotificationOfPayment_Setting_Update]
@days int = null ,
@LastUpdatedUser nvarchar(max) = null,
@EmailFlag int = null,
@error nvarchar(max) = null output 
as
begin	
	if (@LastUpdatedUser like 'K2:%')
	begin		
		set @LastUpdatedUser = Stuff(@LastUpdatedUser, 1, 3, '')					
	end 

	set @error =''

	-- validation 
	if (isnull(@days,0) = 0) set @error = @error + 'Days field cannot be blank and must be more than 0<br>'
	declare @b nvarchar(max)
	set @b = dbo.IsInt(@days)
	if (@b =0) set @error = @error + 'Only numeric values are allowed for Days field<br>'		
		
	if (@error = '')
	begin
		
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'ddProjectNotificationOfPayment_Setting ' 
		set @operation = 'EDIT'	
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @LastUpdatedUser
		-- start get operator 
	
		declare @fieldname nvarchar(max), 
			@ConcatenatedFieldsName nvarchar(max)
				
		SET @fieldname = 'Days,EmailFlag'
	
		declare @ConcatenatedOriginalValue nvarchar(max)
		set @ConcatenatedOriginalValue = (select [Days] from ddProjectNotificationOfPayment_Setting)

		declare @EmailFlagValue nvarchar(max)

		set @EmailFlagValue = (select cast (Email as nvarchar(max) )from ddProjectNotificationOfPayment_Setting)

		set @ConcatenatedOriginalValue =  @ConcatenatedOriginalValue + ',' + @EmailFlagValue 

		if not exists 
		(
			select 1 from ddProjectNotificationOfPayment_Setting
		)
		begin			
			INSERT INTO [dbo].[ddProjectNotificationOfPayment_Setting]
           ([Days]
           ,[LastUpdatedDate]
           ,[LastUpdatedUser]
           ,[Email])
			values (@days, getdate(), @LastUpdatedUser,@emailFlag)
		end 
		else
		begin 
			update ddProjectNotificationOfPayment_Setting
			set [days]=	@days,
				[Email] = @EmailFlag,
				lastupdateddate = getdate(),
				lastupdateduser = case when @LastUpdatedUser like 'K2:%' then Stuff(@LastUpdatedUser, 1, 3, '')	else @LastUpdatedUser end 
		end 	
	
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
	
		--set @ConcatenatedNewValue = @days + ',' + cast (@EmailFlag as nvarchar(max) )
		set @ConcatenatedNewValue = cast (@days as nvarchar(max) ) + ',' + cast (@EmailFlag as nvarchar(max) )

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
		values (@tablename, @operation, @OperationPrimaryKeys, NULL, @fieldname, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate() )

		
	end 
end