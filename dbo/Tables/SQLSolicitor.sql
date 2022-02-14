CREATE TABLE [dbo].[SQLSolicitor](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorPassword] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[SolicitorName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[SolicitorLastLoginDatetime] [datetime] NULL,
	[PasswordForceReset] [nvarchar](100) NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[PasswordExpiryWarningDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
 CONSTRAINT [PK_SQLSolicitor] PRIMARY KEY CLUSTERED 
(
	[SolicitorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]