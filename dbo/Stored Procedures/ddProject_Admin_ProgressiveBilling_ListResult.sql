CREATE       procedure [dbo].[ddProject_Admin_ProgressiveBilling_ListResult]

@DeveloperCode nvarchar(max) = null, 
@MortgageCentre nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@Status nvarchar(max) = null ,
@BilllingDueDateFrom datetime = null,
@BilllingDueDateTo datetime = null,
@ReportDateFrom datetime = null,
@ReportDateTo datetime = null,
@DeveloperName nvarchar(max) = null ,
@PhaseName nvarchar(max) = null ,
@ReportUser nvarchar(max) = null ,
@Category nvarchar(max) = null 
as
begin	

	if (@ReportUser like 'K2:%')
	begin		
		set @ReportUser = Stuff(@ReportUser, 1, 3, '')					
	end 

	
SELECT [MortgageCentre]
      ,[CreditApplicationNumber]
      ,[Unit/Parcel No.]
      ,[DeveloperName]
      ,[DeveloperCode]
      ,[PhaseName]
      ,[PhaseCode]
      ,[SADAIndicator]
      ,[SolicitorName]
      ,[SolicitorCode]
      ,[SPAPrice]
      ,[SPADate]
      ,[SPA Construction Period (months)]
      ,[Extended Construction Period (months)]
      ,[TotalFacilityAmount]
      ,[Total Financing Amount (exclude FLVM)] as [Total Financing Amount (excluding FLVM)] 
      ,[1st Payment (Release) Date]
      ,[TotalDisbursedAmount] as [Total Disbursed Amount (excluding FLVM)]
      ,[CompletedBilling]
      ,[SubmissionType]
      ,[SubmissionDate]
      ,[WFStatus]
      ,[DisbursementMakerRejectionDate]
      ,[DeveloperResubmissionDate]
      ,[DisbursementAgeing]
      ,[BillingStage]
      ,[BillingDueDate]
      ,[BillingAmount (by dev)]
      ,[DisbursedAmount] as [Disbursed Amount (excluding FLVM)]
      ,[FinalBilling]
	  ,[CurrentDisbursementMaker]
      ,[DisbursementMakerName] 
      ,[DisbursementMakerDeletionDate]
      ,[DisbursementMakerApprovalDate]
      ,[DisbursementMakerApprovalAgeing]
	  ,[CurrentDisbursementChecker] 
      ,[DisbursementCheckerName] 
      ,[DisbursementCheckerDeletionDate]
      ,[DisbursementCheckerApprovalDate]
      ,[DisbursementCheckerApprovalAgeing]   
	  ,DisbursementMakerPickupDate
	  ,DisbursementCheckerRejectionDate
	from ddProject_Report_ProgressiveBilling
	where ReportUser = @reportuser

	/*
	delete from ddProject_Report_ProgressiveBilling
	where ReportUser = @reportuser 
	*/

	/*
	if (@Category = 'SubmissionDate')
	begin		
		with cancelled (arn) as
		(
			select distinct arn 
			from aaSolDisbursementSubmission_DisMakerSubmission_History
			where solicitorsubmissionoption = 'Cancelled' 
			and DisbursementCheckerDecision = 'Approve' 
				and DisbursementCheckersubmissionCompleted = 1
		)
		,
		IntSub_CurrentTotalDisbursedAmount (arn,TotalDisbursedAmount,billingRunningID) as 
		(
			select arn,				 
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
			union 
			select arn,				 
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
		),
		DevSub_CurrentTotalDisbursedAmount (arn,TotalDisbursedAmount,billingRunningID) as 
		(
			select arn,				
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID 
			from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
			union 
			select arn,				
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID 
			from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 
			group by arn,billingRunningID
		),
		SolDisbursementHistory (arn, firstRunningIDForCompletedSubmission) as
		(
			select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
			from aaSolDisbursementSubmission_DisMakerSubmission_History
			group by arn 
		),
		CTE (arn, BillingRunningID, WFStatus,SubmissionFrom,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate ,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker)
		as (
			select sub.arn,sub.BillingRunningID, 
			case 				
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Submit' then 'Approved By Disbursement Checker'
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Checker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Submit' then 'Approved By Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0 then 'New Billing'
				when SolDisbursementHistory.arn is null then 'Pending LA' 
				end as [WFStatus]	,
				'EDMS' as SubmissionFrom,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPADate else null end as SPADate,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPAConstructionPeriodInMonths else null end as SPAConstructionPeriodInMonths,				
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.ExtendedConstructionPeriodInMonths else null end as ExtendedConstructionPeriodInMonths,								
				sub.SolicitorSubmissionDate as [SubmissionDate],		
				null as [DisbursementMakerRejectionDate],
				null as [DeveloperResubmissionDate],				
				case when sub.DisbursementMakerDecision = 'Submit' and sub.DisbursementMakerSubmissionCompleted = 1 then stuff(		
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage3 = 1 then '3' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage4 = 1 then '4' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage5 = 1 then '5' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage6 = 1 then '6' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage7 = 1 then '7' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage8 = 1 then '8' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage9 = 1 then '9' else null end),     '') + 
				COALESCE(', ' +  RTRIM( sub.[PR_StageOthers] ),     '') 
				, 1, 2, '') else null end as BillingStage ,				
				--null as BillingStage,
				case when SolDisbursementHistory.arn is not null and sub.disbursementmakersubmissioncompleted = 1 then sub.PR_EarliestBillingDueDate else null end as PR_EarliestBillingDueDate,
				null as BillingAmount,
				case when sub.disbursementmakersubmissioncompleted = 1 then IntSub_CurrentTotalDisbursedAmount.TotalDisbursedAmount else null end as CurrentDisbursedAmount,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then case when sub.FinalBillingFlag  = 1 then 'Yes' else 'No' end else null end as [FinalBilling],
				case when sub.disbursementmakersubmissioncompleted = 1 then sub.DisbursementMakerEmailAddress else null end as DisbursementMakerEmailAddress,
				case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerDeletionDate],
				case when sub.DisbursementMakerDecision = 'Submit' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerApprovalDate],
				--null as [DisbursementMakerApprovalDate],
				case when sub.disbursementmakersubmissioncompleted = 1 then DATEDIFF(day, sub.SolicitorSubmissionDate, sub.DisbursementMakerSubmissionDate) else DATEDIFF(day, sub.SolicitorSubmissionDate, getdate()) end as [DisbursementMakerApprovalAgeing] ,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerEmailAddress else null end as DisbursementCheckerEmailAddress,				
				case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerDeletionDate],
				case when sub.DisbursementCheckerDecision = 'Approve' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerApprovalDate],
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, sub.DisbursementCheckerSubmissionDate) when sub.DisbursementMakerSubmissionCompleted = 1 and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0  then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, getdate()) else null end as [DisbursementCheckerApprovalAgeing] ,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.SolicitorSubmissionDate, sub.DisbursementCheckerSubmissionDate)  else DATEDIFF(day, sub.SolicitorSubmissionDate, getdate()) end as [DisbursementAgeing],
				ins_maker.TaskOwner as CurrentDisbursementMaker,
				ins_checker.TaskOwner as CurrentDisbursementChecker			
			from vw_rpt_aaIntDisbursementSubmission sub
				left join sqlloads on sqlloads.arn = sub.arn 
				left join aaIntDisbursementSubmission_DisCheckerRejected rejected on sub.arn = rejected.arn and rejected.BillingRunningID = sub.BillingRunningID
				--left join sqlloads on sqlloads.arn = sub.arn 		
				left join IntSub_CurrentTotalDisbursedAmount on IntSub_CurrentTotalDisbursedAmount.arn = sub.arn and sub.BillingRunningID = IntSub_CurrentTotalDisbursedAmount.billingRunningID
				left join cancelled on cancelled.arn = sub.arn 
				left join SolDisbursementHistory on SolDisbursementHistory.arn = sub.arn 			
				left join MortgageAppTaskInstance_billing ins_maker on ins_maker.arn = sub.arn and ins_maker.BillingRunningID = sub.BillingRunningID and ins_maker.workflow = 'DisbDUMakerBillingApproval'
				left join MortgageAppTaskInstance_billing ins_checker on ins_checker.arn = sub.arn and ins_checker.BillingRunningID = sub.BillingRunningID and ins_checker.workflow = 'DisbDUCheckerBillingApproval'
				left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
				left join ddProjectPhase on ddProjectPhase.PhaseCode = SQLLOADS.PhaseCode and ddProjectPhase.DeveloperCode = SQLLOADS.DeveloperCode
			where 
				cancelled.arn is null 
				--and sub.SolicitorSubmissionDate between @ReportDateFrom and @ReportDateTo
				and sub.SolicitorSubmissionDate between @ReportDateFrom and @ReportDateTo
				and sqlloads.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
				and sqlloads.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
				and sqlloads.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 			
				--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @BilllingDueDateTo) end
				and isnull(sub.PR_EarliestBillingDueDate,'2000-01-01')  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
				and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
				and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
			union 

		select sub.arn,sub.BillingRunningID, 
			case 
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Approve' then 'Approved By Disbursement Checker'
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Checker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and checker_rejected.arn is not null then 'Rejected By Disbursement Checker'				
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerDecision = 'Approve' then 'Approved By Disbursement Maker'
				--when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 0 and sub.DisbursementMakerSubmissionCompleted = 0 and maker_rejected.arn is not null then 'Rejected By Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0  and maker_rejected.arn is not null then 'Resubmission By Developer'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0  and maker_rejected.arn is null then 'Submission By Developer'
				when SolDisbursementHistory.arn is null then 'Pending LA'
				end as [WFStatus],
				'Developer' as SubmissionFrom,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPADate else null end as SPADate,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPAConstructionPeriodInMonths else null end as SPAConstructionPeriodInMonths,				
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.ExtendedConstructionPeriodInMonths else null end as ExtendedConstructionPeriodInMonths,								
				sub.ProjectSubmissionDate as [SubmissionDate],
				case when maker_rejected.arn is not null then maker_rejected.[DisbursementMakerSubmissionDate] else null end as [DisbursementMakerRejectionDate],
				case when SolDisbursementHistory.arn is not null and sub.ProjectSubmissionOption = 'Resubmission' then sub.ProjectSubmissionDate else null end as [DeveloperResubmissionDate],
				case when sub.DisbursementMakerDecision = 'Approve' and sub.DisbursementMakerSubmissionCompleted = 1 then stuff(		
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage3 = 1 then '3' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage4 = 1 then '4' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage5 = 1 then '5' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage6 = 1 then '6' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage7 = 1 then '7' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage8 = 1 then '8' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage9 = 1 then '9' else null end),     '') + 
				COALESCE(', ' +  RTRIM( sub.[PR_StageOthers] ),     '') 
				, 1, 2, '') when isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0 then 
				stuff(		
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage3 = 1 then '3' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage4 = 1 then '4' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage5 = 1 then '5' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage6 = 1 then '6' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage7 = 1 then '7' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage8 = 1 then '8' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage9 = 1 then '9' else null end),     '') + 
					COALESCE(', ' +  RTRIM( devsub_history.[PR_StageOthers] ),     '') 
					, 1, 2, '') 
				else null end as BillingStage 
				,case when sub.DisbursementMakerSubmissionCompleted = 1 then sub.PR_EarliestBillingDueDate when isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0 then devsub_history.PR_EarliestBillingDueDate end as PR_EarliestBillingDueDate
				,devsub_history.BillingAmount 
				,DevSub_CurrentTotalDisbursedAmount.TotalDisbursedAmount as CurrentDisbursedAmount				
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then case when sub.FinalBillingFlag  = 1 then 'Yes' else 'No' end else 'N/A' end as [FinalBilling]
				--,sub.DisbursementMakerEmailAddress 
				,case when sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerEmailAddress else null end as DisbursementMakerEmailAddress
				,case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerDeletionDate]
				,case when sub.DisbursementMakerDecision = 'Approve' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerApprovalDate]
				,case when sub.disbursementmakersubmissioncompleted = 1 then DATEDIFF(day, sub.ProjectSubmissionDate, sub.DisbursementMakerSubmissionDate) else DATEDIFF(day, sub.ProjectSubmissionDate, getdate()) end as [DisbursementMakerApprovalAgeing] 
				--,sub.DisbursementCheckerEmailAddress 
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerEmailAddress else null end as DisbursementCheckerEmailAddress
				,case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerDeletionDate]
				,case when sub.DisbursementCheckerDecision = 'Approve' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerApprovalDate]
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, sub.DisbursementCheckerSubmissionDate) when sub.DisbursementMakerSubmissionCompleted = 1 and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0  then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, getdate()) else null end as [DisbursementCheckerApprovalAgeing] 
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.ProjectSubmissionDate, sub.DisbursementCheckerSubmissionDate)  else DATEDIFF(day, sub.ProjectSubmissionDate, getdate()) end as [DisbursementAgeing] 
				,ins_maker.TaskOwner as CurrentDisbursementMaker
				,ins_checker.TaskOwner as CurrentDisbursementChecker
			from vw_rpt_ddProjectDisbursementSubmission_DisMaker sub
				left join ddProjectDisbursementSubmission_DisCheckerRejected rejected on sub.arn = rejected.arn and rejected.BillingRunningID = sub.BillingRunningID		
				left join sqlloads on sqlloads.arn = sub.arn 
				left join ddProjectDisbursementSubmission_DisMaker_Rejected maker_rejected on maker_rejected.arn = sub.arn and maker_rejected.BillingRunningID = sub.BillingRunningID
				left join ddProjectDisbursementSubmission_SubmissionHistory2 devsub_history on devsub_history.arn = sub.arn and devsub_history.DraftID = sub.DraftID
				left join DevSub_CurrentTotalDisbursedAmount on DevSub_CurrentTotalDisbursedAmount.arn = sub.arn and sub.BillingRunningID = DevSub_CurrentTotalDisbursedAmount.billingRunningID
				left join cancelled on cancelled.arn = sub.arn 
				left join SolDisbursementHistory on SolDisbursementHistory.arn = sub.arn 
				left join ddProject_MortgageAppTaskInstance ins_maker on ins_maker.arn = sub.arn and ins_maker.BillingRunningID = sub.BillingRunningID and ins_maker.workflow = 'ProjectSubmission_DisMaker'
				left join ddProject_MortgageAppTaskInstance ins_checker on ins_checker.arn = sub.arn and ins_checker.BillingRunningID = sub.BillingRunningID and ins_checker.workflow = 'ProjectSubmission_DisChecker'
				left join ddProjectDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = sub.arn and checker_rejected.BillingRunningID = sub.BillingRunningID
				left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
				left join ddProjectPhase on ddProjectPhase.PhaseCode = SQLLOADS.PhaseCode and ddProjectPhase.DeveloperCode = SQLLOADS.DeveloperCode
			where 
				cancelled.arn is null 
				and sub.ProjectSubmissionDate between @ReportDateFrom and @ReportDateTo
				and sqlloads.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
				and sqlloads.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
				and sqlloads.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 			
				--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @BilllingDueDateTo) end
				--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
				and isnull(sub.PR_EarliestBillingDueDate,'2000-01-01')  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
				and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
				and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
			union
			-- dev: maker rejected 
			select sub.arn,sub.BillingRunningID, 
				'Rejected By Disbursement Maker' as [WFStatus],			
				'Developer' as SubmissionFrom,
				null as SPADate ,
				null as SPAConstructionPeriodInMonths,				
				null as ExtendedConstructionPeriodInMonths,								
				sub.ProjectSubmissionDate ,
				sub.DisbursementMakerSubmissionDate as [DisbursementMakerRejectionDate],
				null as [DeveloperResubmissionDate],
				null as BillingStage,
				null as PR_EarliestBillingDueDate,
				null as BillingAmount,
				null as CurrentDisbursedAmount,
				null as FinalBilling,								
				sub.DisbursementMakerEmailAddress ,
				null as [DisbursementMakerDeletionDate],
				null as [DisbursementMakerApprovalDate],				
				null as [DisbursementMakerApprovalAgeing],								
				null as DisbursementCheckerEmailAddress,
				null as [DisbursementCheckerDeletionDate],
				null as DisbursementCheckerApprovalDate,
				null as DisbursementCheckerApprovalAgeing,
				DATEDIFF(day, sub.ProjectSubmissionDate, getdate()) as [DisbursementAgeing],				
				null as CurrentDisbursementMaker,
				null as CurrentDisbursementChecker
			from ddProjectDisbursementSubmission_DisMaker_Rejected sub
				left join ddProjectDisbursementSubmission_DisCheckerRejected rejected on sub.arn = rejected.arn and rejected.BillingRunningID = sub.BillingRunningID		
				left join sqlloads on sqlloads.arn = sub.arn 
				left join ddProjectDisbursementSubmission_DisMaker_Rejected maker_rejected on maker_rejected.arn = sub.arn and maker_rejected.BillingRunningID = sub.BillingRunningID
				left join ddProjectDisbursementSubmission_SubmissionHistory2 devsub_history on devsub_history.arn = sub.arn and devsub_history.DraftID = sub.DraftID
				left join DevSub_CurrentTotalDisbursedAmount on DevSub_CurrentTotalDisbursedAmount.arn = sub.arn and sub.BillingRunningID = DevSub_CurrentTotalDisbursedAmount.billingRunningID
				left join cancelled on cancelled.arn = sub.arn 
				left join SolDisbursementHistory on SolDisbursementHistory.arn = sub.arn 
				left join ddProject_MortgageAppTaskInstance ins_maker on ins_maker.arn = sub.arn and ins_maker.BillingRunningID = sub.BillingRunningID and ins_maker.workflow = 'ProjectSubmission_DisMaker'
				left join ddProject_MortgageAppTaskInstance ins_checker on ins_checker.arn = sub.arn and ins_checker.BillingRunningID = sub.BillingRunningID and ins_checker.workflow = 'ProjectSubmission_DisChecker'
				left join ddProjectDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = sub.arn and checker_rejected.BillingRunningID = sub.BillingRunningID
				left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
				left join ddProjectPhase on ddProjectPhase.PhaseCode = SQLLOADS.PhaseCode and ddProjectPhase.DeveloperCode = SQLLOADS.DeveloperCode
			where 
				cancelled.arn is null 
				and sub.ProjectSubmissionDate between @ReportDateFrom and @ReportDateTo
				and sqlloads.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
				and sqlloads.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
				and sqlloads.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 			
				--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @BilllingDueDateTo) end
				--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
				and isnull(sub.PR_EarliestBillingDueDate,'2000-01-01')  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
				and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
				and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
		),		
		CTE2  (arn, BillingRunningID, WFStatus,SubmissionFrom,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker) as 
		(
			select DevSub.arn, 
				DevSub.BillingRunningID, 
				DevSub.WFStatus ,
				SubmissionFrom
				,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker
			from CTE DevSub
			--left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
			left join sqlloads on sqlloads.arn = DevSub.arn 
			--and solsubhistory.arn is not null 	
		),
		FirstReleaseDate (arn,DisCheckerApprovedDate) as 
		(			
			select arn,min(DisCheckerApprovedDate) as DisCheckerApprovedDate
			from vw_aaDisbursementPaymentHistory
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn	
		),
		TotalDisbursedAmount (arn,TotalDisbursedAmount) as 
		(
			select arn,sum([AmountDisburse]) as TotalDisbursedAmount
			from vw_aaDisbursementPaymentHistory
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn
		),
		
		history_completedStage (arn, PR_StageOthers,CompletedStage) as
		(		
			select tbl.arn, PR_StageOthers,CompletedStage = stuff(		
					COALESCE(', ' +  RTRIM( PR_Stage2AFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2BFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2CFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2DFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2EFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2FFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2GFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2HFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2IFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2JFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2KFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage3),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage4),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage5),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage6),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage7),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage8),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage9),     '') 	
					--COALESCE(', ' +  RTRIM( [PR_StageOthers] ),     '') 
					, 1, 2, '')				
			from 
			(
			select arn, 	
				case when max(cast(isnull(PR_Stage2AFlag,0) as tinyint))  = 1 then '2/2a' else null end as PR_Stage2AFlag,
				case when max(cast(isnull(PR_Stage2BFlag,0) as tinyint))  = 1 then '2b' else null end as PR_Stage2BFlag,
				case when max(cast(isnull(PR_Stage2CFlag,0) as tinyint))  = 1 then '2c' else null end as PR_Stage2CFlag,
				case when max(cast(isnull(PR_Stage2DFlag,0) as tinyint))  = 1 then '2d' else null end as PR_Stage2DFlag,
				case when max(cast(isnull(PR_Stage2EFlag,0) as tinyint))  = 1 then '2e' else null end as PR_Stage2EFlag,
				case when max(cast(isnull(PR_Stage2FFlag,0) as tinyint))  = 1 then '2f' else null end as PR_Stage2FFlag,
				case when max(cast(isnull(PR_Stage2GFlag,0) as tinyint))  = 1 then '2g' else null end as PR_Stage2GFlag,
				case when max(cast(isnull(PR_Stage2HFlag,0) as tinyint))  = 1 then '2h' else null end as PR_Stage2HFlag,	 
				case when max(cast(isnull(PR_Stage2IFlag,0) as tinyint))  = 1 then '2i' else null end as PR_Stage2IFlag,
				case when max(cast(isnull(PR_Stage2JFlag,0) as tinyint))  = 1 then '2j' else null end as PR_Stage2JFlag,
				case when max(cast(isnull(PR_Stage2KFlag,0) as tinyint))  = 1 then '2k' else null end as PR_Stage2KFlag,
				case when max(cast(isnull(PR_Stage3,0) as tinyint))  = 1 then '3' else null end as PR_Stage3,
				case when max(cast(isnull(PR_Stage4,0) as tinyint))  = 1 then '4' else null end as PR_Stage4,
				case when max(cast(isnull(PR_Stage5,0) as tinyint))  = 1 then '5' else null end as PR_Stage5,
				case when max(cast(isnull(PR_Stage6,0) as tinyint))  = 1 then '6' else null end as PR_Stage6,
				case when max(cast(isnull(PR_Stage7,0) as tinyint))  = 1 then '7' else null end as PR_Stage7,
				case when max(cast(isnull(PR_Stage8,0) as tinyint))  = 1 then '8' else null end as PR_Stage8,
				case when max(cast(isnull(PR_Stage9,0) as tinyint))  = 1 then '9' else null end as PR_Stage9			
			from vw_aaDisbursementHistory
			group by arn
			) tbl 
			left join (SELECT arn, PR_StageOthers = dbo.tfn_CoalesceConcat_PR_StageOthers(arn)
			  FROM vw_aaDisbursementHistory
			  GROUP BY arn) others on others.arn = tbl.arn 		
		)	
		insert into ddProject_Report_ProgressiveBilling
		select SQLLOADS.MortgateCenterCode as [MortgageCentre],
			CTE2.arn as [CreditApplicationNumber],
			SQLLOADS.AddressLine1 as [Unit/Parcel No.],
			ddProjectDeveloper.[name] as [DeveloperName],
			SQLLOADS.DeveloperCode as [DeveloperCode],
			ddProjectPhase.PhaseName as [PhaseName],
			SQLLOADS.PhaseCode as [PhaseCode],
			case when isnull(ddProjectPhase.SADAFlag,0)  = 1 then 'Yes' else 'No' end as [SADAIndicator],
			SQLLOADS.SolicitorName as SolicitorName,
			SQLLOADS.SolicitorCode as SolicitorCode,
			SQLLOADS.SPAValue as [SPAPrice] ,			 
			FORMAT (CTE2.SPADate, 'dd/MM/yyyy') as [SPADate],
			SPAConstructionPeriodInMonths as [SPA Construction Period (months)],
			ExtendedConstructionPeriodInMonths as [Extended Construction Period (months)],
			SQLLOADS.TotalFinancingAmount as [TotalFacilityAmount],
			SQLLOADS.LoanAmount as [Total Financing Amount (exclude FLVM)],			 
			FORMAT (FirstReleaseDate.DisCheckerApprovedDate, 'dd/MM/yyyy HH:mm:ss') as [1st Payment (Release) Date],
			TotalDisbursedAmount.TotalDisbursedAmount as TotalDisbursedAmount,
			history_completedStage.CompletedStage + ',' + isnull(history_completedStage.PR_StageOthers,'') as [CompletedBilling],
			CTE2.SubmissionFrom as [SubmissionType],
			FORMAT (CTE2.SubmissionDate, 'dd/MM/yyyy HH:mm:ss') as [SubmissionDate],	
			CTE2.WFStatus,
			CTE2.DisbursementMakerRejectionDate,
			CTE2.DeveloperResubmissionDate,
			DisbursementAgeing,			
			CTE2.BillingStage,
			CTE2.PR_EarliestBillingDueDate as [BillingDueDate],
			CTE2.BillingAmount as [BillingAmount (by dev)],
			CTE2.CurrentDisbursedAmount as [DisbursedAmount],
			CTE2.FinalBilling,
			--CurrentDisbursementMaker,
			InternalUser_Maker.UserFullName as [DisbursementMakerName],	
			FORMAT (CTE2.DisbursementMakerDeletionDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementMakerDeletionDate	,	
			FORMAT (CTE2.DisbursementMakerApprovalDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementMakerApprovalDate	,							
			DisbursementMakerApprovalAgeing,
			--CurrentDisbursementChecker,
			InternalUser_Checker.UserFullName as [DisbursementCheckerName],				
			FORMAT (CTE2.DisbursementCheckerDeletionDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerDeletionDate	,	
			FORMAT (CTE2.DisbursementCheckerApprovalDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerApprovalDate	,										
			DisbursementCheckerApprovalAgeing,	
			@reportuser as ReportUser
		--into ddProject_Report_ProgressiveBilling
		from CTE2
			left join SQLLOADS on SQLLOADS.arn = CTE2.arn
			left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
			left join ddProjectPhase on SQLLOADS.PhaseCode = ddProjectPhase.PhaseCode 
				and SQLLOADS.ProjectCode = ddProjectPhase.ProjectCode 
				and SQLLOADS.DeveloperCode = ddProjectPhase.DeveloperCode 
			left join FirstReleaseDate on FirstReleaseDate.arn = SQLLOADS.arn
			left join TotalDisbursedAmount on TotalDisbursedAmount.arn = SQLLOADS.arn
			left join history_completedStage on history_completedStage.arn = SQLLOADS.arn			
			left join InternalUser InternalUser_Maker on InternalUser_Maker.UserName = CTE2.DisbursementMakerEmailAddress
			left join InternalUser InternalUser_Checker on InternalUser_Checker.UserName = CTE2.DisbursementMakerEmailAddress

		where CTE2.WFStatus like case when @Status is null then '%' else @Status end 			
	end 
	
	if (@Category = 'CheckerApprovalDate')
	begin		
		with 
		cancelled (arn) as
		(
			select distinct arn 
			from aaSolDisbursementSubmission_DisMakerSubmission_History
			where solicitorsubmissionoption = 'Cancelled' 
			and DisbursementCheckerDecision = 'Approve' 
				and DisbursementCheckersubmissionCompleted = 1
		)
		,
		SolDisbursementHistory (arn, firstRunningIDForCompletedSubmission) as
		(
			select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
			from aaSolDisbursementSubmission_DisMakerSubmission_History
			group by arn 
		),
		IntSub_CurrentTotalDisbursedAmount (arn,TotalDisbursedAmount,billingRunningID) as 
		(
			select arn,				 
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID				
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
			union 
			select arn,				 
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
		),
		DevSub_CurrentTotalDisbursedAmount (arn,TotalDisbursedAmount,billingRunningID) as 
		(
			select arn,				
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID 
			from ddProjectDisbursementSubmission_DisMaker_PaymentDetail
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn,billingRunningID
			union 
			select arn,				
				sum([AmountDisburse]) as TotalDisbursedAmount,
				billingRunningID 
			from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 
			group by arn,billingRunningID
		),
		CTE (arn, BillingRunningID, WFStatus,SubmissionFrom,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate ,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker)
		as (
		select sub.arn,sub.BillingRunningID, 
			case 				
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Submit' then 'Approved By Disbursement Checker'
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Checker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Submit' then 'Approved By Disbursement Maker'
				when SolDisbursementHistory.arn is null then 'Pending LA' 
				end as [WFStatus]	,
				'EDMS' as SubmissionFrom,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPADate else null end as SPADate,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPAConstructionPeriodInMonths else null end as SPAConstructionPeriodInMonths,				
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.ExtendedConstructionPeriodInMonths else null end as ExtendedConstructionPeriodInMonths,								
				sub.SolicitorSubmissionDate as [SubmissionDate],		
				null as [DisbursementMakerRejectionDate],
				null as [DeveloperResubmissionDate],				
				case when sub.DisbursementMakerDecision = 'Submit' and sub.DisbursementMakerSubmissionCompleted = 1 then stuff(		
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage3 = 1 then '3' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage4 = 1 then '4' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage5 = 1 then '5' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage6 = 1 then '6' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage7 = 1 then '7' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage8 = 1 then '8' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage9 = 1 then '9' else null end),     '') + 
				COALESCE(', ' +  RTRIM( sub.[PR_StageOthers] ),     '') 
				, 1, 2, '') else null end as BillingStage ,
				
				--null as BillingStage,
				case when SolDisbursementHistory.arn is not null and sub.disbursementmakersubmissioncompleted = 1 then sub.PR_EarliestBillingDueDate else null end as PR_EarliestBillingDueDate,
				null as BillingAmount,
				case when sub.disbursementmakersubmissioncompleted = 1 then IntSub_CurrentTotalDisbursedAmount.TotalDisbursedAmount else null end as CurrentDisbursedAmount,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then case when sub.FinalBillingFlag  = 1 then 'Yes' else 'No' end else null end as [FinalBilling],
				case when sub.disbursementmakersubmissioncompleted = 1 then sub.DisbursementMakerEmailAddress else null end as DisbursementMakerEmailAddress,
				case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerDeletionDate],
				case when sub.DisbursementMakerDecision = 'Submit' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerApprovalDate],
				--null as [DisbursementMakerApprovalDate],
				case when sub.disbursementmakersubmissioncompleted = 1 then DATEDIFF(day, sub.SolicitorSubmissionDate, sub.DisbursementMakerSubmissionDate) else DATEDIFF(day, sub.SolicitorSubmissionDate, getdate()) end as [DisbursementMakerApprovalAgeing] ,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then DisbursementCheckerEmailAddress else null end as DisbursementCheckerEmailAddress,
				case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerDeletionDate],
				case when sub.DisbursementCheckerDecision = 'Approve' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerApprovalDate],
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, sub.DisbursementCheckerSubmissionDate) when sub.DisbursementMakerSubmissionCompleted = 1 and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0  then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, getdate()) else null end as [DisbursementCheckerApprovalAgeing] ,
				case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.SolicitorSubmissionDate, sub.DisbursementCheckerSubmissionDate)  else DATEDIFF(day, sub.SolicitorSubmissionDate, getdate()) end as [DisbursementAgeing] ,
				ins_maker.TaskOwner as CurrentDisbursementMaker,
				ins_checker.TaskOwner as CurrentDisbursementChecker
		from vw_rpt_aaIntDisbursementSubmission sub
			left join sqlloads on sqlloads.arn = sub.arn 		
			left join IntSub_CurrentTotalDisbursedAmount on IntSub_CurrentTotalDisbursedAmount.arn = sub.arn and sub.BillingRunningID = IntSub_CurrentTotalDisbursedAmount.billingRunningID
			left join cancelled on cancelled.arn = sub.arn 
			left join SolDisbursementHistory on SolDisbursementHistory.arn = sub.arn 
			left join MortgageAppTaskInstance_billing ins_maker on ins_maker.arn = sub.arn and ins_maker.BillingRunningID = sub.BillingRunningID and ins_maker.workflow = 'DisbDUMakerBillingApproval'
			left join MortgageAppTaskInstance_billing ins_checker on ins_checker.arn = sub.arn and ins_checker.BillingRunningID = sub.BillingRunningID and ins_checker.workflow = 'DisbDUCheckerBillingApproval'
			left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
			left join ddProjectPhase on ddProjectPhase.PhaseCode = SQLLOADS.PhaseCode and ddProjectPhase.DeveloperCode = SQLLOADS.DeveloperCode
		where cancelled.arn is null 
			and sub.DisbursementCheckerSubmissionCompleted = 1
			and sub.DisbursementCheckerSubmissionDate between @ReportDateFrom and @ReportDateTo
			and sqlloads.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
			and sqlloads.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
			and sqlloads.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 			
			--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @BilllingDueDateTo) end
			--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
			and isnull(sub.PR_EarliestBillingDueDate,'2000-01-01')  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
			and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
			and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
		union 

		select sub.arn,sub.BillingRunningID, 
			case 
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Approve' then 'Approved By Disbursement Checker'
				when SolDisbursementHistory.arn is not null and sub.DisbursementCheckerSubmissionCompleted = 1 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Checker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerDecision = 'Delete Workflow' then 'Delete Workflow Approved Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and sub.DisbursementMakerDecision = 'Approve' then 'Approved By Disbursement Maker'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0  and maker_rejected.arn is not null then 'Resubmission By Developer'
				when SolDisbursementHistory.arn is not null and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0 and isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0  and maker_rejected.arn is null then 'Submission By Developer'
				when SolDisbursementHistory.arn is null then 'Pending LA'
				end as [WFStatus],
				'Developer' as SubmissionFrom,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPADate else null end as SPADate,
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.SPAConstructionPeriodInMonths else null end as SPAConstructionPeriodInMonths,				
				case when SolDisbursementHistory.arn is not null and sub.DisbursementMakerSubmissionCompleted = 1 then sub.ExtendedConstructionPeriodInMonths else null end as ExtendedConstructionPeriodInMonths,								
				sub.ProjectSubmissionDate as [SubmissionDate],
				case when maker_rejected.arn is not null then maker_rejected.[DisbursementMakerSubmissionDate] else null end as [DisbursementMakerRejectionDate],
				case when SolDisbursementHistory.arn is not null and sub.ProjectSubmissionOption = 'Resubmission' then sub.ProjectSubmissionDate else null end as [DeveloperResubmissionDate],
				case when sub.DisbursementMakerDecision = 'Approve' and sub.DisbursementMakerSubmissionCompleted = 1 then stuff(		
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage3 = 1 then '3' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage4 = 1 then '4' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage5 = 1 then '5' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage6 = 1 then '6' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage7 = 1 then '7' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage8 = 1 then '8' else null end),     '') + 
				COALESCE(', ' +  RTRIM( case when sub.PR_Stage9 = 1 then '9' else null end),     '') + 
				COALESCE(', ' +  RTRIM( sub.[PR_StageOthers] ),     '') 
				, 1, 2, '') when isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0 then 
				stuff(		
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2AFlag] = 1 then '2/2A' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2BFlag] = 1 then '2B' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2CFlag] = 1 then '2C' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2DFlag] = 1 then '2D' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2EFlag] = 1 then '2E' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2FFlag] = 1 then '2F' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2GFlag] = 1 then '2G' else null end),     '') +
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2HFlag] = 1 then '2H' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2IFlag] = 1 then '2I' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2JFlag] = 1 then '2J' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.[PR_Stage2KFlag] = 1 then '2K' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage3 = 1 then '3' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage4 = 1 then '4' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage5 = 1 then '5' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage6 = 1 then '6' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage7 = 1 then '7' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage8 = 1 then '8' else null end),     '') + 
					COALESCE(', ' +  RTRIM( case when devsub_history.PR_Stage9 = 1 then '9' else null end),     '') + 
					COALESCE(', ' +  RTRIM( devsub_history.[PR_StageOthers] ),     '') 
					, 1, 2, '') 
				else null end as BillingStage 
				,case when sub.DisbursementMakerSubmissionCompleted = 1 then sub.PR_EarliestBillingDueDate when isnull(sub.DisbursementMakerSubmissionCompleted,0) = 0 then devsub_history.PR_EarliestBillingDueDate end as PR_EarliestBillingDueDate
				,devsub_history.BillingAmount 
				,DevSub_CurrentTotalDisbursedAmount.TotalDisbursedAmount as CurrentDisbursedAmount				
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then case when sub.FinalBillingFlag  = 1 then 'Yes' else 'No' end else 'N/A' end as [FinalBilling]
				--,sub.DisbursementMakerEmailAddress 
				,case when sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerEmailAddress else null end as DisbursementMakerEmailAddress
				,case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerDeletionDate]
				,case when sub.DisbursementMakerDecision = 'Approve' and sub.DisbursementMakerSubmissionCompleted = 1 then sub.DisbursementMakerSubmissionDate else null end as [DisbursementMakerApprovalDate]
				,case when sub.disbursementmakersubmissioncompleted = 1 then DATEDIFF(day, sub.ProjectSubmissionDate, sub.DisbursementMakerSubmissionDate) else DATEDIFF(day, sub.ProjectSubmissionDate, getdate()) end as [DisbursementMakerApprovalAgeing] 
				--,sub.DisbursementCheckerEmailAddress 
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerEmailAddress else null end as DisbursementCheckerEmailAddress
				,case when sub.DisbursementMakerDecision = 'Delete Worklow' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerDeletionDate]
				,case when sub.DisbursementCheckerDecision = 'Approve' and sub.DisbursementCheckerSubmissionCompleted = 1 then sub.DisbursementCheckerSubmissionDate else null end as [DisbursementCheckerApprovalDate]
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, sub.DisbursementCheckerSubmissionDate) when sub.DisbursementMakerSubmissionCompleted = 1 and isnull(sub.DisbursementCheckerSubmissionCompleted,0) = 0  then DATEDIFF(day, sub.DisbursementMakerSubmissionDate, getdate()) else null end as [DisbursementCheckerApprovalAgeing] 
				,case when sub.DisbursementCheckerSubmissionCompleted = 1 then DATEDIFF(day, sub.ProjectSubmissionDate, sub.DisbursementCheckerSubmissionDate)  else DATEDIFF(day, sub.ProjectSubmissionDate, getdate()) end as [DisbursementAgeing] 
				,ins_maker.TaskOwner as CurrentDisbursementMaker
				,ins_checker.TaskOwner as CurrentDisbursementChecker
		from vw_rpt_ddProjectDisbursementSubmission_DisMaker sub
			left join sqlloads on sqlloads.arn = sub.arn 
			left join ddProjectDisbursementSubmission_DisMaker_Rejected maker_rejected on maker_rejected.arn = sub.arn and maker_rejected.BillingRunningID = sub.BillingRunningID
			left join ddProjectDisbursementSubmission_SubmissionHistory2 devsub_history on devsub_history.arn = sub.arn and devsub_history.DraftID = sub.DraftID
			left join DevSub_CurrentTotalDisbursedAmount on DevSub_CurrentTotalDisbursedAmount.arn = sub.arn and sub.BillingRunningID = DevSub_CurrentTotalDisbursedAmount.billingRunningID
			left join cancelled on cancelled.arn = sub.arn 
			left join SolDisbursementHistory on SolDisbursementHistory.arn = sub.arn 
			left join ddProject_MortgageAppTaskInstance ins_maker on ins_maker.arn = sub.arn and ins_maker.BillingRunningID = sub.BillingRunningID and ins_maker.workflow = 'ProjectSubmission_DisMaker'
			left join ddProject_MortgageAppTaskInstance ins_checker on ins_checker.arn = sub.arn and ins_checker.BillingRunningID = sub.BillingRunningID and ins_checker.workflow = 'ProjectSubmission_DisChecker'
			left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
				left join ddProjectPhase on ddProjectPhase.PhaseCode = SQLLOADS.PhaseCode and ddProjectPhase.DeveloperCode = SQLLOADS.DeveloperCode
		where cancelled.arn is null 
			and sub.DisbursementCheckerSubmissionCompleted = 1
			and sub.DisbursementCheckerSubmissionDate between @ReportDateFrom and @ReportDateTo
			and sqlloads.MortgateCenterCode like case when @MortgageCentre is null then '%' else @MortgageCentre end 
			and sqlloads.DeveloperCode like case when @DeveloperCode is null then '%' else @DeveloperCode end 
			and sqlloads.PhaseCode like case when @PhaseCode is null then '%' else @PhaseCode end 			
			--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else DATEADD(day, 1, @BilllingDueDateTo) end
			--and sub.PR_EarliestBillingDueDate  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
			and isnull(sub.PR_EarliestBillingDueDate,'2000-01-01')  between case isnull(@BilllingDueDateFrom,'') when '' then '2000-01-01' else @BilllingDueDateFrom end and case isnull(@BilllingDueDateTo,'')  when '' then '2222-12-31' else @BilllingDueDateTo end
			and ddProjectDeveloper.Name like case when @DeveloperName is null then '%' else @DeveloperName end 
			and ddProjectPhase.PhaseName like case when @PhaseName is null then '%' else @PhaseName end 
		),				
		CTE2  (arn, BillingRunningID, WFStatus,SubmissionFrom,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker) as 
		(
			select DevSub.arn, DevSub.BillingRunningID, DevSub.WFStatus ,SubmissionFrom,SPADate,SPAConstructionPeriodInMonths,ExtendedConstructionPeriodInMonths,SubmissionDate,DisbursementMakerRejectionDate,DeveloperResubmissionDate,BillingStage,PR_EarliestBillingDueDate,BillingAmount,CurrentDisbursedAmount,FinalBilling,DisbursementMakerEmailAddress,DisbursementMakerDeletionDate,DisbursementMakerApprovalDate,DisbursementMakerApprovalAgeing,DisbursementCheckerEmailAddress,DisbursementCheckerDeletionDate,DisbursementCheckerApprovalDate,DisbursementCheckerApprovalAgeing,DisbursementAgeing,CurrentDisbursementMaker,CurrentDisbursementChecker
			from CTE DevSub
			--left join SolDisbursementHistory solsubhistory on solsubhistory.arn = DevSub.arn 
			--and solsubhistory.arn is not null 	
		),
		FirstReleaseDate (arn,DisCheckerApprovedDate) as 
		(
			select arn,min(DisCheckerApprovedDate) as DisCheckerApprovedDate
			from vw_aaDisbursementPaymentHistory
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn	
		),
		TotalDisbursedAmount (arn,TotalDisbursedAmount) as 
		(
			select arn,sum([AmountDisburse]) as TotalDisbursedAmount
			from vw_aaDisbursementPaymentHistory
			where   PaymentReference not in ('Legal Fee','Valuation Fee','Legal Fee - Principal Pymt','Valuation Fee - Principal Pymt','MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 				
			group by arn
		),
		
		history_completedStage (arn, PR_StageOthers,CompletedStage) as
		(		
			select tbl.arn, PR_StageOthers,CompletedStage = stuff(		
					COALESCE(', ' +  RTRIM( PR_Stage2AFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2BFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2CFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2DFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2EFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2FFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2GFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2HFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2IFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2JFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage2KFlag),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage3),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage4),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage5),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage6),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage7),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage8),     '') +
					COALESCE(', ' +  RTRIM( PR_Stage9),     '') 	
					--COALESCE(', ' +  RTRIM( [PR_StageOthers] ),     '') 
					, 1, 2, '')				
			from 
			(
			select arn, 	
				case when max(cast(isnull(PR_Stage2AFlag,0) as tinyint))  = 1 then '2/2a' else null end as PR_Stage2AFlag,
				case when max(cast(isnull(PR_Stage2BFlag,0) as tinyint))  = 1 then '2b' else null end as PR_Stage2BFlag,
				case when max(cast(isnull(PR_Stage2CFlag,0) as tinyint))  = 1 then '2c' else null end as PR_Stage2CFlag,
				case when max(cast(isnull(PR_Stage2DFlag,0) as tinyint))  = 1 then '2d' else null end as PR_Stage2DFlag,
				case when max(cast(isnull(PR_Stage2EFlag,0) as tinyint))  = 1 then '2e' else null end as PR_Stage2EFlag,
				case when max(cast(isnull(PR_Stage2FFlag,0) as tinyint))  = 1 then '2f' else null end as PR_Stage2FFlag,
				case when max(cast(isnull(PR_Stage2GFlag,0) as tinyint))  = 1 then '2g' else null end as PR_Stage2GFlag,
				case when max(cast(isnull(PR_Stage2HFlag,0) as tinyint))  = 1 then '2h' else null end as PR_Stage2HFlag,	 
				case when max(cast(isnull(PR_Stage2IFlag,0) as tinyint))  = 1 then '2i' else null end as PR_Stage2IFlag,
				case when max(cast(isnull(PR_Stage2JFlag,0) as tinyint))  = 1 then '2j' else null end as PR_Stage2JFlag,
				case when max(cast(isnull(PR_Stage2KFlag,0) as tinyint))  = 1 then '2k' else null end as PR_Stage2KFlag,
				case when max(cast(isnull(PR_Stage3,0) as tinyint))  = 1 then '3' else null end as PR_Stage3,
				case when max(cast(isnull(PR_Stage4,0) as tinyint))  = 1 then '4' else null end as PR_Stage4,
				case when max(cast(isnull(PR_Stage5,0) as tinyint))  = 1 then '5' else null end as PR_Stage5,
				case when max(cast(isnull(PR_Stage6,0) as tinyint))  = 1 then '6' else null end as PR_Stage6,
				case when max(cast(isnull(PR_Stage7,0) as tinyint))  = 1 then '7' else null end as PR_Stage7,
				case when max(cast(isnull(PR_Stage8,0) as tinyint))  = 1 then '8' else null end as PR_Stage8,
				case when max(cast(isnull(PR_Stage9,0) as tinyint))  = 1 then '9' else null end as PR_Stage9			
			from vw_aaDisbursementHistory
			group by arn
			) tbl 
			left join (SELECT arn, PR_StageOthers = dbo.tfn_CoalesceConcat_PR_StageOthers(arn)
			  FROM vw_aaDisbursementHistory
			  GROUP BY arn) others on others.arn = tbl.arn 		
		)	
		insert into ddProject_Report_ProgressiveBilling
		select SQLLOADS.MortgateCenterCode as [MortgageCentre],
			CTE2.arn as [CreditApplicationNumber],
			SQLLOADS.AddressLine1 as [Unit/Parcel No.],
			ddProjectDeveloper.[name] as [DeveloperName],
			SQLLOADS.DeveloperCode as [DeveloperCode],
			ddProjectPhase.PhaseName as [PhaseName],
			SQLLOADS.PhaseCode as [PhaseCode],
			--case when ddProjectPhase.SADAFlag  = 1 then 'Yes' else 'N/A' end as [SADAIndicator],
			case when isnull(ddProjectPhase.SADAFlag,0)  = 1 then 'Yes' else 'No' end as [SADAIndicator],
			SQLLOADS.SolicitorName as SolicitorName,
			SQLLOADS.SolicitorCode as SolicitorCode,
			SQLLOADS.SPAValue as [SPAPrice] ,			 
			FORMAT (CTE2.SPADate, 'dd/MM/yyyy') as [SPADate],
			SPAConstructionPeriodInMonths as [SPA Construction Period (months)],
			ExtendedConstructionPeriodInMonths as [Extended Construction Period (months)],
			SQLLOADS.TotalFinancingAmount as [TotalFacilityAmount],
			SQLLOADS.LoanAmount as [Total Financing Amount (exclude FLVM)],			 
			FORMAT (FirstReleaseDate.DisCheckerApprovedDate, 'dd/MM/yyyy HH:mm:ss') as [1st Payment (Release) Date],
			TotalDisbursedAmount.TotalDisbursedAmount,
			history_completedStage.CompletedStage + ',' + isnull(history_completedStage.PR_StageOthers,'') as [CompletedBilling],
			CTE2.SubmissionFrom as [SubmissionType],
			FORMAT (CTE2.SubmissionDate, 'dd/MM/yyyy HH:mm:ss') as [SubmissionDate],	
			CTE2.WFStatus,
			CTE2.DisbursementMakerRejectionDate,
			CTE2.DeveloperResubmissionDate,
			DisbursementAgeing,			
			CTE2.BillingStage,
			CTE2.PR_EarliestBillingDueDate as [BillingDueDate],
			CTE2.BillingAmount as [BillingAmount (by dev)],
			CTE2.CurrentDisbursedAmount as [DisbursedAmount],
			CTE2.FinalBilling,
			--CurrentDisbursementMaker,
			InternalUser_Maker.UserFullName as [DisbursementMakerName],	
			FORMAT (CTE2.DisbursementMakerDeletionDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementMakerDeletionDate	,	
			FORMAT (CTE2.DisbursementMakerApprovalDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementMakerApprovalDate	,							
			DisbursementMakerApprovalAgeing,
			--CurrentDisbursementChecker,
			InternalUser_Checker.UserFullName as [DisbursementCheckerName],				
			FORMAT (CTE2.DisbursementCheckerDeletionDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerDeletionDate	,	
			FORMAT (CTE2.DisbursementCheckerApprovalDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerApprovalDate	,										
			DisbursementCheckerApprovalAgeing,
			@reportuser as ReportUser
		from CTE2
			left join SQLLOADS on SQLLOADS.arn = CTE2.arn
			left join ddProjectDeveloper on ddProjectDeveloper.ID = SQLLOADS.DeveloperCode
			left join ddProjectPhase on SQLLOADS.PhaseCode = ddProjectPhase.PhaseCode 
				and SQLLOADS.ProjectCode = ddProjectPhase.ProjectCode 
				and SQLLOADS.DeveloperCode = ddProjectPhase.DeveloperCode 
			left join FirstReleaseDate on FirstReleaseDate.arn = SQLLOADS.arn
			left join TotalDisbursedAmount on TotalDisbursedAmount.arn = SQLLOADS.arn
			left join history_completedStage on history_completedStage.arn = SQLLOADS.arn			
			left join InternalUser InternalUser_Maker on InternalUser_Maker.UserName = CTE2.DisbursementMakerEmailAddress
			left join InternalUser InternalUser_Checker on InternalUser_Checker.UserName = CTE2.DisbursementMakerEmailAddress
		where CTE2.WFStatus like case when @Status is null then '%' else @Status end 		
	end 
	*/

	  
end