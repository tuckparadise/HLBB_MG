﻿CREATE TABLE [dbo].[tbd_ddProjectDisbursementSubmission_SubmissionHistory](
	[arn] [nvarchar](100) NULL,
	[FinalBillingFlag] [bit] NULL,
	[PR_Stage2AFlag] [bit] NULL,
	[PR_Stage2BFlag] [bit] NULL,
	[PR_Stage2CFlag] [bit] NULL,
	[PR_Stage2DFlag] [bit] NULL,
	[PR_Stage2EFlag] [bit] NULL,
	[PR_Stage2FFlag] [bit] NULL,
	[PR_Stage2GFlag] [bit] NULL,
	[PR_Stage2HFlag] [bit] NULL,
	[PR_BillingStage] [nvarchar](max) NULL,
	[PR_StageOthers] [nvarchar](max) NULL,
	[PR_EarliestBillingDueDate] [date] NULL,
	[PR_TotalBillingAmount] [money] NULL,
	[PR_AnyBridgingFinancierFlag] [bit] NULL,
	[PR_BridgingFinancier] [nvarchar](100) NULL,
	[PR_BridgingFinancierEmailAddress] [nvarchar](100) NULL,
	[PR_BridgingFinancierRedemptionSum] [money] NULL,
	[PR_RedemptionPaymentAccountNumber] [nvarchar](100) NULL,
	[PR_BeneficiaryBank] [nvarchar](100) NULL,
	[PR_BridgingFinancierRedemptionExpiryDate] [date] NULL,
	[PR_DeveloperName] [nvarchar](100) NULL,
	[PR_DeveloperEmailAddress] [nvarchar](100) NULL,
	[PR_DeveloperPIC] [nvarchar](100) NULL,
	[PR_DeveloperHDA] [nvarchar](100) NULL,
	[PR_DeveloperHDABank] [nvarchar](100) NULL,
	[DeveloperCode] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](max) NULL,
	[WorkflowStatus] [nvarchar](max) NULL,
	[ProjectSubmissionDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[SurrogateRunningID] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]