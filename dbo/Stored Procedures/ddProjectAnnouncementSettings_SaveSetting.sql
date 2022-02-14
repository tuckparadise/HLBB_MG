CREATE       procedure [dbo].[ddProjectAnnouncementSettings_SaveSetting]
@LiveAnnouncementFlag bit = null ,
@ChangedUser nvarchar(max) = null 
as
begin
	
	if (@ChangedUser like 'K2:%')
	begin		
		set @ChangedUser = Stuff(@ChangedUser, 1, 3, '')					
	end 

	declare @tablename nvarchar(100),
		@operation nvarchar(100),
		@OperationPrimaryKeys nvarchar(max)

	set @tablename = 'ddProjectAnnouncementSettings ' 
	set @operation = 'EDIT'	
			
	-- start get operator 
	declare @operator nvarchar(100)
	set @operator = @ChangedUser
	-- start get operator 
	
	declare @fieldname nvarchar(max), 
		@ConcatenatedFieldsName nvarchar(max)
				
	SET @fieldname = 'LiveAnnouncementFlag'
	
	declare @ConcatenatedOriginalValue nvarchar(max)
	set @ConcatenatedOriginalValue = (select LiveAnnouncementFlag from ddProjectAnnouncementSettings)

	if not exists 
	(
		select 1 from ddProjectAnnouncementSettings
	)
	begin
		insert into ddProjectAnnouncementSettings values (@LiveAnnouncementFlag, @ChangedUser, getdate(), @ChangedUser, getdate())
	end 
	else
	begin 
		update ddProjectAnnouncementSettings
		set LiveAnnouncementFlag = @LiveAnnouncementFlag,
			UpdatedUser = @ChangedUser,
			UpdatedDate = getdate()
	end 	
	
	declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
		@ConcatenatedNewValue nvarchar(max)
	
	set @ConcatenatedNewValue = @LiveAnnouncementFlag

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