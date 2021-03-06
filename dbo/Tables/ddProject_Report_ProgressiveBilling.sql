CREATE TABLE [dbo].[ddProject_Report_ProgressiveBilling](
	[MortgageCentre] [nvarchar](16) NULL,
	[CreditApplicationNumber] [nvarchar](100) NULL,
	[Unit/Parcel No.] [nvarchar](max) NULL,
	[DeveloperName] [nvarchar](max) NULL,
	[DeveloperCode] [nvarchar](20) NULL,
	[PhaseName] [nvarchar](max) NULL,
	[PhaseCode] [nvarchar](100) NULL,
	[SADAIndicator] [varchar](3) NOT NULL,
	[SolicitorName] [nvarchar](50) NULL,
	[SolicitorCode] [nvarchar](100) NULL,
	[SPAPrice] [money] NULL,
	[SPADate] [nvarchar](4000) NULL,
	[SPA Construction Period (months)] [int] NULL,
	[Extended Construction Period (months)] [int] NULL,
	[TotalFacilityAmount] [money] NULL,
	[Total Financing Amount (exclude FLVM)] [money] NULL,
	[1st Payment (Release) Date] [nvarchar](4000) NULL,
	[TotalDisbursedAmount] [money] NULL,
	[CompletedBilling] [nvarchar](max) NULL,
	[SubmissionType] [varchar](9) NOT NULL,
	[SubmissionDate] [nvarchar](4000) NULL,
	[WFStatus] [varchar](45) NULL,
	[DisbursementMakerRejectionDate] [nvarchar](4000) NULL,
	[DeveloperResubmissionDate] [nvarchar](4000) NULL,
	[DisbursementAgeing] [int] NULL,
	[BillingStage] [nvarchar](max) NULL,
	[BillingDueDate] [nvarchar](4000) NULL,
	[BillingAmount (by dev)] [money] NULL,
	[DisbursedAmount] [money] NULL,
	[FinalBilling] [varchar](3) NULL,
	[DisbursementMakerName] [nvarchar](max) NULL,
	[DisbursementMakerDeletionDate] [nvarchar](4000) NULL,
	[DisbursementMakerApprovalDate] [nvarchar](4000) NULL,
	[DisbursementMakerApprovalAgeing] [int] NULL,
	[DisbursementCheckerName] [nvarchar](max) NULL,
	[DisbursementCheckerDeletionDate] [nvarchar](4000) NULL,
	[DisbursementCheckerApprovalDate] [nvarchar](4000) NULL,
	[DisbursementCheckerApprovalAgeing] [int] NULL,
	[ReportUser] [nvarchar](max) NULL,
	[CurrentDisbursementMaker] [nvarchar](max) NULL,
	[CurrentDisbursementChecker] [nvarchar](max) NULL,
	[DisbursementMakerPickupDate] [nvarchar](4000) NULL,
	[DisbursementCheckerRejectionDate] [nvarchar](4000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]