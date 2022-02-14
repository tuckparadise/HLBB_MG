CREATE TABLE [dbo].[InternalUserSessionActive](
	[UserName] [nvarchar](100) NOT NULL,
	[LogonDatetime] [datetime] NULL,
	[ClientIPAddress] [nvarchar](100) NULL
) ON [PRIMARY]