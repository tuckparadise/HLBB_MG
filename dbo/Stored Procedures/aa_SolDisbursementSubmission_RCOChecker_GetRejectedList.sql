CREATE               procedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_GetRejectedList]
as
begin
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
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		case when rejected.arn is not null then 'Rejected' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,
		case when solsub.RCOCheckerEmailAddress is null then rejected.RCOCheckerEmailAddress else solsub.RCOCheckerEmailAddress end as LastModifiedBy,
		case when solsub.UpdatedDate is null then rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join aaSolDisbursementSubmission_RCOcheckerRejected rejected on rejected.arn = solsub.arn 
		inner join sqlloads loads on loads.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	--where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		--and solsub.SolicitorSubmissionCompleted=1
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end