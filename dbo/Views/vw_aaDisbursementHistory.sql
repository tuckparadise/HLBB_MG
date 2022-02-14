﻿CREATE                           VIEW [dbo].[vw_aaDisbursementHistory] AS

	select *, ROW_NUMBER() OVER (ORDER BY [UpdatedDate]) as ROWID
	from (
	SELECT 
		 'Bank' as [SubmissionFrom], 
		history.[arn]
      ,history.[BalanceAdviceLetterApplicableFlag]
      ,history.[UrgentFlag]
      ,history.[LS_RedemptionDueDateFlag]
      ,history.[LS_RedemptionDueDate]
      ,history.[LS_ExtendedCompletionDateFlag]
      ,history.[LS_CompletionDate]
      ,history.[LS_ExtendedCompletionDate]
      ,history.[PR_DeveloperBillingDueDateFlag]
      ,history.[PR_Stage2AFlag]
      ,history.[PR_Stage2BFlag]
      ,history.[PR_Stage2CFlag]
      ,history.[PR_Stage2DFlag]
      ,history.[PR_Stage2EFlag]
      ,history.[PR_Stage2FFlag]
      ,history.[PR_Stage2GFlag]
      ,history.[PR_Stage2HFlag]
      ,history.[PR_StageOthers]
      ,history.[PR_EarliestBillingDueDate]
      ,history.[PR_TotalBillingAmount]
      ,history.[PR_AnyBridgingFinancierFlag]
      ,history.[PR_BridgingFinancier]
      ,history.[PR_BridgingFinancierEmailAddress]
      ,history.[PR_BridgingFinancierRedemptionSum]
      ,history.[PR_RedemptionPaymentAccountNumber]
      ,history.[PR_BeneficiaryBank]
      ,history.[PR_BridgingFinancierRedemptionExpiryDate]
      ,history.[PR_DeveloperName]
      ,history.[PR_DeveloperEmailAddress]
      ,history.[PR_DeveloperPIC]
      ,history.[PR_DeveloperHDA]
      ,history.[PR_DeveloperHDABank]
      ,history.[LF_PayeeName]
      ,history.[LF_BilledAmount]
      ,history.[LF_AccountNumber]
      ,history.[LF_Bank]
      ,history.[LF_PaymentDescription]
      ,history.[LF_PaymentMode]
      ,history.[UpdateInfo_Reason]
      ,history.[UpdateInfo_Others]
      ,history.[CancelLoan_Remarks]
      ,history.[CancelLoan_File]
      ,history.[SolicitorSubmissionOption]
      ,history.[SolicitorSubmissionCompleted]
      ,history.[SolicitorCode]
      ,history.[SolicitorSubmissionDate]
      ,history.[SolicitorSubmissionPDFID]
      ,history.[DisbursementMakerEmailAddress]
      ,history.[DisbursementMakerDecision]
      ,history.[DisbursementMakerSubmissionCompleted]
      ,history.[DisbursementMakerRejectionReason]
      ,history.[DisbursementMakerSubmissionDate]
      ,history.[DisbursementMakerSubmissionPDFID]
      ,history.[DisbursementCheckerEmailAddress]
      ,history.[DisbursementCheckerDecision]
      ,history.[DisbursementCheckerSubmissionCompleted]
      ,history.[DisbursementCheckerRejectionReason]
      ,history.[DisbursementCheckerSubmissionDate]
      ,history.[DisbursementCheckerPDFID]
      ,history.[RCOMakerEmailAddress]
      ,history.[RCOMakerDecision]
      ,history.[RCOMakerSubmissionCompleted]
      ,history.[RCOMakerRejectionReason]
      ,history.[RCOMakerSubmissionDate]
      ,history.[RCOMakerPDFID]
      ,history.[RCOCheckerEmailAddress]
      ,history.[RCOCheckerDecision]
      ,history.[RCOCheckerSubmissionCompleted]
      ,history.[RCOCheckerRejectionReason]
      ,history.[RCOCheckerSubmissionDate]
      ,history.[RCOCheckerPDFID]
      ,history.[CreatedDate]
      ,history.[UpdatedDate]
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
      ,[RunningIDForCompletedSubmission]
	from aaIntDisbursementSubmission_History history 
	/*
	inner join 
	(
		select arn, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission from aaSolDisbursementSubmission_DisMakerSubmission_History group by arn 
	) tbl on tbl.arn = history.arn and tbl.maxRunningIDForCompletedSubmission = history.RunningIDForCompletedSubmission
	*/
	union 

	SELECT  'Solicitor' as [SubmissionFrom], 
		history.[arn]
      ,history.[BalanceAdviceLetterApplicableFlag]
      ,history.[UrgentFlag]
      ,history.[LS_RedemptionDueDateFlag]
      ,history.[LS_RedemptionDueDate]
      ,history.[LS_ExtendedCompletionDateFlag]
      ,history.[LS_CompletionDate]
      ,history.[LS_ExtendedCompletionDate]
      ,history.[PR_DeveloperBillingDueDateFlag]
      ,history.[PR_Stage2AFlag]
      ,history.[PR_Stage2BFlag]
      ,history.[PR_Stage2CFlag]
      ,history.[PR_Stage2DFlag]
      ,history.[PR_Stage2EFlag]
      ,history.[PR_Stage2FFlag]
      ,history.[PR_Stage2GFlag]
      ,history.[PR_Stage2HFlag]
      ,history.[PR_StageOthers]
      ,history.[PR_EarliestBillingDueDate]
      ,history.[PR_TotalBillingAmount]
      ,history.[PR_AnyBridgingFinancierFlag]
      ,history.[PR_BridgingFinancier]
      ,history.[PR_BridgingFinancierEmailAddress]
      ,history.[PR_BridgingFinancierRedemptionSum]
      ,history.[PR_RedemptionPaymentAccountNumber]
      ,history.[PR_BeneficiaryBank]
      ,history.[PR_BridgingFinancierRedemptionExpiryDate]
      ,history.[PR_DeveloperName]
      ,history.[PR_DeveloperEmailAddress]
      ,history.[PR_DeveloperPIC]
      ,history.[PR_DeveloperHDA]
      ,history.[PR_DeveloperHDABank]
      ,history.[LF_PayeeName]
      ,history.[LF_BilledAmount]
      ,history.[LF_AccountNumber]
      ,history.[LF_Bank]
      ,history.[LF_PaymentDescription]
      ,history.[LF_PaymentMode]
      ,history.[UpdateInfo_Reason]
      ,history.[UpdateInfo_Others]
      ,history.[CancelLoan_Remarks]
      ,history.[CancelLoan_File]
      ,history.[SolicitorSubmissionOption]
      ,history.[SolicitorSubmissionCompleted]
      ,history.[SolicitorCode]
      ,history.[SolicitorSubmissionDate]
      ,history.[SolicitorSubmissionPDFID]
      ,history.[DisbursementMakerEmailAddress]
      ,history.[DisbursementMakerDecision]
      ,history.[DisbursementMakerSubmissionCompleted]
      ,history.[DisbursementMakerRejectionReason]
      ,history.[DisbursementMakerSubmissionDate]
      ,history.[DisbursementMakerSubmissionPDFID]
      ,history.[DisbursementCheckerEmailAddress]
      ,history.[DisbursementCheckerDecision]
      ,history.[DisbursementCheckerSubmissionCompleted]
      ,history.[DisbursementCheckerRejectionReason]
      ,history.[DisbursementCheckerSubmissionDate]
      ,history.[DisbursementCheckerPDFID]
      ,history.[RCOMakerEmailAddress]
      ,history.[RCOMakerDecision]
      ,history.[RCOMakerSubmissionCompleted]
      ,history.[RCOMakerRejectionReason]
      ,history.[RCOMakerSubmissionDate]
      ,history.[RCOMakerPDFID]
      ,history.[RCOCheckerEmailAddress]
      ,history.[RCOCheckerDecision]
      ,history.[RCOCheckerSubmissionCompleted]
      ,history.[RCOCheckerRejectionReason]
      ,history.[RCOCheckerSubmissionDate]
      ,history.[RCOCheckerPDFID]
      ,history.[CreatedDate]
      ,history.[UpdatedDate]
       ,[FinalBillingFlag]
      , [ProjectSubmissionOption]
      , [ProjectSubmissionCompleted]
      , [DeveloperCode]
      , [ProjectCode]
      , [PhaseCode]
      ,[DeveloperLoginID]
      , [ProjectSubmissionDate]
      , [ProjectSubmissionPDFID]
      , [PR_Stage2IFlag]
      , [PR_Stage2JFlag]
      , [PR_Stage2KFlag]
      , [PR_Stage3]
      , [PR_Stage4]
      , [PR_Stage5]
      , [PR_Stage6]
      , [PR_Stage7]
      , [PR_Stage8]
      , [PR_Stage9]
      , [Attachment1]
      , [Attachment2]
      , [DraftID]
      , [SadaFlag]
      , [ConfirmationOfArchitectFlag]
      , [ConfirmationOfArchitectRemark]
      ,[RunningIDForCompletedSubmission] as [BillingRunningID]
      ,[RunningIDForCompletedSubmission]
	from aaSolDisbursementSubmission_DisMakerSubmission_History history 

	union 

	SELECT  'Developer' as [SubmissionFrom], 
		history.[arn]
      ,history.[BalanceAdviceLetterApplicableFlag]
      ,history.[UrgentFlag]
      ,history.[LS_RedemptionDueDateFlag]
      ,history.[LS_RedemptionDueDate]
      ,history.[LS_ExtendedCompletionDateFlag]
      ,history.[LS_CompletionDate]
      ,history.[LS_ExtendedCompletionDate]
      ,history.[PR_DeveloperBillingDueDateFlag]
      ,history.[PR_Stage2AFlag]
      ,history.[PR_Stage2BFlag]
      ,history.[PR_Stage2CFlag]
      ,history.[PR_Stage2DFlag]
      ,history.[PR_Stage2EFlag]
      ,history.[PR_Stage2FFlag]
      ,history.[PR_Stage2GFlag]
      ,history.[PR_Stage2HFlag]
      ,history.[PR_StageOthers]
      ,history.[PR_EarliestBillingDueDate]
      ,history.[PR_TotalBillingAmount]
      ,history.[PR_AnyBridgingFinancierFlag]
      ,history.[PR_BridgingFinancier]
      ,history.[PR_BridgingFinancierEmailAddress]
      ,history.[PR_BridgingFinancierRedemptionSum]
      ,history.[PR_RedemptionPaymentAccountNumber]
      ,history.[PR_BeneficiaryBank]
      ,history.[PR_BridgingFinancierRedemptionExpiryDate]
      ,history.[PR_DeveloperName]
      ,history.[PR_DeveloperEmailAddress]
      ,history.[PR_DeveloperPIC]
      ,history.[PR_DeveloperHDA]
      ,history.[PR_DeveloperHDABank]
      ,history.[LF_PayeeName]
      ,history.[LF_BilledAmount]
      ,history.[LF_AccountNumber]
      ,history.[LF_Bank]
      ,history.[LF_PaymentDescription]
      ,history.[LF_PaymentMode]
      ,history.[UpdateInfo_Reason]
      ,history.[UpdateInfo_Others]
      ,history.[CancelLoan_Remarks]
      ,history.[CancelLoan_File]
      ,history.[SolicitorSubmissionOption]
      ,history.[SolicitorSubmissionCompleted]
      ,history.[SolicitorCode]
      ,history.[SolicitorSubmissionDate]
      ,history.[SolicitorSubmissionPDFID]
      ,history.[DisbursementMakerEmailAddress]
      ,history.[DisbursementMakerDecision]
      ,history.[DisbursementMakerSubmissionCompleted]
      ,history.[DisbursementMakerRejectionReason]
      ,history.[DisbursementMakerSubmissionDate]
      ,history.[DisbursementMakerSubmissionPDFID]
      ,history.[DisbursementCheckerEmailAddress]
      ,history.[DisbursementCheckerDecision]
      ,history.[DisbursementCheckerSubmissionCompleted]
      ,history.[DisbursementCheckerRejectionReason]
      ,history.[DisbursementCheckerSubmissionDate]
      ,history.[DisbursementCheckerPDFID]
      ,history.[RCOMakerEmailAddress]
      ,history.[RCOMakerDecision]
      ,history.[RCOMakerSubmissionCompleted]
      ,history.[RCOMakerRejectionReason]
      ,history.[RCOMakerSubmissionDate]
      ,history.[RCOMakerPDFID]
      ,history.[RCOCheckerEmailAddress]
      ,history.[RCOCheckerDecision]
      ,history.[RCOCheckerSubmissionCompleted]
      ,history.[RCOCheckerRejectionReason]
      ,history.[RCOCheckerSubmissionDate]
      ,history.[RCOCheckerPDFID]
      ,history.[CreatedDate]
      ,history.[UpdatedDate]
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
      ,[RunningIDForCompletedSubmission]
	from ddProjectDisbursementSubmission_DisMakerHistory history 
	) tbl1

	/*
	inner join 
	(
		select arn, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission from aaSolDisbursementSubmission_DisMakerSubmission_History group by arn 
	) tbl on tbl.arn = history.arn and tbl.maxRunningIDForCompletedSubmission = history.RunningIDForCompletedSubmission
	*/