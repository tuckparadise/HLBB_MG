CREATE     procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList] 
@AllocatedUser nvarchar(max)
as
begin
	/*
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')			
	end 
	*/

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
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',	
		--20210405- fixed on the maker resubmission status 
		--20210412- fixed on the maker resubmission status rules 
		--case when (m_rejected.arn is not null and rejected.arn is null) then 'Rejected by RCO Maker' when rejected.arn is not null then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		case when rejected.arn is not null then 'Resubmission' else 'Submitted' end as 'Status',
		DATEDIFF(day, solsub.DisbursementMakerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'No' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,
		case solsub.DisbursementMakerEmailAddress when null then rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		--case solsub.UpdatedDate when null then rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	,
		case  when solsub.UpdatedDate is null then FORMAT ( m_rejected.UpdatedDate, 'dd/MM/yyyy') else FORMAT (solsub.UpdatedDate, 'dd/MM/yyyy') end as LastModifiedDate,		
		case when RentasCount.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (solsub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		--solsub.DisbursementMakerEmailAddress,
		InternalUser.UserFullName as DisbursementMakerEmailAddress,
		PaymentSummary.TotalAmountDisbursed
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		--inner join aaSolDisbursementSubmission_DisChecker_AssignedList worklist on worklist.arn = solsub.arn 
		inner join MortgageAppTaskInstance worklist on worklist.arn = solsub.arn and workflow = 'DisbDUCheckerSolicitorApproval'
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary on PaymentSummary.arn = solsub.arn 
		left join RentasCount on RentasCount.arn = solsub.arn 
		left join InternalUser on InternalUser.UserName = solsub.DisbursementMakerEmailAddress
	where solsub.SolicitorSubmissionCompleted  = 1
		and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		and solsub.DisbursementMakerSubmissionCompleted  = 1
		and solsub.DisbursementMakerDecision in ('All In Order','With Outstanding Item','Accept Cancellation')
		and isnull(solsub.DisbursementCheckerSubmissionCompleted,0) <> 1
		--and worklist.TaskOwner = @AllocatedUser
		and worklist.TaskOwner = case when @AllocatedUser like 'K2:%' then Stuff(@AllocatedUser, 1, 3, '')	else @AllocatedUser end 
end