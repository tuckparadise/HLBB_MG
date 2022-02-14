CREATE TABLE [dbo].[tbl_ValueChanged](
	[ColID] [int] NOT NULL,
	[ColumnName] [nvarchar](max) NULL,
	[OriginalValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
	[ValueChanged] [varchar](4) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]