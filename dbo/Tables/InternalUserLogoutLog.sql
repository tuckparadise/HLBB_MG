CREATE TABLE [dbo].[InternalUserLogoutLog](
	[UserName] [nvarchar](100) NOT NULL,
	[logoutDatetime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]