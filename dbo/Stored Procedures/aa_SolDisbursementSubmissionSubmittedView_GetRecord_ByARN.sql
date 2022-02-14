--drop procedure [aa_SolDisbursementSubmissionRejected_GetRecord_ByARN]


 --[aa_SolDisbursementSubmission_GetRecord_ByARN] 'TAI/RB/2019/Z0002022'
CREATE               procedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetRecord_ByARN]
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
		sqlloads.[arn] 
		,case solsub.[SolicitorSubmissionOption] when 'Resubmitted' then 'Submitted' else isnull(solsub.[SolicitorSubmissionOption],'Submitted') end as 'SolicitorSubmissionOption'
		,case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage'				
		
		,case when SubmittedView.arn is  null then solsub.[UrgentFlag] else SubmittedView.[UrgentFlag] end as [UrgentFlag]
		,case when SubmittedView.arn is  null then solsub.[BalanceAdviceLetterApplicableFlag] else SubmittedView.[BalanceAdviceLetterApplicableFlag] end as [BalanceAdviceLetterApplicableFlag]
		,case when SubmittedView.arn is  null then solsub.[LS_RedemptionDueDateFlag] else SubmittedView.[LS_RedemptionDueDateFlag] end as [LS_RedemptionDueDateFlag]
		,case when SubmittedView.arn is  null then solsub.[LS_RedemptionDueDate] else SubmittedView.[LS_RedemptionDueDate] end as [LS_RedemptionDueDate]
		,case when SubmittedView.arn is  null then solsub.[LS_ExtendedCompletionDateFlag] else SubmittedView.[LS_ExtendedCompletionDateFlag] end as [LS_ExtendedCompletionDateFlag]		
		,case when SubmittedView.arn is  null then solsub.[LS_CompletionDate] else SubmittedView.[LS_CompletionDate] end as [LS_CompletionDate]
		,case when SubmittedView.arn is  null then solsub.[LS_ExtendedCompletionDate] else SubmittedView.[LS_ExtendedCompletionDate] end as [LS_ExtendedCompletionDate]
		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperBillingDueDateFlag] else SubmittedView.[PR_DeveloperBillingDueDateFlag] end as [PR_DeveloperBillingDueDateFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2AFlag] else SubmittedView.[PR_Stage2AFlag] end as [PR_Stage2AFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2BFlag] else SubmittedView.[PR_Stage2BFlag] end as [PR_Stage2BFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2CFlag] else SubmittedView.[PR_Stage2CFlag] end as [PR_Stage2CFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2DFlag] else SubmittedView.[PR_Stage2DFlag] end as [PR_Stage2DFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2EFlag] else SubmittedView.[PR_Stage2EFlag] end as [PR_Stage2EFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2FFlag] else SubmittedView.[PR_Stage2FFlag] end as [PR_Stage2FFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2GFlag] else SubmittedView.[PR_Stage2GFlag] end as [PR_Stage2GFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_Stage2HFlag] else SubmittedView.[PR_Stage2HFlag] end as [PR_Stage2HFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_StageOthers] else SubmittedView.[PR_StageOthers] end as [PR_StageOthers]
		,case when SubmittedView.arn is  null then solsub.[PR_EarliestBillingDueDate] else SubmittedView.[PR_EarliestBillingDueDate] end as [PR_EarliestBillingDueDate]		
		,case when SubmittedView.arn is  null then solsub.[PR_TotalBillingAmount] else SubmittedView.[PR_TotalBillingAmount] end as [PR_TotalBillingAmount]

		,case when SubmittedView.arn is  null then solsub.[PR_AnyBridgingFinancierFlag] else SubmittedView.[PR_AnyBridgingFinancierFlag] end as [PR_AnyBridgingFinancierFlag]
		,case when SubmittedView.arn is  null then solsub.[PR_BridgingFinancier] else SubmittedView.[PR_BridgingFinancier] end as [PR_BridgingFinancier]
		,case when SubmittedView.arn is  null then solsub.[PR_BridgingFinancierEmailAddress] else SubmittedView.[PR_BridgingFinancierEmailAddress] end as [PR_BridgingFinancierEmailAddress]
		,case when SubmittedView.arn is  null then solsub.[PR_BridgingFinancierRedemptionSum] else SubmittedView.[PR_BridgingFinancierRedemptionSum] end as [PR_BridgingFinancierRedemptionSum]
		,case when SubmittedView.arn is  null then solsub.[PR_RedemptionPaymentAccountNumber] else SubmittedView.[PR_RedemptionPaymentAccountNumber] end as [PR_RedemptionPaymentAccountNumber]

		,case when SubmittedView.arn is  null then solsub.[PR_BeneficiaryBank] else SubmittedView.[PR_BeneficiaryBank] end as [PR_BeneficiaryBank]
		,case when SubmittedView.arn is  null then solsub.[PR_BridgingFinancierRedemptionExpiryDate] else SubmittedView.[PR_BridgingFinancierRedemptionExpiryDate] end as [PR_BridgingFinancierRedemptionExpiryDate]
		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperName] else SubmittedView.[PR_DeveloperName] end as [PR_DeveloperName]
		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperEmailAddress] else SubmittedView.[PR_DeveloperEmailAddress] end as [PR_DeveloperEmailAddress]
		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperPIC] else SubmittedView.[PR_DeveloperPIC] end as [PR_DeveloperPIC]

		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperHDA] else SubmittedView.[PR_DeveloperHDA] end as [PR_DeveloperHDA]
		,case when SubmittedView.arn is  null then solsub.[PR_DeveloperHDABank] else SubmittedView.[PR_DeveloperHDABank] end as [PR_DeveloperHDABank] 
		,case when SubmittedView.arn is  null then solsub.[LF_PayeeName] else SubmittedView.[LF_PayeeName] end as [LF_PayeeName]
		,case when SubmittedView.arn is  null then solsub.LF_BilledAmount else SubmittedView.LF_BilledAmount end as LF_BilledAmount
		,case when SubmittedView.arn is  null then solsub.[LF_AccountNumber] else SubmittedView.[LF_AccountNumber] end as [LF_AccountNumber]
		,case when SubmittedView.arn is  null then solsub.[LF_Bank] else SubmittedView.[LF_Bank] end as [LF_Bank]
		,case when SubmittedView.arn is  null then solsub.[LF_PaymentDescription] else SubmittedView.[LF_PaymentDescription] end as [LF_PaymentDescription]
		,case when SubmittedView.arn is  null then solsub.[LF_PaymentMode] else SubmittedView.[LF_PaymentMode] end as [LF_PaymentMode]
		,case when SubmittedView.arn is  null then solsub.UpdateInfo_Reason else SubmittedView.UpdateInfo_Reason end as UpdateInfo_Reason		
		,case when SubmittedView.arn is  null then solsub.[UpdateInfo_Others] else SubmittedView.[UpdateInfo_Others] end as [UpdateInfo_Others]		
		,case when SubmittedView.arn is  null then solsub.[CancelLoan_Remarks] else SubmittedView.[CancelLoan_Remarks] end as [CancelLoan_Remarks]		
		,case when SubmittedView.arn is  null then solsub.[CancelLoan_File]     else SubmittedView.[CancelLoan_File] end as [CancelLoan_File]		
		,case when SubmittedView.arn is  null then solsub.[SolicitorSubmissionCompleted] else SubmittedView.[SolicitorSubmissionCompleted] end as [SolicitorSubmissionCompleted]		
		,case when SubmittedView.arn is  null then solsub.[SolicitorCode] else SubmittedView.[SolicitorCode] end as [SolicitorCode]		
		,case when SubmittedView.arn is  null then solsub.[SolicitorSubmissionDate]  else SubmittedView.[SolicitorSubmissionDate] end as [SolicitorSubmissionDate]		    		
      ,case when SubmittedView.arn is  null then solsub.[CreatedDate] else SubmittedView.[CreatedDate] end as [CreatedDate]		
      ,case when SubmittedView.arn is  null then solsub.[UpdatedDate] else SubmittedView.[UpdatedDate] end as [UpdatedDate]			  
	  ,null as 'ForceBalanceAdviceLetterApplicableFlagIndicator'      
	FROM sqlloads 
		left join [dbo].vw_aaSolDisbursementSubmission solsub on solsub.arn = sqlloads.arn 
		left join [dbo].aaSolDisbursementSubmissionSubmittedView SubmittedView on SubmittedView.arn = sqlloads.arn 
		left join SQLSolicitorDPSubmission doc on doc.arn = solsub.arn 
		left join cte2 on cte2.arn = sqlloads.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte2.arn and history.RunningIDForCompletedSubmission = cte2.maxRunningIDForCompletedSubmission		

	where 
	sqlloads.arn =@arn 
end