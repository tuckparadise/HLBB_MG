--[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList] 'workgroup\jasonangot'

CREATE         procedure [dbo].[aa_IntDisbursementSubmission_DisChecker_GetAssignedList_step3_GetFinalList] 
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
	with PaymentSummary_Int as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from [aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		group by arn , BillingRunningID
	),
	RentasCount_Int as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from [aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	),
	PaymentSummary_Dev as 
	(
		select arn, BillingRunningID, sum(AmountDisburse) as 'TotalAmountDisbursed'
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
		group by arn , BillingRunningID
	),
	RentasCount_Dev as 
	(
		select arn, BillingRunningID, count(*) as 'RentasCount' 
		from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
		where paymentmode = 'RENTAS'
		group by arn , BillingRunningID
	)
	select 
		'EDMS' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		--'Billing'  as 'Disbursement Stage',
		--case when IntSub.DisbursementMakerDecision = 'Submitted' then 'Billing' else 'Cancel Workflow' end as 'Disbursement Stage',
		case when  IntSub.DisbursementMakerDecision = 'Delete Workflow' then 'Deletion' else  'Billing' end as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by Disbursement Checker' else 'New' end as 'Status',	
		--20210405- fixed on the maker resubmission status 
		--20210412- fixed on the maker resubmission status rules 
		case when c_rejected.arn is not null then 'Resubmission' else 'Submitted' end as 'Status',	
		DATEDIFF(day, IntSub.DisbursementMakerSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		IntSub.SolicitorSubmissionDate as SubmissionDate ,
		IntSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		IntSub.UpdatedDate  as LastModifiedDate	,
		IntSub.BillingRunningID,
		case when RentasCount_Int.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (IntSub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		--IntSub.DisbursementMakerEmailAddress,
		InternalUser.UserFullName as DisbursementMakerEmailAddress,
		PaymentSummary_Int.TotalAmountDisbursed,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,		
		LOADS.PhaseCode,
		--NULL as BillingAmount,
		--NULL as BillingDueDate,
		--null as BilingStage 
		IntSub.PR_TotalBillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as BillingDueDate,
		FORMAT (IntSub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') as BillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when IntSub.PR_Stage9 = 1 then '9' else null end),     '') + 
		--COALESCE(', ' +  RTRIM( DevSub.[PR_StageOthers] ),     '') 
		COALESCE(', ' +  RTRIM( case when IntSub.[PR_StageOthers] = '' then null else IntSub.[PR_StageOthers] end),     '') 
		, 1, 2, '') as BilingStage 
	from aaIntDisbursementSubmission IntSub 	
		inner join sqlloads loads on loads.arn = IntSub.arn 
		--inner join aaIntDisbursementSubmission_DisChecker_AssignedList worklist on worklist.arn = IntSub.arn 
		left join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbDUCheckerBillingApproval'
		--left join aaIntDisbursementSubmission_History history on history.arn = IntSub.arn and history.RunningIDForCompletedSubmission = 1		
		left join aaIntDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = IntSub.arn and c_rejected.BillingRunningID = IntSub.BillingRunningID
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary_Int on PaymentSummary_Int.arn = IntSub.arn and IntSub.BillingRunningID = PaymentSummary_Int.BillingRunningID
		left join RentasCount_Int on RentasCount_Int.arn = IntSub.arn and IntSub.BillingRunningID = RentasCount_Int.BillingRunningID
		left join InternalUser on InternalUser.UserName = IntSub.DisbursementMakerEmailAddress
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = loads.DeveloperCode
	where  instance.taskowner = @AllocatedUser
	union
	select 
		'Developer' as UploadedFrom ,
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when  DevSub.DisbursementMakerDecision = 'Delete Workflow' then 'Deletion' else  'Billing' end as 'Disbursement Stage',		
		case when c_rejected.arn is not null then 'Resubmission' else 'Submitted' end as 'Status',	
		DATEDIFF(day, DevSub.DisbursementMakerSubmissionDate, getdate()) as 'Ageing', 	
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		DevSub.ProjectSubmissionDate as SubmissionDate ,
		DevSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		DevSub.UpdatedDate  as LastModifiedDate	,
		DevSub.BillingRunningID,
		case when RentasCount_Dev.arn is not null then 'Yes' else 'No' end as WithRentalPayment,		
		FORMAT (DevSub.DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate,
		InternalUser.UserFullName as DisbursementMakerEmailAddress,
		--DevSub.DisbursementMakerEmailAddress,
		PaymentSummary_Dev.TotalAmountDisbursed,
		--LOADS.DeveloperCode,
		ddProjectDeveloper.name as DeveloperCode,
		LOADS.ProjectCode,		
		LOADS.PhaseCode,
		DevSub.PR_TotalBillingAmount as BillingAmount,
		--DevSub.PR_EarliestBillingDueDate as BillingDueDate,
		FORMAT (DevSub.PR_EarliestBillingDueDate, 'dd/MM/yyyy') as PR_EarliestBillingDueDate,
		 stuff(		
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when DevSub.PR_Stage9 = 1 then '9' else null end),      '') + 
		--COALESCE(', ' +  RTRIM( DevSub.[PR_StageOthers] ),     '') 
		COALESCE(', ' +  RTRIM( case when DevSub.[PR_StageOthers] = '' then null else DevSub.[PR_StageOthers] end),     '') 
		, 1, 2, '') as BilingStage 
	from ddProjectDisbursementSubmission_DisMaker DevSub 	
		inner join sqlloads loads on loads.arn = DevSub.arn 		
		left join ddProject_MortgageAppTaskInstance instance on instance.arn = DevSub.arn and instance.billingrunningid = DevSub.billingrunningid and workflow = 'DisbDUCheckerBillingApproval'		
		left join ddProjectDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = DevSub.arn and c_rejected.BillingRunningID = DevSub.BillingRunningID		
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = DevSub.arn and vrapproved.[Status] = 'Completed'
		left join PaymentSummary_Dev on PaymentSummary_Dev.arn = DevSub.arn and DevSub.BillingRunningID = PaymentSummary_Dev.BillingRunningID
		left join RentasCount_Dev on RentasCount_Dev.arn = DevSub.arn and DevSub.BillingRunningID = RentasCount_Dev.BillingRunningID
		left join InternalUser on InternalUser.UserName = DevSub.DisbursementMakerEmailAddress
		left join ddProjectDeveloper on  ddProjectDeveloper.ID = DevSub.DeveloperCode
	where  instance.taskowner = @AllocatedUser
end