CREATE TABLE [dbo].[AdminOperationAuditLog](
	[TableName] [nvarchar](100) NULL,
	[Operation] [nvarchar](100) NULL,
	[OperationPrimaryKeys] [nvarchar](max) NULL,
	[OperationPrimaryKeysValue] [nvarchar](max) NULL,
	[ConcatenatedFieldsName] [nvarchar](max) NULL,
	[ConcatenatedOriginalValue] [nvarchar](max) NULL,
	[ConcatenatedNewValue] [nvarchar](max) NULL,
	[Operator] [nvarchar](100) NULL,
	[InsertedDateTime] [datetime] NULL,
	[OperationPrimaryKeysView] [nvarchar](max) NULL,
	[OperationPrimaryKeysValueView] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE   TRIGGER [dbo].[AdminOperationAuditLog_Trigger]
ON [dbo].[AdminOperationAuditLog]
AFTER INSERT
AS
BEGIN	
	
	declare @zColumnNames nvarchar(max)
	declare @zOriValues nvarchar(max)
	declare @zNewValues nvarchar(max)
	declare @zTableName nvarchar(max)
	declare @zOperation nvarchar(max)
	declare @zOperationPrimaryKeysValue nvarchar(max)
	declare @zOperationPrimaryKeys nvarchar(max)
	declare @zOperator nvarchar(max)
	declare @zInsertedDateTime nvarchar(max)

	declare @zOperationPrimaryKeysValueview nvarchar(max)
	declare @zOperationPrimaryKeysview nvarchar(max)

	Declare @zColumnNameValuesValue Varchar(MAX); 
	Declare @zOriginalValuesValue Varchar(MAX); 
	Declare @zNewValuesValue Varchar(MAX); 

	SET NOCOUNT ON;
		
	select 
		@zTableName = isnull(TableName,''),	
		@zOperation = isnull(Operation,''),	
		@zOperationPrimaryKeys = isnull(OperationPrimaryKeys,''),
		@zOperationPrimaryKeysValue = isnull(OperationPrimaryKeysValue,''),
		@zColumnNames= isnull(ConcatenatedFieldsName,''),
		@zOriValues= isnull(ConcatenatedOriginalValue,''),
		@zNewValues= isnull(ConcatenatedNewValue,'') ,
		@zOperator = isnull(Operator,''),
		@zInsertedDateTime = isnull(InsertedDateTime,''),
		@zOperationPrimaryKeysview = isnull(OperationPrimaryKeysview,''),
		@zOperationPrimaryKeysValueview = isnull(OperationPrimaryKeysValueview,'')
	from inserted

	/*
	from AdminOperationAuditLog
	where tablename = 'SQLDUMakerDP_AttorneyCentre' and operation = 'update'
		and InsertedDateTime = '2020-06-15 10:54:25.410'
	*/

	if ((@zOperation = 'UPDATE' or @zOperation = 'EDIT') and @zTableName <> 'UserRoleMetric' and @zTableName <> 'InternalUserRole')
	begin
		truncate table tbl_ValueChanged

		insert into tbl_ValueChanged
		select tbl1.column_id as ColID, 
				isnull(tbl1.value,'') as ColumnName,
				isnull(tbl2.value,'') as OriginalValue ,
				isnull(tbl3.value,'') as NewValue ,
				case when (isnull(tbl2.value,'') <> isnull(tbl3.value,'') )then 'True' else '' end ValueChanged 	
			from [fn_split_string_to_column](@zColumnNames, ',') tbl1
				left join (select * from [fn_split_string_to_column](@zOriValues, ',')) tbl2 on tbl1.column_id = tbl2.column_id
				left join (select * from [fn_split_string_to_column](@zNewValues, ',')) tbl3 on tbl1.column_id = tbl3.column_id	
		
		Select @zColumnNameValuesValue = COALESCE(@zColumnNameValuesValue + ', ' + ColumnName, ColumnName) ,
			@zOriginalValuesValue = COALESCE(@zOriginalValuesValue + ', ' + OriginalValue, OriginalValue) ,
			@zNewValuesValue = COALESCE(@zNewValuesValue + ', ' + NewValue, NewValue) 
		--Select @zColumnNameValuesValue = COALESCE(@zColumnNameValuesValue + ', ' + isnull(ColumnName,''), isnull(ColumnName,'')) ,
		--	@zOriginalValuesValue = COALESCE(@zOriginalValuesValue + ', ' + isnull(OriginalValue,''), isnull(OriginalValue,'')) ,
		--	@zNewValuesValue = COALESCE(@zNewValuesValue + ', ' + isnull(NewValue,''), isnull(NewValue,'')) 
		From tbl_ValueChanged 
		where  valuechanged = 'True'

		if (isnull(@zColumnNameValuesValue,'')<> '')
		begin
			INSERT INTO [dbo].[AdminOperationAuditLog2]
           ([TableName]
           ,[Operation]
           ,[OperationPrimaryKeys]
           ,[OperationPrimaryKeysValue]
           ,[ConcatenatedFieldsName]
           ,[ConcatenatedOriginalValue]
           ,[ConcatenatedNewValue]
           ,[Operator]
           ,[InsertedDateTime]
           --,[OperationPrimaryKeysView]
           --,[OperationPrimaryKeysValueView]
		   )
			Select @zTableName, @zOperation, @zOperationPrimaryKeys, @zOperationPrimaryKeysValue, @zColumnNameValuesValue,@zOriginalValuesValue,@zNewValuesValue, @zOperator, @zInsertedDateTime
		end 
	end 
	
	if (@zOperation = 'UPDATE' and @zTableName <> 'UserRoleMetric' and @zTableName = 'InternalUserRole')
	begin
		truncate table tbl_ValueChanged

		insert into tbl_ValueChanged
		select tbl1.column_id as ColID, 
				isnull(tbl1.value,'') as ColumnName,
				isnull(tbl2.value,'') as OriginalValue ,
				isnull(tbl3.value,'') as NewValue ,
				case when (isnull(tbl2.value,'') <> isnull(tbl3.value,'') )then 'True' else '' end ValueChanged 	
			from [fn_split_string_to_column](@zColumnNames, ',') tbl1
				left join (select * from [fn_split_string_to_column](@zOriValues, ',')) tbl2 on tbl1.column_id = tbl2.column_id
				left join (select * from [fn_split_string_to_column](@zNewValues, ',')) tbl3 on tbl1.column_id = tbl3.column_id			

		Select @zColumnNameValuesValue = COALESCE(@zColumnNameValuesValue + ', ' + ColumnName, ColumnName) ,
			@zOriginalValuesValue = COALESCE(@zOriginalValuesValue + ', ' + OriginalValue, OriginalValue) ,
			@zNewValuesValue = COALESCE(@zNewValuesValue + ', ' + NewValue, NewValue) 
		--Select @zColumnNameValuesValue = COALESCE(@zColumnNameValuesValue + ', ' + isnull(ColumnName,''), isnull(ColumnName,'')) ,
		--	@zOriginalValuesValue = COALESCE(@zOriginalValuesValue + ', ' + isnull(OriginalValue,''), isnull(OriginalValue,'')) ,
		--	@zNewValuesValue = COALESCE(@zNewValuesValue + ', ' + isnull(NewValue,''), isnull(NewValue,'')) 
		From tbl_ValueChanged 
		where  valuechanged = 'True'

		if (isnull(@zColumnNameValuesValue,'')<> '')
		begin
			INSERT INTO [dbo].[AdminOperationAuditLog2]
           ([TableName]
           ,[Operation]
           ,[OperationPrimaryKeys]
           ,[OperationPrimaryKeysValue]
           ,[ConcatenatedFieldsName]
           ,[ConcatenatedOriginalValue]
           ,[ConcatenatedNewValue]
           ,[Operator]
           ,[InsertedDateTime]
           --,[OperationPrimaryKeysView]
           --,[OperationPrimaryKeysValueView]
		   )
			Select @zTableName, @zOperation, @zOperationPrimaryKeysview, @zOperationPrimaryKeysValueview, @zColumnNameValuesValue,@zOriginalValuesValue,@zNewValuesValue, @zOperator, @zInsertedDateTime
		end 
	end 

	SET NOCOUNT OFF;

END
GO

ALTER TABLE [dbo].[AdminOperationAuditLog] ENABLE TRIGGER [AdminOperationAuditLog_Trigger]