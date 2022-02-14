CREATE       procedure [dbo].[aa_SolDisbursementSubmission_GetList_BalanceAdvice]
@solcode nvarchar(100) = null 
as
begin
	with cte1 (arn, firstRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag, DisbursementCheckerSubmissionDate) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag, h.DisbursementCheckerSubmissionDate
		from cte1
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	)	
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		case when rejected.arn is not null then 'Rejected' when updateinfo.arn is not null then 'UpdateInfo' else 'New' end as 'Status',		
		DATEDIFF(day, cte2.DisbursementCheckerSubmissionDate, getdate()) as 'Aging'	,
		--doc.UpdatedDate as 'Documentation Executed Date',
		FORMAT (cte2.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy') as 'First Payment Date'
	from SQLDUMakerDP_SolicitorSubmission dumaker 
		inner join sqlloads loads on loads.arn = dumaker.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = dumaker.arn and history.RunningIDForCompletedSubmission = 1
		left join cte2 on cte2.arn = dumaker.arn 
		left join aaSolDisbursementSubmission solsub on solsub.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 		
		left join aaSolDisbursementSubmission_updateinfo updateinfo on updateinfo.arn = dumaker.arn 
		left join aaSolDisbursementSubmission_staging staging on staging.arn = dumaker.arn 
		left join SQLDUMakerDP_SolicitorSubmission doc on doc.arn = dumaker.arn 
	where 
		dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
		and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.SolicitorSubmissioncompleted =1 )				
		and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerSubmission_History where arn = dumaker.[ARN] and isnull(BalanceAdviceLetterApplicableFlag,0) = 0)
		and staging.arn is null 
		and loads.SolicitorCode = @solcode 	
		and cte2.arn is not null 
		and rejected.arn is null 
end