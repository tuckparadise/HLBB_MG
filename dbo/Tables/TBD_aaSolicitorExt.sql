CREATE TABLE [dbo].[TBD_aaSolicitorExt](
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[SolicitorEmail] [nvarchar](100) NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]