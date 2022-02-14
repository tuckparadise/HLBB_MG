/*
aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList
aa_IntDisbursementSubmission_RCOMaker_GetPublicList

aa_SolDisbursementSubmission_RCOMaker_GetPublicList
aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList
*/

CREATE     procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPublicList]
as
begin
	with cte1 (arn, firstRunningIDForCompletedSubmission) as
	(
	select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
	from aaSolDisbursementSubmission_RCOMakerSubmission_History
	group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag
		from cte1
			inner join aaSolDisbursementSubmission_RCOMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	)	,
	RentasCount as 
	(
		select arn, count(*) as 'RentasCount' 
		from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		where paymentmode = 'RENTAS'
		group by arn 
	),
	PaymentSummaryNumberOfPayments as 
	(
		select arn, count(*) as 'NummberOfPayments'
		from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		group by arn 
	),
	PaymentSummaryTotalAmountDisbursed as 
	(
		select arn, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
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
		--case when rejected.arn is not null then 'Rejected by Disbursement Checker' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by RCO Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',
		DATEDIFF(day, solsub.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when vrapproved.arn is null then 'No' else 'Yes' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,		
		case  when solsub.RCOMakerEmailAddress is null then m_rejected.RCOMakerEmailAddress else solsub.RCOMakerEmailAddress end as LastModifiedBy,
		--case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
		case  when solsub.UpdatedDate is null then FORMAT ( m_rejected.UpdatedDate, 'dd/MM/yyyy') else FORMAT (solsub.UpdatedDate, 'dd/MM/yyyy') end as LastModifiedDate,		
		case when RentasCount.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (solsub.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy') as DisbursementCheckerSubmissionDate,
		--solsub.DisbursementCheckerEmailAddress,
		InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress,
		PaymentSummaryTotalAmountDisbursed.TotalAmountDisbursed,
		PaymentSummaryNumberOfPayments.NummberOfPayments,
		LOADS.DeveloperCode,
		LOADS.ProjectCode,		
		NULL as BillingDueDate
	from aaSolDisbursementSubmission_RCOMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummaryNumberOfPayments on PaymentSummaryNumberOfPayments.arn = solsub.arn 
		left join RentasCount on RentasCount.arn = solsub.arn 
		left join PaymentSummaryTotalAmountDisbursed on PaymentSummaryTotalAmountDisbursed.arn = solsub.arn 
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = solsub.DisbursementCheckerEmailAddress

	where 
		--solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.SolicitorSubmissionCompleted=1
		and solsub.DisbursementMakerSubmissionCompleted=1
		and solsub.DisbursementCheckerSubmissionCompleted=1
		and solsub.DisbursementCheckerDecision in ('Approve')
		--and solsub.arn not in (select arn from K2Instance where workflow = 'RCOMakerDisbursementApproval')
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbRCOMakerSolicitorApproval')
		and isnull(solsub.RCOMakerSubmissionCompleted,0) <> 1
		--dumaker.[Status] = 'Completed'
		--and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission where SolicitorSubmissionStatus in ('Submitted','Resubmitted','Cancelled') )		
end