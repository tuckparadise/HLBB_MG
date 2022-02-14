CREATE       procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList] 
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
	from aaSolDisbursementSubmission_RCOMakerSubmission_History
	group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag
		from cte1
			inner join aaSolDisbursementSubmission_RCOMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	),
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
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',	
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by RCO Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		solsub.SolicitorSubmissionDate as SubmissionDate ,
		case solsub.RCOMakerEmailAddress when null then m_rejected.RCOMakerEmailAddress else solsub.RCOMakerEmailAddress end as LastModifiedBy,
		--case solsub.UpdatedDate when null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	
		--worklist.SerialNumber
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
		--inner join aaSolDisbursementSubmission_RCOMaker_AssignedList worklist on worklist.arn = solsub.arn 
		inner join MortgageAppTaskInstance worklist on worklist.arn = solsub.arn and workflow = 'DisbRCOMakerSolicitorApproval'
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_RCOMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummaryNumberOfPayments on PaymentSummaryNumberOfPayments.arn = solsub.arn 
		left join RentasCount on RentasCount.arn = solsub.arn 
		left join PaymentSummaryTotalAmountDisbursed on PaymentSummaryTotalAmountDisbursed.arn = solsub.arn 		
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = solsub.DisbursementCheckerEmailAddress
	where  solsub.SolicitorSubmissionCompleted = 1
		--and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted')
		and solsub.DisbursementMakerSubmissionCompleted  = 1
		and solsub.DisbursementCheckerSubmissionCompleted  = 1
		and solsub.DisbursementCheckerDecision in ('Approve')				
		and isnull(solsub.RCOMakerSubmissionCompleted,0) <> 1
		--and worklist.TaskOwner = @AllocatedUser
		--and worklist.allocateduser = @AllocatedUser
		and worklist.TaskOwner = case when @AllocatedUser like 'K2:%' then Stuff(@AllocatedUser, 1, 3, '')	else @AllocatedUser end 
	
end