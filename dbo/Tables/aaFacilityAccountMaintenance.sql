CREATE TABLE [dbo].[aaFacilityAccountMaintenance](
	[arn] [nvarchar](100) NOT NULL,
	[Account1] [nvarchar](100) NULL,
	[Account2] [nvarchar](100) NULL,
	[Account3] [nvarchar](100) NULL,
	[Account4] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[DUMakerEmail] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]