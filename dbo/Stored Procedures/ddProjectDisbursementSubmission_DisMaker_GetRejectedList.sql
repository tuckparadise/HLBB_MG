CREATE             procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRejectedList]
as
begin
	/*
	with cte1 (arn, firstRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag
		from cte1
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	)
	*/
	select 
		'Developer' as UploadedFrom ,
		LOADS.[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		LOADS.[ApplicantName] as 'Primary Customer Name',
		LOADS.[CollateralPurpose] as 'Purpose',
		LOADS.[TotalFinancingAmount] as 'Total Financing Amount',		
		LOADS.[DisbursementManner] as 'Disbursement Manner', 		
		''  as 'Disbursement Stage',
		--case when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' when checker_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',		
		'Rejected by Disbursement Maker' as 'Status',	
		DATEDIFF(day, DevSub.ProjectSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		FORMAT (DevSub.ProjectSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		--DevSub.DisbursementMakerEmailAddress  as DisbursementMakerEmailAddress,
		InternalUserMaker.UserFullName as DisbursementMakerEmailAddress,
		FORMAT (DevSub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy')  as DisbursementMakerSubmissionDate	,
		DevSub.BillingRunningID,
		LOADS.DeveloperCode,
		LOADS.DeveloperName,		
		LOADS.ProjectCode,
		LOADS.ProjectName,
		LOADS.PhaseCode,
		LOADS.PhaseName,
		projsub_draft.BillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as DevBillingDueDate,
		FORMAT (projsub.PR_EarliestBillingDueDate, 'dd/MM/yyyy')  as DevBillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage9 = 1 then '9' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_StageOthers] = '' then null else projsub.[PR_StageOthers] end),     '') 
		, 1, 2, '') as BilingStage ,
		case isnull(projsub.FinalBillingFlag,0) when 0 then 'No' else 'Yes' end as FinalBilling,		
		case when checker_rejected.arn is not null then FORMAT (checker_rejected.PR_EarliestBillingDueDate, 'dd/MM/yyyy') else FORMAT (projsub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') end as [BillingDueDate]
	from ddProjectDisbursementSubmission_DisMaker DevSub 
		inner join sqlloads loads on loads.arn = DevSub.arn 				
		left join ddProjectDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = DevSub.arn and checker_rejected.BillingRunningID = DevSub.BillingRunningID		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'		
		--left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
		left join ddProject_MortgageAppTaskInstance instance on instance.arn = DevSub.arn and instance.billingrunningid = DevSub.billingrunningid and workflow = 'DisbDUMakerBillingApproval'		
		left join ddProjectDisbursementSubmission_DeleteWF DeleteWF on DeleteWF.arn = DevSub.arn and DeleteWF.BillingRunningID = DevSub.billingrunningid
		left join ddProjectDisbursementSubmission_draft_master_History projsub on DevSub.DraftID = projsub.DraftID
		left join ddProjectDisbursementSubmission_draft_History projsub_draft on DevSub.DraftID = projsub_draft.DraftID and projsub_draft.arn = DevSub.arn
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = DevSub.DeveloperCode
		inner join ddProjectDisbursementSubmission_DisMaker_Rejected maker_rejected on maker_rejected.arn = DevSub.arn and DevSub.BillingRunningID = maker_rejected.BillingRunningID
		left join InternalUser InternalUserMaker on InternalUserMaker.UserName = DevSub.DisbursementMakerEmailAddress
	--where 			
	--	isnull(DevSub.DisbursementMakerSubmissionCompleted,0) <> 1	
	--	and loads.DisbursementManner = 'PR'		
	--	and instance.arn is null 
		--and solsubhistory.arn is not null 
	--	and DeleteWF.arn is null 
	--	and maker_rejected.arn is null 
	--20210817 - dev portal enhancement 
	union
	select 
		'Developer' as UploadedFrom ,
		LOADS.[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		LOADS.[ApplicantName] as 'Primary Customer Name',
		LOADS.[CollateralPurpose] as 'Purpose',
		LOADS.[TotalFinancingAmount] as 'Total Financing Amount',		
		LOADS.[DisbursementManner] as 'Disbursement Manner', 		
		''  as 'Disbursement Stage',
		--case when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' when checker_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',		
		'Rejected by Disbursement Maker' as 'Status',	
		DATEDIFF(day, DevSub.ProjectSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		FORMAT (DevSub.ProjectSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		--DevSub.DisbursementMakerEmailAddress  as DisbursementMakerEmailAddress,
		InternalUserMaker.UserFullName as DisbursementMakerEmailAddress,
		FORMAT (DevSub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy')  as DisbursementMakerSubmissionDate	,
		DevSub.BillingRunningID,
		--LOADS.DeveloperCode,
		LOADS.DeveloperCode,
		LOADS.DeveloperName,		
		LOADS.ProjectCode,
		LOADS.ProjectName,
		LOADS.PhaseCode,
		LOADS.PhaseName,
		projsub_draft.BillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as DevBillingDueDate,
		FORMAT (projsub.PR_EarliestBillingDueDate, 'dd/MM/yyyy')  as DevBillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.PR_Stage9 = 1 then '9' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when projsub.[PR_StageOthers] = '' then null else projsub.[PR_StageOthers] end),     '') 
		, 1, 2, '') as BilingStage ,
		case isnull(projsub.FinalBillingFlag,0) when 0 then 'No' else 'Yes' end as FinalBilling,		
		case when checker_rejected.arn is not null then FORMAT (checker_rejected.PR_EarliestBillingDueDate, 'dd/MM/yyyy') else FORMAT (projsub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') end as [BillingDueDate]
	from ddProjectDisbursementSubmission_DisMaker DevSub 
		inner join sqlloads loads on loads.arn = DevSub.arn 				
		left join ddProjectDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = DevSub.arn and checker_rejected.BillingRunningID = DevSub.BillingRunningID		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'		
		--left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
		left join ddProject_MortgageAppTaskInstance instance on instance.arn = DevSub.arn and instance.billingrunningid = DevSub.billingrunningid and workflow = 'DisbDUMakerBillingApproval'		
		left join ddProjectDisbursementSubmission_DeleteWF DeleteWF on DeleteWF.arn = DevSub.arn and DeleteWF.BillingRunningID = DevSub.billingrunningid
		left join ddProjectDisbursementSubmission_draft_master_History projsub on DevSub.DraftID = projsub.DraftID
		left join ddProjectDisbursementSubmission_draft_History projsub_draft on DevSub.DraftID = projsub_draft.DraftID and projsub_draft.arn = DevSub.arn
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = DevSub.DeveloperCode
		inner join ddProjectDisbursementSubmission_DisMaker_Rejected_staging maker_rejected on maker_rejected.arn = DevSub.arn and DevSub.BillingRunningID = maker_rejected.BillingRunningID
		left join InternalUser InternalUserMaker on InternalUserMaker.UserName = DevSub.DisbursementMakerEmailAddress
end