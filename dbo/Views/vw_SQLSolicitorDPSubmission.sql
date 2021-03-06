CREATE               VIEW [dbo].[vw_SQLSolicitorDPSubmission] AS


SELECT [ARN]
      ,[SolicitorCode]
      ,[SolicitorCancellationReportAttachmentURL]
      ,[SolicitorCancellationReportAttachment]
      ,[SolicitorCancellationReportAttachmentDate]
      ,[SolicitorRefReportAttachmentURL]
      ,[SolicitorRefReportAttachmentDate]
      ,[SolicitorRefReportAttachment]
      ,[SolicitorReferenceNumber]
      ,[PersonInChargeName]
      ,[DocumentAdminFeeCreditedToOptionID]
      ,[Remarks]
      ,[SolicitorCIFNumber]
      ,[ExecutionDateByCustomer]
      ,[SNPCompletionDateCommence]
      ,[SNPCompletionDate]
      ,[SNPExtendedCompletionDate]
      ,[DeveloperBillingDueForPayment]
      ,[DeveloperBillingDueDate]
      ,[AttendingSolicitor]
      ,[SolicitorDeclaration]
      ,[RefCoverLetter]
      ,[RefCustNRIC]
      ,[RefBoardResolution]
      ,[RefLandSearch]
      ,[RefPrincipalSPA]
      ,[RefLUToDev]
      ,[RefSpecimenOfCaveator]
      ,[RefDocAdminFeeForm]
      ,[RefOtherDocRemark]
      ,[ExeFacilitiesAgreement]
      ,[ExeChargeAnnexure]
      ,[ExeDeedOfAssignment]
      ,[ExePowerOfAttorney]
      ,[ExeLetterOfGuarantee]
      ,[ExeChargeOverCashDeposit]
      ,[ExeForm34]
      ,[ExeEntryOfPrivateCaveat]
      ,[ExeF16ANLC]
      ,[Status]
      ,[SStatus]
      ,[SStatusOthers]
      ,[OutputPDFID]
      ,[Completed]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLSolicitorDPSubmission]
  union 
  SELECT [ARN]
      ,[SolicitorCode]
      ,[SolicitorCancellationReportAttachmentURL]
      ,[SolicitorCancellationReportAttachment]
      ,[SolicitorCancellationReportAttachmentDate]
      ,[SolicitorRefReportAttachmentURL]
      ,[SolicitorRefReportAttachmentDate]
      ,[SolicitorRefReportAttachment]
      ,[SolicitorReferenceNumber]
      ,[PersonInChargeName]
      ,[DocumentAdminFeeCreditedToOptionID]
      ,[Remarks]
      ,[SolicitorCIFNumber]
      ,[ExecutionDateByCustomer]
      ,[SNPCompletionDateCommence]
      ,[SNPCompletionDate]
      ,[SNPExtendedCompletionDate]
      ,[DeveloperBillingDueForPayment]
      ,[DeveloperBillingDueDate]
      ,[AttendingSolicitor]
      ,[SolicitorDeclaration]
      ,[RefCoverLetter]
      ,[RefCustNRIC]
      ,[RefBoardResolution]
      ,[RefLandSearch]
      ,[RefPrincipalSPA]
      ,[RefLUToDev]
      ,[RefSpecimenOfCaveator]
      ,[RefDocAdminFeeForm]
      ,[RefOtherDocRemark]
      ,[ExeFacilitiesAgreement]
      ,[ExeChargeAnnexure]
      ,[ExeDeedOfAssignment]
      ,[ExePowerOfAttorney]
      ,[ExeLetterOfGuarantee]
      ,[ExeChargeOverCashDeposit]
      ,[ExeForm34]
      ,[ExeEntryOfPrivateCaveat]
      ,[ExeF16ANLC]
      ,[Status]
      ,[SStatus]
      ,[SStatusOthers]
      ,[OutputPDFID]
      ,[Completed]
      ,[CreatedDate]
      ,[UpdatedDate]
  FROM [dbo].[SQLSolicitorDPSubmission_staging]