CREATE         procedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPublicList]
as
begin
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
	With PaymentSummaryTotalAmountDisbursed as 
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
		''  as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',	
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging'	,
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
		left join aaIntDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = IntSub.arn 
		--left join aaK2Instance_billing instance on instance.arn = IntSub.arn 
		left join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOMakerBillingApproval'
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummaryTotalAmountDisbursed on PaymentSummaryTotalAmountDisbursed.arn = IntSub.arn and IntSub.BillingRunningID = PaymentSummaryTotalAmountDisbursed.BillingRunningID
		left join RentasCount on RentasCount.arn = IntSub.arn and IntSub.BillingRunningID = RentasCount.BillingRunningID
		left join PaymentSummaryNumberOfPayments on PaymentSummaryNumberOfPayments.arn = IntSub.arn and PaymentSummaryNumberOfPayments.BillingRunningID= IntSub.BillingRunningID
		left join InternalUser on InternalUser.UserName = IntSub.DisbursementCheckerEmailAddress
	where 		
		IntSub.DisbursementMakerSubmissionCompleted = 1
		and IntSub.DisbursementCheckerSubmissionCompleted = 1
		and isnull(IntSub.RCOMakerSubmissionCompleted,0) <> 1
		and instance.arn is null 		
		--and IntSub.arn in (select arn from aaSolDisbursementSubmission where arn = IntSub.arn and SolicitorSubmissionCompleted = 1 union select arn from aaSolDisbursementSubmission_history where arn = IntSub.arn and SolicitorSubmissionCompleted = 1)
		and loads.DisbursementManner = 'PR'
	union
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		''  as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		--20210412- fixed on the maker resubmission status rules 		
		'Submitted' as 'Status',	
		--DATEDIFF(day, [DateOfLOAcceptance], getdate()) as 'Aging'	,
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
		--left join aaIntDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = IntSub.arn 
		--left join aaK2Instance_billing instance on instance.arn = IntSub.arn 
		left join ddProject_MortgageAppTaskInstance instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOMakerBillingApproval'
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join DevSub_PaymentSummaryTotalAmountDisbursed on DevSub_PaymentSummaryTotalAmountDisbursed.arn = IntSub.arn and IntSub.BillingRunningID = DevSub_PaymentSummaryTotalAmountDisbursed.BillingRunningID
		left join DevSub_RentasCount on DevSub_RentasCount.arn = IntSub.arn and IntSub.BillingRunningID = DevSub_RentasCount.BillingRunningID
		left join DevSub_PaymentSummaryNumberOfPayments on DevSub_PaymentSummaryNumberOfPayments.arn = IntSub.arn and DevSub_PaymentSummaryNumberOfPayments.BillingRunningID= IntSub.BillingRunningID
		left join InternalUser on InternalUser.UserName = IntSub.DisbursementCheckerEmailAddress
	where 		
		IntSub.DisbursementMakerSubmissionCompleted = 1
		and IntSub.DisbursementCheckerSubmissionCompleted = 1
		and isnull(IntSub.RCOMakerSubmissionCompleted,0) <> 1
		and instance.arn is null 		
		--and IntSub.arn in (select arn from aaSolDisbursementSubmission where arn = IntSub.arn and SolicitorSubmissionCompleted = 1 union select arn from aaSolDisbursementSubmission_history where arn = IntSub.arn and SolicitorSubmissionCompleted = 1)
		and loads.DisbursementManner = 'PR'
end