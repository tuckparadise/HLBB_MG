CREATE             procedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetRejectedList]
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
	with PaymentSummary_Int as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from [aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		group by arn , BillingRunningID
	),
	 PaymentSummary_Int_Rejected as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail
		group by arn , BillingRunningID
	),
	RentasCount_Int as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from [aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	RentasCount_Int_rejected as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from aaIntDisbursementSubmission_DisCheckerRejectedPaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	PaymentSummary_Dev as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
		group by arn , BillingRunningID
	),
	PaymentSummary_Dev_Rejected as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail
		group by arn , BillingRunningID
	),
	RentasCount_Dev as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	RentasCount_Dev_Rejected as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from ddProjectDisbursementSubmission_DisChecker_RejectedPaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	)
	select 
		'EDMS' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgage Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when  rejected.DisbursementMakerDecision = 'Delete Workflow' then 'Deletion' else  'Billing' end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		'Rejected' as 'Status',		
		DATEDIFF(day, rejected.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		rejected.SolicitorSubmissionDate as SubmissionDate ,
		--rejected.DisbursementCheckerEmailAddress  as LastModifiedBy,
		InternalUserChecker.UserFullName as LastModifiedBy,
		FORMAT (rejected.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy')  as LastModifiedDate	,
		IntSub.BillingRunningID,
		--case  when solsub.UpdatedDate is null then FORMAT ( m_rejected.UpdatedDate, 'dd/MM/yyyy') else FORMAT (solsub.UpdatedDate, 'dd/MM/yyyy') end as LastModifiedDate,		
		case when RentasCount_Int_Rejected.arn is not null then 'Yes' else 'No' end as WithRentasPayment,		
		FORMAT (rejected.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		rejected.DisbursementMakerEmailAddress,
		PaymentSummary_Int_Rejected.TotalAmountDisbursed,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,				
		LOADS.PhaseCode,
		--NULL as BillingAmount,
		--NULL as BillingDueDate,
		--null as BilingStage 
		rejected.PR_TotalBillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as BillingDueDate,
		FORMAT (rejected.PR_EarliestBillingDueDate, 'dd/MM/yyyy') as BillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage9 = 1 then '9' else null end),     '') + 
		--COALESCE(', ' +  RTRIM( DevSub.[PR_StageOthers] ),     '') 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_StageOthers] = '' then null else rejected.[PR_StageOthers] end),     '') 
		, 1, 2, '') as BilingStage,
		InternalUserChecker.UserFullName as RejectedBy
	from aaIntDisbursementSubmission IntSub 
		inner join sqlloads loads on loads.arn = IntSub.arn 
		inner join aaIntDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = IntSub.arn and rejected.BillingRunningID = IntSub.BillingRunningID
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary_Int_Rejected on PaymentSummary_Int_Rejected.arn = IntSub.arn and IntSub.BillingRunningID = PaymentSummary_Int_Rejected.BillingRunningID
		left join RentasCount_Int_Rejected on RentasCount_Int_Rejected.arn = IntSub.arn and IntSub.BillingRunningID = RentasCount_Int_Rejected.BillingRunningID
		--left join aaK2Instance_billing instance on instance.arn = IntSub.arn 		
		left join InternalUser InternalUserChecker on InternalUserChecker.UserName = rejected.DisbursementCheckerEmailAddress
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = loads.DeveloperCode
	where IntSub.DisbursementMakerSubmissionCompleted <> 1
	/*
	where 		
		IntSub.DisbursementMakerSubmissionCompleted = 1
		and IntSub.DisbursementCheckerSubmissionCompleted = 1
		and IntSub.RCOMakerSubmissionCompleted = 1
		and isnull(IntSub.RCOCheckerSubmissionCompleted,0) <> 1
		and instance.arn is null 
		and IntSub.arn in (select arn from aaSolDisbursementSubmission where arn = IntSub.arn and SolicitorSubmissionCompleted = 1 union select arn from aaSolDisbursementSubmission_history where arn = IntSub.arn and SolicitorSubmissionCompleted = 1)
		and loads.DisbursementManner = 'PR'
	*/
	union
	select 
		'Developer' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgage Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when  rejected.DisbursementMakerDecision = 'Delete Workflow' then 'Deletion' else  'Billing' end as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		'Rejected' as 'Status',		
		DATEDIFF(day, rejected.DisbursementCheckerSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		--IntSub.SolicitorSubmissionDate as SubmissionDate ,
		rejected.ProjectSubmissionDate as SubmissionDate ,
		--rejected.DisbursementCheckerEmailAddress  as LastModifiedBy,
		InternalUserChecker.UserFullName as LastModifiedBy,
		FORMAT (rejected.DisbursementCheckerSubmissionDate, 'dd/MM/yyyy')  as LastModifiedDate	,
		DevSub.BillingRunningID,		
		case when RentasCount_Dev_Rejected.arn is not null then 'Yes' else 'No' end as WithRentasPayment,		
		FORMAT (rejected.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,		
		rejected.DisbursementMakerEmailAddress,
		PaymentSummary_Dev_Rejected.TotalAmountDisbursed,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,				
		LOADS.PhaseCode,
		rejected.PR_TotalBillingAmount as BillingAmount,		
		FORMAT (rejected.PR_EarliestBillingDueDate, 'dd/MM/yyyy') as BillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when rejected.PR_Stage9 = 1 then '9' else null end),      '') + 
		COALESCE(', ' +  RTRIM( case when rejected.[PR_StageOthers] = '' then null else rejected.[PR_StageOthers] end),     '') 
		--COALESCE(', ' +  RTRIM( DevSub.[PR_StageOthers] ),     '') 
		, 1, 2, '') as BilingStage ,
		InternalUserChecker.UserFullName as RejectedBy
	from ddProjectDisbursementSubmission_DisMaker DevSub 
		inner join sqlloads loads on loads.arn = DevSub.arn 
		inner join ddProjectDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = DevSub.arn and rejected.BillingRunningID = DevSub.BillingRunningID
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary_Dev_Rejected on PaymentSummary_Dev_Rejected.arn = DevSub.arn and DevSub.BillingRunningID = PaymentSummary_Dev_Rejected.BillingRunningID
		left join RentasCount_Dev_Rejected on RentasCount_Dev_Rejected.arn = DevSub.arn and DevSub.BillingRunningID = RentasCount_Dev_Rejected.BillingRunningID		
		--left join InternalUser on InternalUser.UserName = DevSub.DisbursementMakerEmailAddress
		left join InternalUser InternalUserChecker on InternalUserChecker.UserName = rejected.DisbursementCheckerEmailAddress
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = loads.DeveloperCode
	where DevSub.DisbursementMakerSubmissionCompleted <> 1	
end