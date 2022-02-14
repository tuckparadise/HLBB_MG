CREATE TABLE [dbo].[TBD_aaNotificationOfPayment](
	[ARN] [nvarchar](100) NULL,
	[ProcessingDate] [datetime] NULL,
	[SolDevName] [nvarchar](max) NULL,
	[PaymentMode] [nvarchar](max) NULL,
	[BeneficiaryBankAcctNumber] [nvarchar](max) NULL,
	[PayeeName] [nvarchar](max) NULL,
	[PayeeID] [nvarchar](max) NULL,
	[BeneficiaryBank] [nvarchar](max) NULL,
	[AmountDisbursed] [money] NULL,
	[PaymentReference] [nvarchar](max) NULL,
	[PaymentDetails] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]