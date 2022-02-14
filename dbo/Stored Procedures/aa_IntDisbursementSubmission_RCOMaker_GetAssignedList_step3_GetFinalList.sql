CREATE           procedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetAssignedList_step3_GetFinalList] 
@AllocatedUser nvarchar(max)
as
begin
	
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')			
	end ;

	/*
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
	*/
	WITH PaymentSummaryTotalAmountDisbursed as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		group by arn , BillingRunningID
	),
	RentasCount as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	PaymentSummaryNumberOfPayments as 
	(
		select arn, BillingRunningID, count(*) as 'NummberOfPayments'
		from aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		group by arn ,BillingRunningID
	),
	 DevSub_PaymentSummaryTotalAmountDisbursed as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
		group by arn , BillingRunningID
	),
	DevSub_RentasCount as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	DevSub_PaymentSummaryNumberOfPayments as 
	(
		select arn, BillingRunningID, count(*) as 'NummberOfPayments'
		from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
		group by arn ,BillingRunningID
	)
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		'Billing'  as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',	
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',	
		--'New' as 'Status',	
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		DATEDIFF(day, IntSub.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		IntSub.SolicitorSubmissionDate as SubmissionDate ,
		IntSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		IntSub.UpdatedDate  as LastModifiedDate	,
		IntSub.BillingRunningID,
		case when RentasCount.arn is not null then 'Yes' else 'No' end as WithRentasPayment,		
		FORMAT (IntSub.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy') as DisbursementCheckerSubmissionDate,
		--IntSub.DisbursementCheckerEmailAddress,
		InternalUser.UserFullName as DisbursementCheckerEmailAddress,
		PaymentSummaryTotalAmountDisbursed.TotalAmountDisbursed,
		PaymentSummaryNumberOfPayments.NummberOfPayments,
		LOADS.DeveloperCode,
		LOADS.ProjectCode,		
		NULL as BillingDueDate,
		'EDMS' as UploadedFrom,
		loads.PhaseCode
	from aaIntDisbursementSubmission_RCOMakerSubmission IntSub 	
		inner join sqlloads loads on loads.arn = IntSub.arn 
		--inner join aaIntDisbursementSubmission_RCOMaker_AssignedList worklist on worklist.arn = IntSub.arn 
		left join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOMakerBillingApproval'
		--left join aaIntDisbursementSubmission_History history on history.arn = IntSub.arn and history.RunningIDForCompletedSubmission = 1		
		left join aaIntDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = IntSub.arn 
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummaryTotalAmountDisbursed on PaymentSummaryTotalAmountDisbursed.arn = IntSub.arn and IntSub.BillingRunningID = PaymentSummaryTotalAmountDisbursed.BillingRunningID
		left join RentasCount on RentasCount.arn = IntSub.arn and IntSub.BillingRunningID = RentasCount.BillingRunningID
		left join PaymentSummaryNumberOfPayments on PaymentSummaryNumberOfPayments.arn = IntSub.arn and PaymentSummaryNumberOfPayments.BillingRunningID= IntSub.BillingRunningID
		left join InternalUser on InternalUser.UserName = IntSub.DisbursementCheckerEmailAddress
	where  instance.taskowner = @AllocatedUser
	union
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		'Billing'  as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',	
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',	
		--'New' as 'Status',	
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Ageing', 	
		DATEDIFF(day, IntSub.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		IntSub.SolicitorSubmissionDate as SubmissionDate ,
		IntSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		IntSub.UpdatedDate  as LastModifiedDate	,
		IntSub.BillingRunningID,
		case when DevSub_RentasCount.arn is not null then 'Yes' else 'No' end as WithRentasPayment,		
		FORMAT (IntSub.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy') as DisbursementCheckerSubmissionDate,
		--IntSub.DisbursementCheckerEmailAddress,
		InternalUser.UserFullName as DisbursementCheckerEmailAddress,
		DevSub_PaymentSummaryTotalAmountDisbursed.TotalAmountDisbursed,
		DevSub_PaymentSummaryNumberOfPayments.NummberOfPayments,
		LOADS.DeveloperCode,
		LOADS.ProjectCode,		
		NULL as BillingDueDate,
		'Developer' as UploadedFrom,
		loads.PhaseCode
	from ddProjectDisbursementSubmission_RCOMaker IntSub 	
		inner join sqlloads loads on loads.arn = IntSub.arn 
		--inner join aaIntDisbursementSubmission_RCOMaker_AssignedList worklist on worklist.arn = IntSub.arn 
		left join ddProject_MortgageAppTaskInstance instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOMakerBillingApproval'
		--left join aaIntDisbursementSubmission_History history on history.arn = IntSub.arn and history.RunningIDForCompletedSubmission = 1		
		--left join aaIntDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = IntSub.arn 
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join DevSub_PaymentSummaryTotalAmountDisbursed on DevSub_PaymentSummaryTotalAmountDisbursed.arn = IntSub.arn and IntSub.BillingRunningID = DevSub_PaymentSummaryTotalAmountDisbursed.BillingRunningID
		left join DevSub_RentasCount on DevSub_RentasCount.arn = IntSub.arn and IntSub.BillingRunningID = DevSub_RentasCount.BillingRunningID
		left join DevSub_PaymentSummaryNumberOfPayments on DevSub_PaymentSummaryNumberOfPayments.arn = IntSub.arn and DevSub_PaymentSummaryNumberOfPayments.BillingRunningID= IntSub.BillingRunningID
		left join InternalUser on InternalUser.UserName = IntSub.DisbursementCheckerEmailAddress
	where  instance.taskowner = @AllocatedUser
end