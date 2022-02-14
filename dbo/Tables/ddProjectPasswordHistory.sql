CREATE TABLE [dbo].[ddProjectPasswordHistory](
	[ProjectCode] [nvarchar](100) NOT NULL,
	[ProjectPassword] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[encryptionkey] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]