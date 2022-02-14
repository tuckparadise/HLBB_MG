/*
[ddProjectDisbursementSubmission_GetList] '1111','111','111'

go

select distinct developercode,projectcode , phasecode 
from sqlloads

go
*/




CREATE           procedure [dbo].[ddProjectDisbursementSubmission_GetList]
@DevCode nvarchar(100) = null , 
@ProjectCode nvarchar(100) = null , 
@PhaseCode nvarchar(100) = null 
as
begin
	
	
	with 
	/*
	history_earliest (arn, firstRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
		from ddProjectDisbursementSubmission_DisMakerHistory
		group by arn 
	),
	*/
	cancelled (arn) as
	(
		select distinct arn 
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		where solicitorsubmissionoption = 'Cancelled' 
		and DisbursementCheckerDecision = 'Approve' 
			and DisbursementCheckersubmissionCompleted = 1
	)
	,
	lastSubmissionInfo (arn, SubmissionDate, DeveloperLoginID, BillingStage,PR_StageOthers) as
	(
		
		select history.arn, FORMAT (submitteddate, 'dd/MM/yyyy') as SubmissionDate, DeveloperLoginID, 			
			 stuff(		
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage3 = 1 then '3' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage4 = 1 then '4' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage5 = 1 then '5' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage6 = 1 then '6' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage7 = 1 then '7' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage8 = 1 then '8' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when history.PR_Stage9 = 1 then '9' else null end),     '') 				
				--COALESCE(', ' +  RTRIM( history.[PR_StageOthers] ),     '') 
				, 1, 2, '') 				
				as BillingStage ,
				history.[PR_StageOthers]
		from ddProjectDisbursementSubmission_SubmissionHistory2 history
		inner join 
		(select arn,max(SurrogateRunningID) as LastSurrogateRunningID 
		from ddProjectDisbursementSubmission_SubmissionHistory2
		group by arn) LastSubmissionID on LastSubmissionID.arn = history.arn and LastSubmissionID.LastSurrogateRunningID = history.SurrogateRunningID

	),
	history_finalBillingCheck (arn, FinalBilling) as 
	(
		select arn, max(cast(isnull(FinalBillingFlag,0) as tinyint)) as FinalBillingFlag
		from vw_aaDisbursementHistory
		group by arn 		
	),
	/*
	history_latest (arn, SubmissionFrom,LastRunningIDForCompletedSubmission) as
	(	
		select history.arn, history.SubmissionFrom, history.RunningIDForCompletedSubmission
		from vw_aaDisbursementHistory history
		inner join 
			(select arn, max(ROWID) as ViewRunningID
			from vw_aaDisbursementHistory
			group by arn ) tbl on tbl.ViewRunningID = history.ROWID
	),	
	history_latest_FinalBilling_Check (arn, SubmissionFrom, LastRunningIDForCompletedSubmission, FinalBillingFlag) as 
	(
		select history_latest.arn, history_latest.SubmissionFrom, history_latest.LastRunningIDForCompletedSubmission, h.FinalBillingFlag
		from history_latest
			inner join vw_aaDisbursementHistory h on h.arn = history_latest.arn and h.RunningIDForCompletedSubmission= history_latest.LastRunningIDForCompletedSubmission and h.SubmissionFrom = history_latest.SubmissionFrom
	),	
	*/
	history_completedStage (arn, PR_StageOthers,CompletedStage) as
	(		
		select tbl.arn, PR_StageOthers,CompletedStage = stuff(		
				COALESCE(', ' +  RTRIM( PR_Stage2AFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2BFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2CFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2DFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2EFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2FFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2GFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2HFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2IFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2JFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2KFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage3),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage4),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage5),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage6),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage7),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage8),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage9),     '') 	
				--COALESCE(', ' +  RTRIM( [PR_StageOthers] ),     '') 
				, 1, 2, '')				
		from 
		(
		select arn, 	
			case when max(cast(isnull(PR_Stage2AFlag,0) as tinyint))  = 1 then '2/2a' else null end as PR_Stage2AFlag,
			case when max(cast(isnull(PR_Stage2BFlag,0) as tinyint))  = 1 then '2b' else null end as PR_Stage2BFlag,
			case when max(cast(isnull(PR_Stage2CFlag,0) as tinyint))  = 1 then '2c' else null end as PR_Stage2CFlag,
			case when max(cast(isnull(PR_Stage2DFlag,0) as tinyint))  = 1 then '2d' else null end as PR_Stage2DFlag,
			case when max(cast(isnull(PR_Stage2EFlag,0) as tinyint))  = 1 then '2e' else null end as PR_Stage2EFlag,
			case when max(cast(isnull(PR_Stage2FFlag,0) as tinyint))  = 1 then '2f' else null end as PR_Stage2FFlag,
			case when max(cast(isnull(PR_Stage2GFlag,0) as tinyint))  = 1 then '2g' else null end as PR_Stage2GFlag,
			case when max(cast(isnull(PR_Stage2HFlag,0) as tinyint))  = 1 then '2h' else null end as PR_Stage2HFlag,	 
			case when max(cast(isnull(PR_Stage2IFlag,0) as tinyint))  = 1 then '2i' else null end as PR_Stage2IFlag,
			case when max(cast(isnull(PR_Stage2JFlag,0) as tinyint))  = 1 then '2j' else null end as PR_Stage2JFlag,
			case when max(cast(isnull(PR_Stage2KFlag,0) as tinyint))  = 1 then '2k' else null end as PR_Stage2KFlag,
			case when max(cast(isnull(PR_Stage3,0) as tinyint))  = 1 then '3' else null end as PR_Stage3,
			case when max(cast(isnull(PR_Stage4,0) as tinyint))  = 1 then '4' else null end as PR_Stage4,
			case when max(cast(isnull(PR_Stage5,0) as tinyint))  = 1 then '5' else null end as PR_Stage5,
			case when max(cast(isnull(PR_Stage6,0) as tinyint))  = 1 then '6' else null end as PR_Stage6,
			case when max(cast(isnull(PR_Stage7,0) as tinyint))  = 1 then '7' else null end as PR_Stage7,
			case when max(cast(isnull(PR_Stage8,0) as tinyint))  = 1 then '8' else null end as PR_Stage8,
			case when max(cast(isnull(PR_Stage9,0) as tinyint))  = 1 then '9' else null end as PR_Stage9			
		from vw_aaDisbursementHistory
		group by arn
		) tbl 
		left join (SELECT arn, PR_StageOthers = dbo.tfn_CoalesceConcat_PR_StageOthers(arn)
		  FROM vw_aaDisbursementHistory
		  GROUP BY arn) others on others.arn = tbl.arn 
		
	)	
	/*
	history_PendingStage (arn, PendingStage) as
	(		
		
	select arn, PendingStage = stuff(		
				COALESCE(', ' +  RTRIM( PR_Stage2AFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2BFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2CFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2DFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2EFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2FFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2GFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2HFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2IFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2JFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage2KFlag),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage3),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage4),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage5),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage6),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage7),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage8),     '') +
				COALESCE(', ' +  RTRIM( PR_Stage9),     '') 
				, 1, 2, '')
		from 
		(			
		select SQLLOADS.arn, 	
			case when max(cast(isnull(PR_Stage2AFlag,0) as tinyint))  = 0 then '2a' else null end as PR_Stage2AFlag,
			case when max(cast(isnull(PR_Stage2BFlag,0) as tinyint))  = 0 then '2b' else null end as PR_Stage2BFlag,
			case when max(cast(isnull(PR_Stage2CFlag,0) as tinyint))  = 0 then '2c' else null end as PR_Stage2CFlag,
			case when max(cast(isnull(PR_Stage2DFlag,0) as tinyint))  = 0 then '2d' else null end as PR_Stage2DFlag,
			case when max(cast(isnull(PR_Stage2EFlag,0) as tinyint))  = 0 then '2e' else null end as PR_Stage2EFlag,
			case when max(cast(isnull(PR_Stage2FFlag,0) as tinyint))  = 0 then '2f' else null end as PR_Stage2FFlag,
			case when max(cast(isnull(PR_Stage2GFlag,0) as tinyint))  = 0 then '2g' else null end as PR_Stage2GFlag,
			case when max(cast(isnull(PR_Stage2HFlag,0) as tinyint))  = 0 then '2h' else null end as PR_Stage2HFlag,	 
			case when max(cast(isnull(PR_Stage2IFlag,0) as tinyint))  = 1 then '2i' else null end as PR_Stage2IFlag,
			case when max(cast(isnull(PR_Stage2JFlag,0) as tinyint))  = 1 then '2j' else null end as PR_Stage2JFlag,
			case when max(cast(isnull(PR_Stage2KFlag,0) as tinyint))  = 1 then '2k' else null end as PR_Stage2KFlag,
			case when max(cast(isnull(PR_Stage3,0) as tinyint))  = 1 then '3' else null end as PR_Stage3,
			case when max(cast(isnull(PR_Stage4,0) as tinyint))  = 1 then '4' else null end as PR_Stage4,
			case when max(cast(isnull(PR_Stage5,0) as tinyint))  = 1 then '5' else null end as PR_Stage5,
			case when max(cast(isnull(PR_Stage6,0) as tinyint))  = 1 then '6' else null end as PR_Stage6,
			case when max(cast(isnull(PR_Stage7,0) as tinyint))  = 1 then '7' else null end as PR_Stage7,
			case when max(cast(isnull(PR_Stage8,0) as tinyint))  = 1 then '8' else null end as PR_Stage8,
			case when max(cast(isnull(PR_Stage9,0) as tinyint))  = 1 then '9' else null end as PR_Stage9
		from SQLLOADS
		inner join SQLDUMakerDP_SolicitorSubmission dumaker on SQLLOADS.arn = dumaker.arn 	
		left join vw_aaDisbursementHistory on SQLLOADS.arn = vw_aaDisbursementHistory.arn 
		where dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
		group by SQLLOADS.arn 
		) tbl 
		
	)
	*/
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		--[CollateralPurpose] as 'Purpose',
		--[TotalFinancingAmount] as 'Total Financing Amount',		
		loads.AddressLine1 as 'PropertyAddress',
		LoanAmount as 'Loan Amount',		
		--[DisbursementManner] as 'Disbursement Manner', 		
		--case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--'Billing'  as 'Disbursement Stage',
		--history_completedStage.CompletedStage + ',' + history_completedStage.PR_StageOthers as 'CompletedStage',
		case isnull(history_completedStage.PR_StageOthers,'') when '' then history_completedStage.CompletedStage else history_completedStage.CompletedStage + ',' + history_completedStage.PR_StageOthers end as CompletedStage,
		null as 'PendingStage',		
		--history_PendingStage.PendingStage as 'PendingStage',		
		--case when rejected.arn is not null then 'Rejected' else 'New' end as 'Status',
		'New' as 'Status',
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging'			
		loads.DeveloperCode,
		loads.ProjectCode,
		loads.PhaseCode,
		--case isnull(lastSubmissionInfo.[PR_StageOthers],'') when '' then lastSubmissionInfo.BillingStage else isnull(lastSubmissionInfo.BillingStage,'') + ',' + lastSubmissionInfo.[PR_StageOthers] end as BillingStage,
		case when isnull(lastSubmissionInfo.[PR_StageOthers],'')  <> '' and isnull(lastSubmissionInfo.BillingStage,'') <> '' then lastSubmissionInfo.BillingStage + ',' + lastSubmissionInfo.[PR_StageOthers]
			when isnull(lastSubmissionInfo.[PR_StageOthers],'')  = '' and isnull(lastSubmissionInfo.BillingStage,'') <> '' then lastSubmissionInfo.BillingStage 
			when isnull(lastSubmissionInfo.[PR_StageOthers],'')  <> '' and isnull(lastSubmissionInfo.BillingStage,'') = '' then lastSubmissionInfo.[PR_StageOthers]
		end as BillingStage,
		lastSubmissionInfo.DeveloperLoginID as LastSubmittedBy,
		lastSubmissionInfo.SubmissionDate as LastSubmissionDate 
	from SQLDUMakerDP_SolicitorSubmission dumaker 
		inner join sqlloads loads on loads.arn = dumaker.arn 		
		--left join history_latest_FinalBilling_Check on history_latest_FinalBilling_Check.arn = dumaker.arn  
		--left join ddProjectDisbursementSubmission ProjectSub on ProjectSub.arn = dumaker.arn 
		--left join ddProjectDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
		--left join aaSolDisbursementSubmission_updateinfo updateinfo on updateinfo.arn = dumaker.arn 
		--left join ddProjectDisbursementSubmission_staging staging on staging.arn = dumaker.arn 
		--left join aaSolCodeChangeLog ChangeSolLog on ChangeSolLog.arn = loads.arn and ChangeSolLog.FirstAdviceCompleted = 1
		left join history_completedStage on history_completedStage.arn = loads.arn 
		--left join history_PendingStage on history_PendingStage.arn = loads.arn 
		left join history_finalBillingCheck on history_finalBillingCheck.arn = loads.arn 		
		left join lastSubmissionInfo on lastSubmissionInfo.arn = loads.arn 
		left join cancelled on cancelled.arn = dumaker.arn 
	where 
		dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
		--and LOADS.[ARN] not in (select arn from ddProjectDisbursementSubmission a where a.ProjectSubmissionCompleted =1 )				
		--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerSubmission_History where arn = dumaker.[ARN] and isnull(BalanceAdviceLetterApplicableFlag,0) = 0)
		--and staging.arn is null 
		--and loads.projectcode = @ProjectCode 		
		and loads.developercode = @DevCode 	
		and loads.PhaseCode = @PhaseCode 	
		--and ChangeSolLog.arn is null 
		--and isnull(history_latest_FinalBilling_Check.FinalBillingFlag,0) = 0
		and isnull(history_finalBillingCheck.FinalBilling,0) = 0	
		and cancelled.arn is null 
		and loads.DisbursementManner = 'PR'
	order by AddressLine1 asc 
end