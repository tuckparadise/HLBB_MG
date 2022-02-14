CREATE     procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetAssignedList_step3_GetFinalList] 
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
	)		
	select 
		[MortgateCenterCode] as 'Mortgate Center',
		LOADS.[ARN] as 'Credit Application No.',
		[ApplicantName] as 'Primary Customer Name',
		[CollateralPurpose] as 'Purpose',
		[TotalFinancingAmount] as 'Total Financing Amount',		
		[DisbursementManner] as 'Disbursement Manner', 		
		case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',
		case when (c_rejected.arn is not null and m_rejected.arn is null) then 'Rejected by Disbursement Checker' when solsub.SolicitorSubmissionOption = 'Resubmitted' then 'Resubmission' else solsub.SolicitorSubmissionOption end as 'Status',		
		DATEDIFF(day, solsub.SolicitorSubmissionDate, getdate()) as 'Ageing', 
		case when loads.ValuationRequired = 1 then 'Yes' else 'no' end as 'VR Required', 
		case when loads.ValuationRequired = 1 and vrapproved.arn is null then 'No' when loads.ValuationRequired = 1 and vrapproved.arn is not null then 'Yes' else 'N/A' end as 'VR Received',		
		--solsub.SolicitorSubmissionDate as SubmissionDate ,
		FORMAT (solsub.SolicitorSubmissionDate, 'dd/MM/yyyy') as SubmissionDate,
		case solsub.DisbursementMakerEmailAddress when null then m_rejected.DisbursementMakerEmailAddress else solsub.DisbursementMakerEmailAddress end as LastModifiedBy,
		case solsub.UpdatedDate when null then m_rejected.UpdatedDate else solsub.UpdatedDate end as LastModifiedDate	,
		loads.SolicitorCode
	from aaSolDisbursementSubmission_DisMakerSubmission solsub		
		inner join sqlloads loads on loads.arn = solsub.arn 
		inner join MortgageAppTaskInstance worklist on worklist.arn = solsub.arn and workflow = 'DisbDUMakerSolicitorApproval'		
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1		
		left join cte2 history on history.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = solsub.arn 
		left join aaSolDisbursementSubmission_DisMakerRejected m_rejected on m_rejected.arn = solsub.arn 
		left join SQLDUMakerDP_ValuerSubmission vrapproved on vrapproved.arn = solsub.arn and vrapproved.[Status] = 'Completed'
	where  solsub.SolicitorSubmissionCompleted = 1
		and solsub.SolicitorSubmissionOption in ('Submitted','Resubmitted','Cancelled')
		--and worklist.TaskOwner = @AllocatedUser
		and worklist.TaskOwner = case when @AllocatedUser like 'K2:%' then Stuff(@AllocatedUser, 1, 3, '')	else @AllocatedUser end 
	
end