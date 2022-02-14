CREATE TABLE [dbo].[ddProjectNewPhaseCodeEmailToAdminLog](
	[SurrogateID] [bigint] IDENTITY(1,1) NOT NULL,
	[DeveloperCode] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](max) NULL,
	[NewLIDate] [datetime] NULL,
	[ARN] [nvarchar](max) NULL,
	[EmailHeader] [nvarchar](max) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[EmailSender] [nvarchar](max) NULL,
	[EmailReceiver] [nvarchar](max) NULL,
	[EmailSentFlag] [bit] NULL,
	[EmailSentDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedUser] [nvarchar](max) NULL,
	[DeletedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]