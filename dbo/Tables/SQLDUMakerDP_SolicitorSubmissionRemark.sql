﻿CREATE TABLE [dbo].[SQLDUMakerDP_SolicitorSubmissionRemark](
	[ARN] [nvarchar](100) NOT NULL,
	[DUMakerEmail] [nvarchar](100) NOT NULL,
	[RemarkID] [bigint] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SQLDUMakerDPSubmissionRemark_1] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC,
	[DUMakerEmail] ASC,
	[RemarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]