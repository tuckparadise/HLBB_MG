CREATE TABLE [dbo].[InternalUser](
	[UserName] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserFullName] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[LastLoginDatetime] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
	[IDLastLockedByAdminDatetime] [datetime] NULL,
	[Remarks] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]