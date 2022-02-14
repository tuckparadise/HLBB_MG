CREATE TABLE [dbo].[SQLJOB_DUMaker_Letter_A1_generate_list_aging_staging2](
	[RowNumber] [bigint] NULL,
	[arn] [nvarchar](100) NOT NULL,
	[DateOfLOAcceptance] [date] NULL,
	[receiveremail] [nvarchar](150) NULL,
	[senderemail] [nvarchar](100) NULL,
	[email_header] [nvarchar](max) NULL,
	[email_body] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]