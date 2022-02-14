CREATE TABLE [dbo].[EDMS_Settings](
	[EDMSDocType] [nvarchar](100) NOT NULL,
	[ProfileName] [nvarchar](100) NULL,
	[LoginUser] [nvarchar](100) NULL,
	[DefaultFileName] [nvarchar](100) NULL,
	[EDMSUploadFolder] [nvarchar](100) NULL,
	[Category] [nvarchar](100) NULL,
 CONSTRAINT [PK_EDMS_Settings_1] PRIMARY KEY CLUSTERED 
(
	[EDMSDocType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]