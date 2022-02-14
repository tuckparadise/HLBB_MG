CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejectedList]
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
	),
	PaymentSummary as 
	(
		select arn, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
		group by arn 
	),
	RentasCount as 
	(
		select arn, count(*) as 'RentasCount' 
		from aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
		where paymentmode = 'RENTAS'
		group by arn 
	)
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		case when rejected.arn is not null then 'Rejected' else rejected.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, rejected.UpdatedDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		rejected.SolicitorSubmissionDate as SubmissionDate ,
		--rejected.DisbursementCheckerEmailAddress as LastModifiedBy,
		InternalUserChecker.UserFullName as LastModifiedBy,
		--case when solsub.UpdatedDate is null then rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
		FORMAT (rejected.UpdatedDate, 'dd/MM/yyyy') as LastModifiedDate,		
		case when RentasCount.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (rejected.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		rejected.DisbursementMakerEmailAddress,
		--InternalUser.UserFullName as DisbursementMakerEmailAddress,
		PaymentSummary.TotalAmountDisbursed
	--from aaSolDisbursementSubmission_DisMakerSubmission solsub	
	from aaSolDisbursementSubmission_DisCheckerRejected rejected
		inner join aaSolDisbursementSubmission_DisMakerSubmission MakerSubmission on MakerSubmission.arn = rejected.arn 
	--	inner join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = rejected.arn 
		inner join sqlloads loads on loads.arn = rejected.arn 
		--left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = rejected.arn 
		--left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = rejected.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary on PaymentSummary.arn = rejected.arn 
		left join RentasCount on RentasCount.arn = rejected.arn 
		left join InternalUser InternalUserChecker on InternalUserChecker.UserName = rejected.DisbursementCheckerEmailAddress
	where MakerSubmission.DisbursementMakerSubmissionCompleted <> 1
	--where solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		--and solsub.SolicitorSubmissionCompleted=1
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end