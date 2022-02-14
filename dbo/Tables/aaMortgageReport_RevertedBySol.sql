﻿CREATE TABLE [dbo].[aaMortgageReport_RevertedBySol](
	[MortgateCenterCode] [nvarchar](max) NULL,
	[CreditApplicationNumber] [nvarchar](max) NULL,
	[CollateralPurpose] [nvarchar](max) NULL,
	[DisbursementManner] [nvarchar](max) NULL,
	[ApplicantName] [nvarchar](max) NULL,
	[SolicitorCode] [nvarchar](max) NULL,
	[ValuerCode] [nvarchar](max) NULL,
	[TotalFinancingAmount] [nvarchar](max) NULL,
	[DateOfLOAcceptance] [nvarchar](max) NULL,
	[DocumentationSubmissionDate] [nvarchar](max) NULL,
	[DocumentationApprovalDate] [nvarchar](max) NULL,
	[DocumentationApprovalMaker] [nvarchar](max) NULL,
	[DocumentationRejectionDate] [nvarchar](max) NULL,
	[DocumentationRejectionMaker] [nvarchar](max) NULL,
	[DocumentationCancellationSubmissionDate] [nvarchar](max) NULL,
	[DocumentationCancellationApprovalDate] [nvarchar](max) NULL,
	[VRSubmissionDate] [nvarchar](max) NULL,
	[VRApprovalDate] [nvarchar](max) NULL,
	[VRApprovalMaker] [nvarchar](max) NULL,
	[DocumentationStatus] [nvarchar](max) NULL,
	[VRStatus] [nvarchar](max) NULL,
	[DocumentationCancellationApprovalMaker] [nvarchar](max) NULL,
	[ValuationRequired] [nvarchar](max) NULL,
	[VRCancellationSubmissionDate] [nvarchar](max) NULL,
	[VRCancellationApprovalDate] [nvarchar](max) NULL,
	[VRCancellationApprovalMaker] [nvarchar](max) NULL,
	[VRLowerOMVSubmissionDate] [nvarchar](max) NULL,
	[VRLowerOMVApprovalDate] [nvarchar](max) NULL,
	[VRLowerOMVApprovalMaker] [nvarchar](max) NULL,
	[SolicitorName] [nvarchar](max) NULL,
	[ValuerName] [nvarchar](max) NULL,
	[DocumentatationSolicitorReferenceNumber] [nvarchar](max) NULL,
	[DocumentatationExecutionDateByCustomer] [nvarchar](max) NULL,
	[DocumentatationSNPCompletionDate] [nvarchar](max) NULL,
	[DocumentatationSNPExtendedCompletionDate] [nvarchar](max) NULL,
	[DocumentatationDeveloperBillingDueDate] [nvarchar](max) NULL,
	[DocumentatationHardCopyReceivedDate] [nvarchar](max) NULL,
	[VRValuerReferenceNumber] [nvarchar](max) NULL,
	[VRMarketValue] [nvarchar](max) NULL,
	[VRFireInsuranceValue] [nvarchar](max) NULL,
	[VRLowerOMVLowerOMVReasons] [nvarchar](max) NULL,
	[VRLowerOMVLowerOMVReasonsRemarks] [nvarchar](max) NULL,
	[CurrentDocumentMaker] [nvarchar](max) NULL,
	[CurrentVRMaker] [nvarchar](max) NULL,
	[VRCancellationAgeing] [nvarchar](max) NULL,
	[VRSubmissionAgeing] [nvarchar](max) NULL,
	[VRLowerOMVAgeing] [nvarchar](max) NULL,
	[DocumentationCancellationAgeing] [nvarchar](max) NULL,
	[DocumentationSubmissionnAgeing] [nvarchar](max) NULL,
	[SolicitorUpdateStatusOption] [nvarchar](max) NULL,
	[SolicitorUpdateStatusRemarks] [nvarchar](max) NULL,
	[SolicitorUpdateStatusDate] [nvarchar](max) NULL,
	[ValuerUpdateStatusOption] [nvarchar](max) NULL,
	[ValuerUpdateStatusRemarks] [nvarchar](max) NULL,
	[ValuerUpdateStatusDate] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]