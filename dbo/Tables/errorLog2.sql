CREATE TABLE [dbo].[errorLog2](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[APIName] [nvarchar](max) NULL,
	[errorType] [nvarchar](max) NULL,
	[errorMessage] [nvarchar](max) NULL,
	[errorDetail] [nvarchar](max) NULL,
	[APIErrorDt] [datetime] NULL,
	[DateInserted] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]