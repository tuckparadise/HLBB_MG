CREATE       procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetPublicList]
as
begin
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		''  as 'Disbursement Stage',
		--case when rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',		
		'New' as 'Status',		
		DATEDIFF(day, IntSub.SolicitorSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',
		IntSub.SolicitorSubmissionDate as SubmissionDate ,
		IntSub.DisbursementMakerEmailAddress  as LastModifiedBy,
		IntSub.UpdatedDate  as LastModifiedDate	,
		IntSub.BillingRunningID
	from aaIntDisbursementSubmission IntSub 
		inner join sqlloads loads on loads.arn = IntSub.arn 
		left join aaIntDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = IntSub.arn 
		--left join aaK2Instance_billing instance on instance.arn = IntSub.arn 			
		left join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOMakerBillingApproval'
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
	where 		
		IntSub.DisbursementMakerSubmissionCompleted = 1
		and IntSub.DisbursementCheckerSubmissionCompleted = 1
		and IntSub.RCOMakerSubmissionCompleted = 1
		and isnull(IntSub.RCOCheckerSubmissionCompleted,0) <> 1
		and instance.arn is null 
		--and IntSub.arn in (select arn from aaSolDisbursementSubmission where arn = IntSub.arn and SolicitorSubmissionCompleted = 1 union select arn from aaSolDisbursementSubmission_history where arn = IntSub.arn and SolicitorSubmissionCompleted = 1)
		and loads.DisbursementManner = 'PR'
				
end