CREATE   procedure [dbo].[aaNotificationOfPayment_Setting_Update]
@days int = null ,
@LastUpdatedUser nvarchar(max) = null,
@error nvarchar(max) = null output 
as
begin	
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

		set @tablename = 'aaNotificationOfPayment_Setting ' 
		set @operation = 'EDIT'	
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @LastUpdatedUser
		-- start get operator 
	
		declare @fieldname nvarchar(max), 
			@ConcatenatedFieldsName nvarchar(max)
				
		SET @fieldname = 'Days'
	
		declare @ConcatenatedOriginalValue nvarchar(max)
		set @ConcatenatedOriginalValue = (select [Days] from ddProjectNotificationOfPayment_Setting)

		if not exists 
		(
			select 1 from aaNotificationOfPayment_Setting
		)
		begin
			insert into aaNotificationOfPayment_Setting values (@days,  getdate(), @LastUpdatedUser)
		end 
		else
		begin 
			update aaNotificationOfPayment_Setting
		set [days]=	@days,
			lastupdateddate = getdate(),
			lastupdateduser = case when @LastUpdatedUser like 'K2:%' then Stuff(@LastUpdatedUser, 1, 3, '')	else @LastUpdatedUser end 
		end 	
	
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
	
		set @ConcatenatedNewValue = @days

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