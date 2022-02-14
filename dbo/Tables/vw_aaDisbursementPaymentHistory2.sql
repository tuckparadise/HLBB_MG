﻿CREATE TABLE [dbo].[vw_aaDisbursementPaymentHistory2](
	[MortgageCentre] [nvarchar](16) NULL,
	[CreditApplicationNumber] [nvarchar](100) NOT NULL,
	[DeveloperName] [nvarchar](max) NULL,
	[DeveloperCode] [nvarchar](20) NULL,
	[PhaseName] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](100) NULL,
	[BillingStage] [nvarchar](max) NULL,
	[DisbursementCheckerApprovalDate] [nvarchar](4000) NULL,
	[DebitFrom] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeName] [nvarchar](200) NULL,
	[PayeeID] [nvarchar](50) NULL,
	[BeneficiaryBank] [nvarchar](200) NULL,
	[BeneficiaryBankAccountNumber] [nvarchar](100) NULL,
	[Amount] [money] NULL,
	[PaymentReference] [nvarchar](200) NULL,
	[Unit/Parcel No.] [nvarchar](max) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[DisbursementMakerName] [nvarchar](max) NULL,
	[DisbursementCheckerName] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]