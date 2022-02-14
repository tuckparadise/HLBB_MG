CREATE     procedure [dbo].[tbd_aa_SolDisbursementSubmission_RCOMaker_GetNoBillingList]
as
begin
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by RCO Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received'
	from aaSolDisbursementSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		--left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = solsub.arn 		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.DisbursementMakerSubmissionCompleted=1
		and solsub.DisbursementCheckerSubmissionCompleted=1
		and solsub.arn not in (select arn from K2Instance where workflow = 'RCOMakerDisbursementApproval')
		and isnull(solsub.RCOMakerSubmissionCompleted,0) <> 1
		and loads.DisbursementManner = 'PR'
		and solsub.PR_DeveloperBillingDueDateFlag = 0
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end