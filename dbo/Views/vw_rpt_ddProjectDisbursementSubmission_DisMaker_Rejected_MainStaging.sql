﻿CREATE                 VIEW [dbo].[vw_rpt_ddProjectDisbursementSubmission_DisMaker_Rejected_MainStaging] AS

SELECT [arn]
      ,[BalanceAdviceLetterApplicableFlag]
      ,[UrgentFlag]
      ,[LS_RedemptionDueDateFlag]
      ,[LS_RedemptionDueDate]
      ,[LS_ExtendedCompletionDateFlag]
      ,[LS_CompletionDate]
      ,[LS_ExtendedCompletionDate]
      ,[PR_DeveloperBillingDueDateFlag]
      ,[PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      ,[PR_AnyBridgingFinancierFlag]
      ,[PR_BridgingFinancier]
      ,[PR_BridgingFinancierEmailAddress]
      ,[PR_BridgingFinancierRedemptionSum]
      ,[PR_RedemptionPaymentAccountNumber]
      ,[PR_BeneficiaryBank]
      ,[PR_BridgingFinancierRedemptionExpiryDate]
      ,[PR_DeveloperName]
      ,[PR_DeveloperEmailAddress]
      ,[PR_DeveloperPIC]
      ,[PR_DeveloperHDA]
      ,[PR_DeveloperHDABank]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[UpdateInfo_Reason]
      ,[UpdateInfo_Others]
      ,[CancelLoan_Remarks]
      ,[CancelLoan_File]
      ,[SolicitorSubmissionOption]
      ,[SolicitorSubmissionCompleted]
      ,[SolicitorCode]
      ,[SolicitorSubmissionDate]
      ,[SolicitorSubmissionPDFID]
      ,[DisbursementMakerEmailAddress]
      ,[DisbursementMakerDecision]
      ,[DisbursementMakerSubmissionCompleted]
      ,[DisbursementMakerRejectionReason]
      ,[DisbursementMakerSubmissionDate]
      ,[DisbursementMakerSubmissionPDFID]
      ,[DisbursementCheckerEmailAddress]
      ,[DisbursementCheckerDecision]
      ,[DisbursementCheckerSubmissionCompleted]
      ,[DisbursementCheckerRejectionReason]
      ,[DisbursementCheckerSubmissionDate]
      ,[DisbursementCheckerPDFID]
      ,[RCOMakerEmailAddress]
      ,[RCOMakerDecision]
      ,[RCOMakerSubmissionCompleted]
      ,[RCOMakerRejectionReason]
      ,[RCOMakerSubmissionDate]
      ,[RCOMakerPDFID]
      ,[RCOCheckerEmailAddress]
      ,[RCOCheckerDecision]
      ,[RCOCheckerSubmissionCompleted]
      ,[RCOCheckerRejectionReason]
      ,[RCOCheckerSubmissionDate]
      ,[RCOCheckerPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[FinalBillingFlag]
      ,[ProjectSubmissionOption]
      ,[ProjectSubmissionCompleted]
      ,[DeveloperCode]
      ,[ProjectCode]
      ,[PhaseCode]
      ,[DeveloperLoginID]
      ,[ProjectSubmissionDate]
      ,[ProjectSubmissionPDFID]
      ,[PR_Stage2IFlag]
      ,[PR_Stage2JFlag]
      ,[PR_Stage2KFlag]
      ,[PR_Stage3]
      ,[PR_Stage4]
      ,[PR_Stage5]
      ,[PR_Stage6]
      ,[PR_Stage7]
      ,[PR_Stage8]
      ,[PR_Stage9]
      ,[Attachment1]
      ,[Attachment2]
      ,[DraftID]
      ,[SadaFlag]
      ,[ConfirmationOfArchitectFlag]
      ,[ConfirmationOfArchitectRemark]
      ,[BillingRunningID]
      ,[PrimaryCustomerName]
      ,[FinancingAmount]
      ,[AddressLine1]
      ,[ExtraField1]
      ,[ExtraField2]
      ,[ExtraField3]
      ,[ExtraField4]
      ,[RejectedRunningID]
      ,[SPADate]
      ,[SPAConstructionPeriodInMonths]
      ,[ExtendedConstructionPeriodInMonths]
	  ,0 as [Staging]
  FROM [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]
  union
  
SELECT [arn]
      ,[BalanceAdviceLetterApplicableFlag]
      ,[UrgentFlag]
      ,[LS_RedemptionDueDateFlag]
      ,[LS_RedemptionDueDate]
      ,[LS_ExtendedCompletionDateFlag]
      ,[LS_CompletionDate]
      ,[LS_ExtendedCompletionDate]
      ,[PR_DeveloperBillingDueDateFlag]
      ,[PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      ,[PR_AnyBridgingFinancierFlag]
      ,[PR_BridgingFinancier]
      ,[PR_BridgingFinancierEmailAddress]
      ,[PR_BridgingFinancierRedemptionSum]
      ,[PR_RedemptionPaymentAccountNumber]
      ,[PR_BeneficiaryBank]
      ,[PR_BridgingFinancierRedemptionExpiryDate]
      ,[PR_DeveloperName]
      ,[PR_DeveloperEmailAddress]
      ,[PR_DeveloperPIC]
      ,[PR_DeveloperHDA]
      ,[PR_DeveloperHDABank]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[UpdateInfo_Reason]
      ,[UpdateInfo_Others]
      ,[CancelLoan_Remarks]
      ,[CancelLoan_File]
      ,[SolicitorSubmissionOption]
      ,[SolicitorSubmissionCompleted]
      ,[SolicitorCode]
      ,[SolicitorSubmissionDate]
      ,[SolicitorSubmissionPDFID]
      ,[DisbursementMakerEmailAddress]
      ,[DisbursementMakerDecision]
      ,[DisbursementMakerSubmissionCompleted]
      ,[DisbursementMakerRejectionReason]
      ,[DisbursementMakerSubmissionDate]
      ,[DisbursementMakerSubmissionPDFID]
      ,[DisbursementCheckerEmailAddress]
      ,[DisbursementCheckerDecision]
      ,[DisbursementCheckerSubmissionCompleted]
      ,[DisbursementCheckerRejectionReason]
      ,[DisbursementCheckerSubmissionDate]
      ,[DisbursementCheckerPDFID]
      ,[RCOMakerEmailAddress]
      ,[RCOMakerDecision]
      ,[RCOMakerSubmissionCompleted]
      ,[RCOMakerRejectionReason]
      ,[RCOMakerSubmissionDate]
      ,[RCOMakerPDFID]
      ,[RCOCheckerEmailAddress]
      ,[RCOCheckerDecision]
      ,[RCOCheckerSubmissionCompleted]
      ,[RCOCheckerRejectionReason]
      ,[RCOCheckerSubmissionDate]
      ,[RCOCheckerPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[FinalBillingFlag]
      ,[ProjectSubmissionOption]
      ,[ProjectSubmissionCompleted]
      ,[DeveloperCode]
      ,[ProjectCode]
      ,[PhaseCode]
      ,[DeveloperLoginID]
      ,[ProjectSubmissionDate]
      ,[ProjectSubmissionPDFID]
      ,[PR_Stage2IFlag]
      ,[PR_Stage2JFlag]
      ,[PR_Stage2KFlag]
      ,[PR_Stage3]
      ,[PR_Stage4]
      ,[PR_Stage5]
      ,[PR_Stage6]
      ,[PR_Stage7]
      ,[PR_Stage8]
      ,[PR_Stage9]
      ,[Attachment1]
      ,[Attachment2]
      ,[DraftID]
      ,[SadaFlag]
      ,[ConfirmationOfArchitectFlag]
      ,[ConfirmationOfArchitectRemark]
      ,[BillingRunningID]
      ,[PrimaryCustomerName]
      ,[FinancingAmount]
      ,[AddressLine1]
      ,[ExtraField1]
      ,[ExtraField2]
      ,[ExtraField3]
      ,[ExtraField4]
      ,[RejectedRunningID]
      ,[SPADate]
      ,[SPAConstructionPeriodInMonths]
      ,[ExtendedConstructionPeriodInMonths]
	  ,1 as [Staging]
  FROM [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected_staging]