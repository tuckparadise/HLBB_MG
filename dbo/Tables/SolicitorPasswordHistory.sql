CREATE TABLE [dbo].[SolicitorPasswordHistory](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorPassword] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[encryptionkey] [nvarchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]