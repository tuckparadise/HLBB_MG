CREATE TABLE [dbo].[TBD_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft](
	[arn] [nvarchar](100) NOT NULL,
	[RunningIDForCurrentSubmission] [bigint] NOT NULL,
	[FacilityAccountNumber] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeID] [nvarchar](100) NULL,
	[PayeeName] [nvarchar](200) NULL,
	[BeneficiaryBank] [nvarchar](200) NULL,
	[BeneficiaryBankAccountNumber] [nvarchar](100) NULL,
	[AmountDisburse] [money] NULL,
	[PaymentReference] [nvarchar](200) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[DisMakerEmail] [nvarchar](100) NULL,
	[DisMakerSubmissionDate] [datetime] NULL,
	[DisCheckerEmail] [nvarchar](100) NULL,
	[DisCheckerApprovedDate] [datetime] NULL,
	[RCOMakerEmail] [nvarchar](100) NULL,
	[RCOMakerApprovedDate] [datetime] NULL,
	[RCOCheckerEmail] [nvarchar](100) NULL,
	[RCOCheckerApprovedDate] [datetime] NULL,
	[AccountFrom] [nvarchar](100) NULL,
	[BillingRunningID] [bigint] NOT NULL,
 CONSTRAINT [PK_aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_Draft] PRIMARY KEY CLUSTERED 
(
	[arn] ASC,
	[RunningIDForCurrentSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]