CREATE TABLE [dbo].[aaSolDisbursementSubmission_PaymentDetail_history](
	[arn] [nvarchar](100) NOT NULL,
	[RunningIDForCurrentSubmission] [bigint] NULL,
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
	[UpdatedDate] [datetime] NULL,
	[RunningIDForCompletedSubmission] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_aaSolDisbursementSubmission_PaymentDetail_history] PRIMARY KEY CLUSTERED 
(
	[arn] ASC,
	[RunningIDForCompletedSubmission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]