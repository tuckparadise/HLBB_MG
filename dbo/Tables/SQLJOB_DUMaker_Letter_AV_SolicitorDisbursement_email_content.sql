﻿CREATE TABLE [dbo].[SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content](
	[arn] [nvarchar](100) NOT NULL,
	[receiveremail] [nvarchar](150) NULL,
	[senderemail] [nvarchar](100) NULL,
	[email_header] [nvarchar](max) NULL,
	[email_body] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]