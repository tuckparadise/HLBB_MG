CREATE TABLE [dbo].[aaSolDisbursementSubmission_UpdateInfo](
	[arn] [nvarchar](100) NOT NULL,
	[UpdateInfo_Reason] [nvarchar](300) NULL,
	[UpdateInfo_Others] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_aaSolDisbursementSubmission_UpdateInfo] PRIMARY KEY CLUSTERED 
(
	[arn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]