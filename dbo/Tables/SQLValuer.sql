CREATE TABLE [dbo].[SQLValuer](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[ValuerPassword] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[ValuerName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[ValuerLastLoginDatetime] [datetime] NULL,
	[PasswordForceReset] [nvarchar](100) NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[PasswordExpiryWarningDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
 CONSTRAINT [PK_SQLValuer] PRIMARY KEY CLUSTERED 
(
	[ValuerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]