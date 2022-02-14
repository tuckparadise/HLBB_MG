CREATE TABLE [dbo].[TBD_aaSolicitorDisbursementSubmissionAttachment_Staging](
	[ARN] [nvarchar](100) NOT NULL,
	[SolicitorCode] [nvarchar](100) NOT NULL,
	[AttachmentID] [int] NOT NULL,
	[Attachment] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[AttachmentName] [nvarchar](max) NULL,
 CONSTRAINT [PK_aaSolicitorDisbursementSubmissionAttachment_Staging] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[SolicitorCode] ASC,
	[AttachmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]