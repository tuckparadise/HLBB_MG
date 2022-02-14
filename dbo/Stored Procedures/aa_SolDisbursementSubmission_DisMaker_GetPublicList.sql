CREATE     procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPublicList]
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
	/*
	-- required valuation and VR received
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by Disbursement Checker' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,		
		case  when solsub.DisbursementMakerEmailAddress is null then m_rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate		
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		left join cte2 history on history.arn = solsub.arn 
			--and history.RunningIDForCompletedSubmission = 1		
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
		--inner join MortgageAppTaskInstance ins on ins.arn = solsub.arn and workflow = 'DisbDUMakerSolicitorApproval'
	where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbDUMakerSolicitorApproval')
		--and solsub.arn not in (select arn from WorkflowHistory where workflow = 'DisbDUMakerSolicitorApproval')
		and isnull(solsub.DisbursementMakerSubmissionCompleted,0) <> 1
		and loads.ValuationRequired =1 
		and vrapproved.arn is not null
	union 
	*/
	-- not required valuation  
	-- 20210125. allow case to appear for regardless of valuation status 

	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by Disbursement Checker' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		--solsub.SolicitorSubmissionDate as SubmissionDate ,
		FORMAT (solsub.SolicitorSubmissionDate, 'dd/MM/yyyy') as SubmissionDate,
		case  when solsub.DisbursementMakerEmailAddress is null then m_rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	,
		loads.SolicitorCode
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbDUMakerSolicitorApproval')
		--and solsub.arn not in (select arn from WorkflowHistory where workflow = 'DisbDUMakerSolicitorApproval')
		and isnull(solsub.DisbursementMakerSubmissionCompleted,0) <> 1
		--and loads.ValuationRequired <> 1 		
	union 
	-- cancelled 
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by Disbursement Checker' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.SolicitorSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		--solsub.SolicitorSubmissionDate as SubmissionDate ,
		FORMAT (solsub.SolicitorSubmissionDate, 'dd/MM/yyyy') as SubmissionDate,
		case  when solsub.DisbursementMakerEmailAddress is null then m_rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	,
		loads.SolicitorCode
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where solsub.SolicitorSubmissionOption in ('Cancelled')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbDUMakerSolicitorApproval')
		--and solsub.arn not in (select arn from WorkflowHistory where workflow = 'DisbDUMakerSolicitorApproval')
		and isnull(solsub.DisbursementMakerSubmissionCompleted,0) <> 1
		--and loads.ValuationRequired <> 1 		
end