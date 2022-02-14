--[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList] 'workgroup\jasonangot'

CREATE       procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList] 
@AllocatedUser nvarchar(max)
as
begin
	/*
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')			
	end 
	*/
	with SolDisbursementHistory (arn, firstRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		group by arn 
	)
	select 
		'EDMS' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		''  as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when c_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',	
		--case when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' when checker_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',		
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		DATEDIFF(day, IntSub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',			
		FORMAT (IntSub.SolicitorSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		IntSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		FORMAT (IntSub.UpdatedDate, 'dd/MM/yyyy')  as LastModifiedDate	,
		IntSub.BillingRunningID,		
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,
		LOADS.PhaseCode,
		NULL as BillingAmount,
		NULL as DevBillingDueDate,
		null as BilingStage,
		null as FinalBilling,		
		null as [BillingDueDate]		
	from aaIntDisbursementSubmission IntSub 	
		inner join sqlloads loads on loads.arn = IntSub.arn 
		inner join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbDUMakerBillingApproval'
		--inner join aaIntDisbursementSubmission_DisMaker_AssignedList worklist on worklist.arn = IntSub.arn 
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 	
		*/
		left join SolDisbursementHistory solsubhistory on solsubhistory.arn = IntSub.arn 
		left join aaIntDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = IntSub.arn and c_rejected.BillingRunningID = IntSub.BillingRunningID
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = IntSub.DeveloperCode
	where  instance.taskowner = case when @AllocatedUser like 'K2:%' then Stuff(@AllocatedUser, 1, 3, '') else @AllocatedUser end 	
		and solsubhistory.arn is not null 
	--20210817 - dev portal enhancement 
	union 
	select 
		'Developer' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 				
		''  as 'Disbursement Stage',		
		--case when c_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',			 	
		-- 20220124- fixed the issue on missing rejected by checker status 
		--case when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' when c_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by Disbursement Checker' when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' else 'New' end as 'Status',		
		case	when c_rejected.arn is not null then case when c_rejected.DisbursementMakerSubmissionDate < DevSub.ProjectSubmissionDate then 'Resubmission' else 'Rejected by Disbursement Checker' end 
				when DevSub.projectsubmissionoption = 'Resubmission' then 'Resubmission' 
				else 'New' 
		end as 'Status',	
		DATEDIFF(day, DevSub.ProjectSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',			
		FORMAT (DevSub.ProjectSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		DevSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		FORMAT (DevSub.UpdatedDate, 'dd/MM/yyyy')  as LastModifiedDate	,
		DevSub.BillingRunningID,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,
		LOADS.PhaseCode,
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
		case when c_rejected.arn is not null then FORMAT (c_rejected.PR_EarliestBillingDueDate, 'dd/MM/yyyy') else FORMAT (projsub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') end as [BillingDueDate]
	from ddProjectDisbursementSubmission_DisMaker DevSub 	
		inner join sqlloads loads on loads.arn = DevSub.arn 
		inner join ddProject_MortgageAppTaskInstance instance on instance.arn = DevSub.arn and instance.billingrunningid = DevSub.billingrunningid and workflow = 'DisbDUMakerBillingApproval'		
		left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
		left join ddProjectDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = DevSub.arn and c_rejected.BillingRunningID = DevSub.BillingRunningID		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'
		left join ddProjectDisbursementSubmission_draft_master_History projsub on DevSub.DraftID = projsub.DraftID
		left join ddProjectDisbursementSubmission_draft_History projsub_draft on DevSub.DraftID = projsub_draft.DraftID and projsub_draft.arn = DevSub.arn
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = DevSub.DeveloperCode
		left join ddProjectDisbursementSubmission_DisMaker_Rejected maker_rejected on maker_rejected.arn = DevSub.arn and DevSub.BillingRunningID = maker_rejected.BillingRunningID
		left join ddProjectDisbursementSubmission_DisMaker_Rejected_staging maker_rejected_staging on maker_rejected_staging.arn = DevSub.arn and DevSub.BillingRunningID = maker_rejected_staging.BillingRunningID
	where  instance.taskowner = case when @AllocatedUser like 'K2:%' then Stuff(@AllocatedUser, 1, 3, '') else @AllocatedUser end 	
		and solsubhistory.arn is not null 
		and maker_rejected.arn is null 
		and maker_rejected_staging.arn is null 
	--20210817 - dev portal enhancement 
end