CREATE TABLE [dbo].[ddProjectDeveloper](
	[ID] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[Status] [nvarchar](100) NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[LastLoginDatetime] [datetime] NULL,
	[PasswordForceReset] [nvarchar](100) NULL,
	[PasswordExpiryDate] [datetime] NULL,
	[PasswordExpiryWarningDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
	[AcknowledgementFlag] [bit] NULL,
	[Email] [nvarchar](max) NULL,
	[AcknowledgementDate] [datetime] NULL,
	[AcknowledgementUploaded] [bit] NULL,
	[AcknowledgementDateUploaded] [datetime] NULL,
	[EmailSent] [bit] NULL,
	[EmailSentDate] [datetime] NULL,
 CONSTRAINT [PK_ddProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]