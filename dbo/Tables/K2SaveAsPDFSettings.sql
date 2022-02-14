CREATE TABLE [dbo].[K2SaveAsPDFSettings](
	[id] [int] NOT NULL,
	[AppendDate] [bit] NULL,
	[CleanIFrames] [bit] NULL,
	[FileName] [nvarchar](100) NULL,
	[PageSize] [nvarchar](100) NULL,
	[PageOrientation] [nvarchar](100) NULL,
	[Theme] [nvarchar](100) NULL,
	[LeftMargin] [int] NULL,
	[RightMargin] [int] NULL,
	[TopMargin] [int] NULL,
	[BottomMargin] [int] NULL,
 CONSTRAINT [PK_K2SaveAsPDFSettings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]