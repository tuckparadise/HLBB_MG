CREATE TABLE [dbo].[TBD_ValuerUISession](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[Var1] [nvarchar](max) NOT NULL,
	[Var2] [nvarchar](max) NOT NULL,
	[Var3] [nvarchar](max) NOT NULL,
	[Var4] [nvarchar](max) NOT NULL,
	[Var5] [nvarchar](max) NOT NULL,
	[Var6] [nvarchar](max) NOT NULL,
	[Var7] [nvarchar](max) NOT NULL,
	[Var8] [nvarchar](max) NOT NULL,
	[Var9] [nvarchar](max) NOT NULL,
	[Var10] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ValuerUISession] PRIMARY KEY CLUSTERED 
(
	[ValuerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]