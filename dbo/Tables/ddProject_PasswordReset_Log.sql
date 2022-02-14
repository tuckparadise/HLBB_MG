CREATE TABLE [dbo].[ddProject_PasswordReset_Log](
	[ID] [nvarchar](max) NULL,
	[ResetPasswordUser] [nvarchar](max) NULL,
	[ResetPasswordDatetime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]