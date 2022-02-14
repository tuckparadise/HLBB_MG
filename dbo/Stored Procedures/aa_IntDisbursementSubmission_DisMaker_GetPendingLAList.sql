CREATE       procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPendingLAList]
as
begin
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
		''  as 'Disbursement Stage',
		'Pending LA' as 'Status',		
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging'	,
		DATEDIFF(day, IntSub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		FORMAT (IntSub.SolicitorSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		null  as LastModifiedBy,
		null  as LastModifiedDate	,
		IntSub.BillingRunningID,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,		
		LOADS.PhaseCode,
		NULL as BillingAmount,
		NULL as BillingDueDate,
		null as BillingStage 
	from aaIntDisbursementSubmission IntSub 
		inner join sqlloads loads on loads.arn = IntSub.arn 	
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaDisbursementHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 	
		*/
		left join SolDisbursementHistory solsubhistory on solsubhistory.arn = IntSub.arn 
		left join aaIntDisbursementSubmissionPendingLA_DeleteWF deleteWF on deleteWF.arn = IntSub.arn and deleteWF.BillingRunningID = IntSub.BillingRunningID
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = loads.DeveloperCode
	where 		
		--LOADS.[ARN] not in (select arn from aaIntDisbursementSubmission a where a.DisbursementMakerSubmissionCompleted =1 )								
		--and 
		loads.DisbursementManner = 'PR'
		and solsubhistory.arn is null 	
		and deleteWF.arn is null 
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
		'Pending LA' as 'Status',				
		DATEDIFF(day, DevSub.ProjectSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		FORMAT (DevSub.ProjectSubmissionDate, 'dd/MM/yyyy') as SubmissionDate ,
		null  as LastModifiedBy,
		null  as LastModifiedDate	,
		DevSub.BillingRunningID,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,
		LOADS.PhaseCode,
		DevSub.PR_TotalBillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as BillingDueDate,
		FORMAT (DevSub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') as BillingDueDate ,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage9 = 1 then '9' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_StageOthers] = '' then null else DevSub.[PR_StageOthers] end),     '') 
		--COALESCE(', ' +  RTRIM( DevSub.[PR_StageOthers] ),     '') 
		, 1, 2, '') as BillingStage 
	from ddProjectDisbursementSubmission_DisMaker DevSub 
		inner join sqlloads loads on loads.arn = DevSub.arn 	
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'		
		left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
		left join ddProjectDisbursementSubmission_DeleteWF deleteWF on deleteWF.arn = DevSub.arn and deleteWF.BillingRunningID = DevSub.BillingRunningID
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = loads.DeveloperCode
	where 		
		--LOADS.[ARN] not in (select arn from aaIntDisbursementSubmission a where a.DisbursementMakerSubmissionCompleted =1 )								
		--and 
		loads.DisbursementManner = 'PR'
		and solsubhistory.arn is null 	
		and deleteWF.arn is null 
end