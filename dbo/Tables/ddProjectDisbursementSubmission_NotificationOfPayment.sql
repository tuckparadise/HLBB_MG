﻿CREATE TABLE [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment](
	[arn] [nvarchar](100) NULL,
	[RunningIDForCurrentSubmission] [bigint] NULL,
	[FacilityAccountNumber] [nvarchar](100) NULL,
	[PaymentMode] [nvarchar](100) NULL,
	[PayeeID] [nvarchar](100) NULL,
	[PayeeName] [nvarchar](200) NULL,
	[BeneficiaryBank] [nvarchar](200) NULL,
	[BeneficiaryBankAccountNumber] [nvarchar](100) NULL,
	[AmountDisburse] [money] NULL,
	[PaymentReference] [nvarchar](200) NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[PaymentCreatedDate] [datetime] NULL,
	[PaymentUpdatedDate] [datetime] NULL,
	[DisMakerEmail] [nvarchar](100) NULL,
	[DisMakerSubmissionDate] [datetime] NULL,
	[DisCheckerEmail] [nvarchar](100) NULL,
	[DisCheckerApprovedDate] [datetime] NULL,
	[RCOMakerEmail] [nvarchar](100) NULL,
	[RCOMakerApprovedDate] [datetime] NULL,
	[RCOCheckerEmail] [nvarchar](100) NULL,
	[RCOCheckerApprovedDate] [datetime] NULL,
	[AccountFrom] [nvarchar](100) NULL,
	[DevName] [nvarchar](max) NULL,
	[SolName] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Locked] [bit] NULL,
	[DevCode] [nvarchar](100) NULL,
	[SolCode] [nvarchar](100) NULL,
	[DevEmail] [nvarchar](max) NULL,
	[SolEmail] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](max) NULL,
	[ProjectName] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](max) NULL,
	[PhaseName] [nvarchar](max) NULL,
	[AddressLine1] [nvarchar](max) NULL,
	[PrimaryCustomerName] [nvarchar](max) NULL,
	[BillingAmount] [money] NULL,
	[FinalBillingFlag] [bit] NULL,
	[DeveloperLoginID] [nvarchar](max) NULL,
	[BillingStage] [nvarchar](max) NULL,
	[pdfid] [bigint] NULL,
	[ExtraField1] [nvarchar](max) NULL,
	[ExtraField2] [nvarchar](max) NULL,
	[ExtraField3] [nvarchar](max) NULL,
	[ExtraField4] [nvarchar](max) NULL,
	[RunningID] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]