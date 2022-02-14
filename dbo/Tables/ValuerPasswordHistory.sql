CREATE TABLE [dbo].[ValuerPasswordHistory](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[ValuerPassword] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[encryptionkey] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]