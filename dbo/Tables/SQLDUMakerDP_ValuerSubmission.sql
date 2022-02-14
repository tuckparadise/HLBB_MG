CREATE TABLE [dbo].[SQLDUMakerDP_ValuerSubmission](
	[ARN] [nvarchar](100) NOT NULL,
	[FormSubmissionDate] [date] NULL,
	[DocumentExecutionSubmissionDate] [date] NULL,
	[Decision] [nvarchar](max) NULL,
	[DUMakerEmail] [nvarchar](100) NULL,
	[Status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLDUMakerDP_ValuerSubmission] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]