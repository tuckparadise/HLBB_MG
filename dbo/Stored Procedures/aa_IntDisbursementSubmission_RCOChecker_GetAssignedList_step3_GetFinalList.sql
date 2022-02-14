CREATE         procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_GetAssignedList_step3_GetFinalList] 
@AllocatedUser nvarchar(max)
as
begin
	
	if (@AllocatedUser like 'K2:%')
	begin		
		set @AllocatedUser = Stuff(@AllocatedUser, 1, 3, '')			
	end 

	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',		
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		--case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		''  as 'Disbursement Stage',
		--case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		--case when c_rejected.arn is not null then 'Rejected by RCO Checker' else 'New' end as 'Status',	
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
		--inner join aaIntDisbursementSubmission_RCOChecker_AssignedList worklist on worklist.arn = IntSub.arn 
		left join MortgageAppTaskInstance_billing instance on instance.arn = IntSub.arn and instance.billingrunningid = IntSub.billingrunningid and workflow = 'DisbRCOCheckerBillingApproval'
		--left join aaIntDisbursementSubmission_History history on history.arn = IntSub.arn and history.RunningIDForCompletedSubmission = 1		
		--left join aaIntDisbursementSubmission_RCOCheckerRejected c_rejected on c_rejected.arn = IntSub.arn 
		--left join aaIntDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = IntSub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = IntSub.arn and vrapproved.[Status] = 'Completed'
	where  instance.taskowner = @AllocatedUser
	
end