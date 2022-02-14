CREATE         procedure [dbo].[aa_SolDisbursementSubmission_GetRecord_ByARN_ForPDFForm]
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
	SELECT 
		sqlloads.[arn], 
		case solsub.[SolicitorSubmissionOption] when 'Resubmitted' then 'Submitted' else isnull(solsub.[SolicitorSubmissionOption],'Submitted') end as 'SolicitorSubmissionOption',
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',		
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
		,case when history.[PR_DeveloperHDA] is not null then history.[PR_DeveloperHDA] else solsub.[PR_DeveloperHDA] end as 'PR_DeveloperHDA'
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
      ,solsub.[CreatedDate]
      ,solsub.[UpdatedDate]	  
	  ,case when history.arn IS NOT NULL and sqlloads.disbursementmanner = 'LS' then cast(1 as bit) else cast(0 as bit) end as 'ForceBalanceAdviceLetterApplicableFlagIndicator'      
	FROM sqlloads 
		left join [dbo].[aaSolDisbursementSubmission_staging] solsub on solsub.arn = sqlloads.arn 
		left join SQLSolicitorDPSubmission doc on doc.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_History history on history.arn = sqlloads.arn and history.RunningIDForCompletedSubmission = 1
		left join cte2 on cte2.arn = sqlloads.arn 
		left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte2.arn and history.RunningIDForCompletedSubmission = cte2.maxRunningIDForCompletedSubmission		

	where 
	sqlloads.arn =@arn 
end