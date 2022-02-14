CREATE         procedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRecordByARN]
@arn nvarchar(100) = null 
as
begin
	with cte1 (arn, firstRunningIDForCompletedSubmission,maxRunningIDForCompletedSubmission) as
	(
	select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission
	from aaSolDisbursementSubmission_DisMakerSubmission_History
	group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, maxRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, cte1.maxRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag
		from cte1
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	)	
	/*
	SELECT 
		sqlloads.[arn], 
		isnull(solsub.[SolicitorSubmissionOption],'Submitted') as 'SolicitorSubmissionOption',
		case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',		
		case when solsub.[UrgentFlag] is null then case when DATEDIFF(day, doc.DeveloperBillingDueDate, getdate()) > 10 then CAST(1 as bit) else CAST(0 as bit) end else solsub.[UrgentFlag] end as [UrgentFlag], 		
		case when history.arn IS NOT NULL and sqlloads.disbursementmanner = 'LS' then cast(0 as bit) else solsub.[BalanceAdviceLetterApplicableFlag] end as 'BalanceAdviceLetterApplicableFlag',      
		solsub.[LS_RedemptionDueDateFlag]
		,solsub.[LS_RedemptionDueDate]
		,solsub.[LS_ExtendedCompletionDateFlag]
		,case when solsub.[LS_CompletionDate] is not null then solsub.[LS_CompletionDate] else doc.SNPCompletionDate end as 'LS_CompletionDate'
		,case when solsub.[LS_ExtendedCompletionDate] is not null then solsub.[LS_ExtendedCompletionDate] else doc.SNPExtendedCompletionDate end as 'LS_ExtendedCompletionDate'		
		,isnull(solsub.[PR_DeveloperBillingDueDateFlag],cast(1 as bit)) as 'PR_DeveloperBillingDueDateFlag'
		,solsub.[PR_Stage2AFlag]
		,solsub.[PR_Stage2BFlag]
		,solsub.[PR_Stage2CFlag]
		,solsub.[PR_Stage2DFlag]
		,solsub.[PR_Stage2EFlag]
		,solsub.[PR_Stage2FFlag]
		,solsub.[PR_Stage2GFlag]
		,solsub.[PR_Stage2HFlag]
		,solsub.[PR_StageOthers]
		--,solsub.[PR_EarliestBillingDueDate]
		,case when solsub.PR_EarliestBillingDueDate is null then doc.DeveloperBillingDueDate else solsub.PR_EarliestBillingDueDate end as 'PR_EarliestBillingDueDate'		
		,solsub.[PR_TotalBillingAmount]
		,case when history.[PR_AnyBridgingFinancierFlag] is not null then history.[PR_AnyBridgingFinancierFlag] else isnull(solsub.[PR_AnyBridgingFinancierFlag],cast(1 as bit)) end as 'PR_AnyBridgingFinancierFlag'
		,case when history.[PR_BridgingFinancier] is not null then history.[PR_BridgingFinancier] else solsub.[PR_BridgingFinancier] end as 'PR_BridgingFinancier'
		,case when history.[PR_BridgingFinancierEmailAddress] is not null then history.[PR_BridgingFinancierEmailAddress] else solsub.[PR_BridgingFinancierEmailAddress] end as 'PR_BridgingFinancierEmailAddress'
		,case when history.[PR_BridgingFinancierRedemptionSum] is not null then history.[PR_BridgingFinancierRedemptionSum] else solsub.[PR_BridgingFinancierRedemptionSum] end as 'PR_BridgingFinancierRedemptionSum'
		,case when history.[PR_RedemptionPaymentAccountNumber] is not null then history.[PR_RedemptionPaymentAccountNumber] else solsub.[PR_RedemptionPaymentAccountNumber] end as 'PR_RedemptionPaymentAccountNumber'
		,case when history.[PR_BeneficiaryBank] is not null then history.[PR_BeneficiaryBank] else solsub.[PR_BeneficiaryBank] end as 'PR_BeneficiaryBank'
		,case when history.[PR_BridgingFinancierRedemptionExpiryDate] is not null then history.[PR_BridgingFinancierRedemptionExpiryDate] else solsub.[PR_BridgingFinancierRedemptionExpiryDate] end as 'PR_BridgingFinancierRedemptionExpiryDate'
		,case when history.[PR_DeveloperName] is not null then history.[PR_DeveloperName] else solsub.[PR_DeveloperName] end as 'PR_DeveloperName'
		,case when history.[PR_DeveloperEmailAddress] is not null then history.[PR_DeveloperEmailAddress] else solsub.[PR_DeveloperEmailAddress] end as 'PR_DeveloperEmailAddress'
		,case when history.[PR_DeveloperPIC] is not null then history.[PR_DeveloperPIC] else solsub.[PR_DeveloperPIC] end as 'PR_DeveloperPIC'
		,case when history.[PR_DeveloperHDA] is not null then history.[PR_DeveloperHDA] else solsub.[PR_DeveloperPIC] end as 'PR_DeveloperHDA'
		,case when history.[PR_DeveloperHDABank] is not null then history.[PR_DeveloperHDABank] else solsub.[PR_DeveloperHDABank] end as 'PR_DeveloperHDABank'						
		,case when solsub.[LF_PayeeName] is not null then solsub.[LF_PayeeName] else sqlloads.SolicitorName end as 'LF_PayeeName'
		--,solsub.[LF_BilledAmount]
		,case when solsub.LF_BilledAmount is not null then solsub.LF_BilledAmount else sqlloads.LegalFeesFinancedAmount end as 'LF_BilledAmount'		
		,solsub.[LF_AccountNumber]
		,solsub.[LF_Bank]
		,solsub.[LF_PaymentDescription]
		,isnull(solsub.[LF_PaymentMode],'IBG') as 'LF_PaymentMode'
		,isnull(solsub.[UpdateInfo_Reason],'Others') as 'UpdateInfo_Reason'
		,solsub.[UpdateInfo_Others]
		,solsub.[CancelLoan_Remarks]
		,solsub.[CancelLoan_File]     
		,solsub.[SolicitorSubmissionCompleted]
		,solsub.[SolicitorCode]
		,solsub.[SolicitorSubmissionDate]   
		 ,solsub.[DisbursementMakerEmailAddress]
      ,solsub.[DisbursementMakerDecision]
      ,solsub.[DisbursementMakerSubmissionCompleted]
      ,solsub.[DisbursementMakerRejectionReason]
      ,solsub.[DisbursementMakerSubmissionDate]      
      ,solsub.[DisbursementCheckerEmailAddress]
      ,solsub.[DisbursementCheckerDecision]
      ,solsub.[DisbursementCheckerSubmissionCompleted]
      ,solsub.[DisbursementCheckerRejectionReason]
      ,solsub.[DisbursementCheckerSubmissionDate]
      ,solsub.[CreatedDate]
      ,solsub.[UpdatedDate]	  
	  ,solsub.[RCOMakerEmailAddress]
      ,solsub.[RCOMakerDecision]
      ,solsub.[RCOMakerSubmissionCompleted]
      ,solsub.[RCOMakerRejectionReason]
      ,solsub.[RCOMakerSubmissionDate]
	  */
	    SELECT dumakersub.[arn]
	,dumakersub.[SolicitorSubmissionOption]
	,case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage'
      ,dumakersub.[BalanceAdviceLetterApplicableFlag]
      ,dumakersub.[UrgentFlag]
      ,dumakersub.[LS_RedemptionDueDateFlag]
      ,dumakersub.[LS_RedemptionDueDate]
      ,dumakersub.[LS_ExtendedCompletionDateFlag]
      ,dumakersub.[LS_CompletionDate]
      ,dumakersub.[LS_ExtendedCompletionDate]
      ,dumakersub.[PR_DeveloperBillingDueDateFlag]
      ,dumakersub.[PR_Stage2AFlag]
      ,dumakersub.[PR_Stage2BFlag]
      ,dumakersub.[PR_Stage2CFlag]
      ,dumakersub.[PR_Stage2DFlag]
      ,dumakersub.[PR_Stage2EFlag]
      ,dumakersub.[PR_Stage2FFlag]
      ,dumakersub.[PR_Stage2GFlag]
      ,dumakersub.[PR_Stage2HFlag]
      ,dumakersub.[PR_StageOthers]
      ,dumakersub.[PR_EarliestBillingDueDate]
      ,dumakersub.[PR_TotalBillingAmount]
      ,dumakersub.[PR_AnyBridgingFinancierFlag]
      ,dumakersub.[PR_BridgingFinancier]
      ,dumakersub.[PR_BridgingFinancierEmailAddress]
      ,dumakersub.[PR_BridgingFinancierRedemptionSum]
      ,dumakersub.[PR_RedemptionPaymentAccountNumber]
      ,dumakersub.[PR_BeneficiaryBank]
      ,dumakersub.[PR_BridgingFinancierRedemptionExpiryDate]
      ,dumakersub.[PR_DeveloperName]
      ,dumakersub.[PR_DeveloperEmailAddress]
      ,dumakersub.[PR_DeveloperPIC]
      ,dumakersub.[PR_DeveloperHDA]
      ,dumakersub.[PR_DeveloperHDABank]
      ,dumakersub.[LF_PayeeName]
      ,dumakersub.[LF_BilledAmount]
      ,dumakersub.[LF_AccountNumber]
      ,dumakersub.[LF_Bank]
      ,dumakersub.[LF_PaymentDescription]
      ,dumakersub.[LF_PaymentMode]
      ,dumakersub.[UpdateInfo_Reason]
      ,dumakersub.[UpdateInfo_Others]
      ,dumakersub.[CancelLoan_Remarks]
      ,dumakersub.[CancelLoan_File]      
      ,dumakersub.[SolicitorSubmissionCompleted]
      ,dumakersub.[SolicitorCode]
      ,dumakersub.[SolicitorSubmissionDate]
      ,dumakersub.[SolicitorSubmissionPDFID]
      ,dumakersub.[DisbursementMakerEmailAddress]
      ,dumakersub.[DisbursementMakerDecision]
      ,dumakersub.[DisbursementMakerSubmissionCompleted]
      ,dumakersub.[DisbursementMakerRejectionReason]
      ,dumakersub.[DisbursementMakerSubmissionDate]
      ,dumakersub.[DisbursementCheckerEmailAddress]
      ,dumakersub.[DisbursementCheckerDecision]
      ,dumakersub.[DisbursementCheckerSubmissionCompleted]
      ,dumakersub.[DisbursementCheckerRejectionReason]
      ,dumakersub.[DisbursementCheckerSubmissionDate]
      ,dumakersub.[CreatedDate]
      ,dumakersub.[UpdatedDate]	  	
      ,dumakersub.[RCOMakerPDFID]
      ,dumakersub.[RCOMakerEmailAddress]
      ,dumakersub.[RCOMakerDecision]
      ,dumakersub.[RCOMakerSubmissionCompleted]
      ,dumakersub.[RCOMakerRejectionReason]
      ,dumakersub.[RCOMakerSubmissionDate]
	 ,case when isnull(dumakersub.RCOCheckerEmailAddress,'') ='' then RejectNoteForRCOMaker.RCOCheckerEmailAddress else dumakersub.RCOCheckerEmailAddress end as RCOCheckerEmailAddress 
	 ,case when isnull(dumakersub.RCOCheckerDecision,'') ='' then RejectNoteForRCOMaker.RCOCheckerDecision else dumakersub.RCOCheckerDecision end as RCOCheckerDecision 
	 ,case when isnull(dumakersub.RCOCheckerSubmissionCompleted,'') ='' then RejectNoteForRCOMaker.RCOCheckerSubmissionCompleted else dumakersub.RCOCheckerSubmissionCompleted end as RCOCheckerSubmissionCompleted 
	 ,case when isnull(dumakersub.RCOCheckerRejectionReason,'') ='' then RejectNoteForRCOMaker.RCOCheckerRejectionReason else dumakersub.RCOCheckerRejectionReason end as RCOCheckerRejectionReason 
	 ,case when isnull(dumakersub.RCOCheckerSubmissionDate,'') ='' then RejectNoteForRCOMaker.RCOCheckerSubmissionDate else dumakersub.RCOCheckerSubmissionDate end as RCOCheckerSubmissionDate 
      ,dumakersub.[RCOCheckerPDFID]
	FROM sqlloads 
		inner join [dbo].aaSolDisbursementSubmission_DisMakerSubmission dumakersub on dumakersub.arn = sqlloads.arn 
		left join SQLSolicitorDPSubmission doc on doc.arn = dumakersub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1
		left join cte2 on cte2.arn = dumakersub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte2.arn and history.RunningIDForCompletedSubmission = cte2.maxRunningIDForCompletedSubmission
		left join [dbo].aaSolDisbursementSubmission_RCOCheckerRejected RejectNoteForRCOMaker on RejectNoteForRCOMaker.arn = sqlloads.arn
	where 
	sqlloads.arn =@arn 
end