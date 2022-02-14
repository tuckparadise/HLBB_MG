--[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID] 13, 'TAI/RB/2019/Z0002026'

 
CREATE         procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetDeveloperInput_ByBillingID]
@BillingID bigint = null ,
@arn nvarchar(max) = null 
as
begin
	/*
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
	*/
	SELECT 
		devsub_draft.[arn] 
		--case devsub.[SolicitorSubmissionOption] when 'Resubmitted' then 'Submitted' else isnull(devsub.[SolicitorSubmissionOption],'Submitted') end as 'SolicitorSubmissionOption',
		,null as 'SolicitorSubmissionOption'
		--case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',		
		,null as 'Disbursement Stage',		
		--case when devsub.[UrgentFlag] is null then case when DATEDIFF(day, doc.DeveloperBillingDueDate, getdate()) > 10 then CAST(1 as bit) else CAST(0 as bit) end else devsub.[UrgentFlag] end as [UrgentFlag], 						
		null as [UrgentFlag], 						
		--case when history.arn IS NOT NULL then cast(0 as bit) else devsub.[BalanceAdviceLetterApplicableFlag] end as 'BalanceAdviceLetterApplicableFlag',      
		null as 'BalanceAdviceLetterApplicableFlag',      
		dismaker.[LS_RedemptionDueDateFlag]
		,dismaker.[LS_RedemptionDueDate]
		,dismaker.[LS_ExtendedCompletionDateFlag]		
		,dismaker.[LS_CompletionDate]
		,dismaker.[LS_ExtendedCompletionDate]
		--,isnull(devsub.[PR_DeveloperBillingDueDateFlag],cast(1 as bit)) as 'PR_DeveloperBillingDueDateFlag'
		,null as 'PR_DeveloperBillingDueDateFlag'
		,devsub_master.[PR_Stage2AFlag]
		,devsub_master.[PR_Stage2BFlag]
		,devsub_master.[PR_Stage2CFlag]
		,devsub_master.[PR_Stage2DFlag]
		,devsub_master.[PR_Stage2EFlag]
		,devsub_master.[PR_Stage2FFlag]
		,devsub_master.[PR_Stage2GFlag]
		,devsub_master.[PR_Stage2HFlag]
		,devsub_master.[PR_StageOthers]		
		,devsub_master.PR_EarliestBillingDueDate		
		,cast(devsub_draft.BillingAmount as varchar) as PR_TotalBillingAmount
		,dismaker.PR_AnyBridgingFinancierFlag
		,dismaker.PR_BridgingFinancier
		,dismaker.PR_BridgingFinancierEmailAddress
		,cast(dismaker.PR_BridgingFinancierRedemptionSum as varchar) as PR_BridgingFinancierRedemptionSum
		,dismaker.PR_RedemptionPaymentAccountNumber
		,dismaker.PR_BeneficiaryBank
		,dismaker.PR_BridgingFinancierRedemptionExpiryDate
		,dismaker.PR_DeveloperName
		,dismaker.PR_DeveloperEmailAddress
		,dismaker.PR_DeveloperPIC
		,dismaker.PR_DeveloperHDA
		,dismaker.PR_DeveloperHDABank
		--,case when devsub.[LF_PayeeName] is not null then devsub.[LF_PayeeName] else sqlloads.SolicitorName end as 'LF_PayeeName'		
		,null as 'LF_PayeeName'
		--,case when devsub.LF_BilledAmount is not null then cast(devsub.LF_BilledAmount as varchar) else cast(sqlloads.LegalFeesFinancedAmount as varchar) end as 'LF_BilledAmount'						
		,null as 'LF_BilledAmount'
		,dismaker.[LF_AccountNumber]
		,dismaker.[LF_Bank]
		,dismaker.[LF_PaymentDescription]
		,isnull(dismaker.[LF_PaymentMode],'IBG') as 'LF_PaymentMode'
		,isnull(dismaker.[UpdateInfo_Reason],'Others') as 'UpdateInfo_Reason'
		,dismaker.[UpdateInfo_Others]
		,dismaker.[CancelLoan_Remarks]
		,dismaker.[CancelLoan_File]     
		,dismaker.[SolicitorSubmissionCompleted]
		,dismaker.[SolicitorCode]
		,dismaker.[SolicitorSubmissionDate]     		
      ,dismaker.[CreatedDate]
      ,dismaker.[UpdatedDate]	  	 
	  --,case when history.arn IS NOT NULL and sqlloads.disbursementmanner = 'LS' then cast(1 as bit) else cast(0 as bit) end as 'ForceBalanceAdviceLetterApplicableFlagIndicator'      
	  ,null as 'ForceBalanceAdviceLetterApplicableFlagIndicator'      
	  , dismaker.ProjectSubmissionOption
	  ,dismaker.DeveloperCode
	  ,dismaker.ProjectCode
	  ,dismaker.PhaseCode
	  ,dismaker.DeveloperLoginID
	  ,dismaker.ProjectSubmissionDate
	  ,devsub_master.PR_Stage2IFlag
	  ,devsub_master.PR_Stage2JFlag
	  ,devsub_master.PR_Stage2KFlag
	  ,devsub_master.PR_Stage3
	  ,devsub_master.PR_Stage4
	  ,devsub_master.PR_Stage5
	  ,devsub_master.PR_Stage6
	  ,devsub_master.PR_Stage7
	  ,devsub_master.PR_Stage8
	  ,devsub_master.PR_Stage9
	  ,devsub_master.FinalBillingFlag
	FROM ddProjectDisbursementSubmission_DisMaker dismaker 
		--ddProjectDisbursementSubmission_draft_History devsub_draft
		left join [dbo].ddProjectDisbursementSubmission_draft_Master_History devsub_master on devsub_master.draftid = dismaker.draftid 
		left join [dbo].ddProjectDisbursementSubmission_draft_History devsub_draft on devsub_draft.draftid = dismaker.draftid 
		
		left join ddProjectPhase phase on phase.PhaseCode = devsub_master.phasecode and phase.DeveloperCode = devsub_master.developercode and phase.projectcode = devsub_master.projectcode 
		--left join SQLSolicitorDPSubmission doc on doc.arn = devsub.arn 
		--left join cte2 on cte2.arn = sqlloads.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte2.arn and history.RunningIDForCompletedSubmission = cte2.maxRunningIDForCompletedSubmission		

	where 
	dismaker.BillingRunningID =@BillingID
	and devsub_draft.ARN = @arn 
end