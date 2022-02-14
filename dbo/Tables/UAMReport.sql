CREATE TABLE [dbo].[UAMReport](
	[UserName] [nvarchar](100) NOT NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserFullName] [nvarchar](max) NULL,
	[Branch] [nvarchar](max) NULL,
	[LastLoginDatetime] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IDLastLockedDatetime] [datetime] NULL,
	[AccessList] [nvarchar](max) NULL,
 CONSTRAINT [PK_UAMReport] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]