--[aa_SolDisbursementSubmission_DisChecker_GetPublicList] ''

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetPublicList]
@DisCheckerEmail nvarchar(max) = null 
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
	)	,
	PaymentSummary as 
	(
		select arn, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		group by arn 
	),
	RentasCount as 
	(
		select arn, count(*) as 'RentasCount' 
		from [aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
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
		case when history.arn IS NOT NULL then 'Balance Advice' else '1st Advice'  end as 'Disbursement Stage',
		--case when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when (m_rejected.arn is not null and c_rejected.arn is null) then 'Rejected by RCO Maker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--20210405- fixed on the maker resubmission status 
		--20210412- fixed on the maker resubmission status rules 
		case when c_rejected.arn is not null then 'Resubmission' else 'Submitted' end as 'Status',		
		DATEDIFF(day, solsub.DisbursementMakerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,		
		case  when solsub.DisbursementCheckerEmailAddress is null then m_rejected.DisbursementCheckerEmailAddress else solsub.DisbursementCheckerEmailAddress end as LastModifiedBy,
		--case  when solsub.UpdatedDate is null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate,	
		case  when solsub.UpdatedDate is null then FORMAT ( m_rejected.UpdatedDate, 'dd/MM/yyyy') else FORMAT (solsub.UpdatedDate, 'dd/MM/yyyy') end as LastModifiedDate,		
		case when RentasCount.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (solsub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		--solsub.DisbursementMakerEmailAddress,
		InternalUser.UserFullName as DisbursementMakerEmailAddress,
		PaymentSummary.TotalAmountDisbursed,
		LOADS.DeveloperCode,
		LOADS.ProjectCode,		
		NULL as BillingDueDate
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 				
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary on PaymentSummary.arn = solsub.arn 
		left join RentasCount on RentasCount.arn = solsub.arn 
		left join InternalUser on InternalUser.UserName = solsub.DisbursementMakerEmailAddress
	where solsub.SolicitorSubmissionCompleted = 1
		and (solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		and solsub.DisbursementMakerDecision in ('All In Order','With Outstanding Item','Accept Cancellation') )
		and solsub.DisbursementMakerSubmissionCompleted = 1
		and isnull(solsub.DisbursementCheckerSubmissionCompleted,0) <> 1
		and solsub.arn not in (select arn from MortgageAppTaskInstance where workflow = 'DisbDUCheckerSolicitorApproval')			
end