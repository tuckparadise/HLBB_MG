CREATE TABLE [dbo].[TBD_aaDeveloperExt](
	[DeveloperCode] [nvarchar](100) NOT NULL,
	[DeveloperEmail] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]