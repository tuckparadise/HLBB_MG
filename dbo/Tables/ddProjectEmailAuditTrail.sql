CREATE TABLE [dbo].[ddProjectEmailAuditTrail](
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
	[OperationPrimaryKeysValueView] [nvarchar](max) NULL,
	[DeveloperCode] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]