CREATE TABLE [dbo].[ddProjectDeveloperProjectMapping_Draft](
	[ProjectCode] [nvarchar](100) NULL,
	[ProjectName] [nvarchar](100) NULL,
	[DeveloperCode] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]