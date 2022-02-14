CREATE TABLE [dbo].[ddProjectEmailToDeveloperLog](
	[SurrogateID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeveloperCode] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](max) NULL,
	[DocumentationApprovedDate] [datetime] NULL,
	[EmailARN] [nvarchar](max) NULL,
	[EmailHeader] [nvarchar](max) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[EmailSender] [nvarchar](max) NULL,
	[EmailReceiver] [nvarchar](max) NULL,
	[EmailSentFlag] [bit] NULL,
	[EmailSentDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedUser] [nvarchar](max) NULL,
	[DeletedDate] [datetime] NULL,
	[runcount] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]