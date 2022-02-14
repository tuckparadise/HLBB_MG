CREATE TABLE [dbo].[FailedEmailLog](
	[Receiver] [nvarchar](max) NULL,
	[EmailHeader] [nvarchar](max) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[ExceptionDetail] [nvarchar](max) NULL,
	[LogDateTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]