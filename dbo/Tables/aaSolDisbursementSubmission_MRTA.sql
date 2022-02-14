CREATE TABLE [dbo].[aaSolDisbursementSubmission_MRTA](
	[arn] [nvarchar](100) NOT NULL,
	[runningid] [bigint] NOT NULL,
	[FacilityAccountNumber] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeID] [nvarchar](50) NULL,
	[PayeeName] [nvarchar](200) NULL,
	[BeneficiaryBank] [nvarchar](200) NULL,
	[BeneficiaryBankAccountNumber] [nvarchar](100) NULL,
	[AmountDisburse] [money] NULL,
	[PaymentReference] [nvarchar](200) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]