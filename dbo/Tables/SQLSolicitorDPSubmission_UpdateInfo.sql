CREATE TABLE [dbo].[SQLSolicitorDPSubmission_UpdateInfo](
	[ARN] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](100) NULL,
	[SStatus] [nvarchar](100) NULL,
	[SStatusOthers] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLSolicitorDPSubmission_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]