CREATE TABLE [dbo].[InternalUserSession](
	[UserName] [nvarchar](100) NOT NULL,
	[LogonDatetime] [datetime] NULL,
	[Expired] [datetime] NULL,
	[ClientIPAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_InternalUserSession] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]