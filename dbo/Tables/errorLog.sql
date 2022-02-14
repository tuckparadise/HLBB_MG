CREATE TABLE [dbo].[errorLog](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[APIName] [nvarchar](max) NULL,
	[errorType] [nvarchar](max) NULL,
	[errorMessage] [nvarchar](max) NULL,
	[errorDetail] [nvarchar](max) NULL,
	[APIErrorDt] [datetime] NULL,
	[DateInserted] [datetime] NULL,
 CONSTRAINT [PK_errorLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]