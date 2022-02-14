﻿CREATE TABLE [dbo].[SQLDUMakerDP_SolicitorSubmission_Rejected](
	[ARN] [nvarchar](100) NOT NULL,
	[a1] [bit] NULL,
	[a2] [bit] NULL,
	[a3] [bit] NULL,
	[a4] [bit] NULL,
	[a5] [bit] NULL,
	[a6] [bit] NULL,
	[a7] [bit] NULL,
	[a8_Remarks] [nvarchar](max) NULL,
	[a9] [bit] NULL,
	[aOthers] [nvarchar](max) NULL,
	[AttorneyCentreID] [bigint] NULL,
	[AttorneyNameID] [bigint] NULL,
	[b1] [bit] NULL,
	[b2] [bit] NULL,
	[b3] [bit] NULL,
	[b4] [bit] NULL,
	[b5] [bit] NULL,
	[b6] [bit] NULL,
	[bOthers] [nvarchar](max) NULL,
	[FacilityCancelledDate] [date] NULL,
	[DUMakerEmail] [nvarchar](100) NULL,
	[HardCopyReceivedDate] [date] NULL,
	[Decision] [nvarchar](max) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[SolicitorCode] [nvarchar](100) NULL,
	[SolicitorCancellationReportAttachmentURL] [nvarchar](max) NULL,
	[SolicitorCancellationReportAttachment] [nvarchar](max) NULL,
	[SolicitorCancellationReportAttachmentDate] [date] NULL,
	[SolicitorRefReportAttachmentURL] [nvarchar](max) NULL,
	[SolicitorRefReportAttachmentDate] [date] NULL,
	[SolicitorRefReportAttachment] [nvarchar](max) NULL,
	[SolicitorReferenceNumber] [nvarchar](100) NULL,
	[PersonInChargeName] [nvarchar](max) NULL,
	[DocumentAdminFeeCreditedToOptionID] [bigint] NULL,
	[Remarks] [nvarchar](max) NULL,
	[SolicitorCIFNumber] [nvarchar](100) NULL,
	[ExecutionDateByCustomer] [date] NULL,
	[SNPCompletionDateCommence] [bit] NULL,
	[SNPCompletionDate] [date] NULL,
	[SNPExtendedCompletionDate] [date] NULL,
	[DeveloperBillingDueForPayment] [bit] NULL,
	[DeveloperBillingDueDate] [date] NULL,
	[AttendingSolicitor] [nvarchar](max) NULL,
	[SolicitorDeclaration] [bit] NULL,
	[RefCoverLetter] [bit] NULL,
	[RefCustNRIC] [bit] NULL,
	[RefBoardResolution] [bit] NULL,
	[RefLandSearch] [bit] NULL,
	[RefPrincipalSPA] [bit] NULL,
	[RefLUToDev] [bit] NULL,
	[RefSpecimenOfCaveator] [bit] NULL,
	[RefDocAdminFeeForm] [bit] NULL,
	[RefOtherDocRemark] [nvarchar](max) NULL,
	[ExeFacilitiesAgreement] [bit] NULL,
	[ExeChargeAnnexure] [bit] NULL,
	[ExeDeedOfAssignment] [bit] NULL,
	[ExePowerOfAttorney] [bit] NULL,
	[ExeLetterOfGuarantee] [bit] NULL,
	[ExeChargeOverCashDeposit] [bit] NULL,
	[ExeForm34] [bit] NULL,
	[ExeEntryOfPrivateCaveat] [bit] NULL,
	[ExeF16ANLC] [bit] NULL,
	[Status] [nvarchar](100) NULL,
	[AttorneyCentre] [nvarchar](max) NULL,
	[AttorneyName] [nvarchar](max) NULL,
	[SStatus] [nvarchar](100) NULL,
	[SStatusOthers] [nvarchar](max) NULL,
	[OutputPDFID] [bigint] NULL,
	[SolicitorCreatedDate] [date] NULL,
	[SolicitorUpdatedDate] [date] NULL,
 CONSTRAINT [PK_SQLDUMakerDP_SolicitorSubmission_Rejected] PRIMARY KEY CLUSTERED 
(
	[ARN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]