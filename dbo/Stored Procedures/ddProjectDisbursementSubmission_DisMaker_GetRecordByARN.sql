CREATE           procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetRecordByARN]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	with cte1 (arn, firstRunningIDForCompletedSubmission,maxRunningIDForCompletedSubmission) as
	(
		select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission
		from aaSolDisbursementSubmission_DisMakerSubmission_History	
		where arn = @arn 
		group by arn 
	)		
	SELECT 
		sqlloads.[arn], 		
		null as 'SolicitorSubmissionOption',		
		'Billing'  as 'Disbursement Stage',
		null as [UrgentFlag], 				
		null as 'BalanceAdviceLetterApplicableFlag',      
		 null as [LS_RedemptionDueDateFlag]
		, null as [LS_RedemptionDueDate]
		,null as [LS_ExtendedCompletionDateFlag]
		,null as 'LS_CompletionDate'
		,null as 'LS_ExtendedCompletionDate'	
		,devsub.PR_DeveloperBillingDueDateFlag
		,devsub.PR_Stage2AFlag
		,devsub.PR_Stage2BFlag
		,devsub.PR_Stage2CFlag
		,devsub.PR_Stage2DFlag
		,devsub.PR_Stage2EFlag
		,devsub.PR_Stage2FFlag
		,devsub.PR_Stage2GFlag
		,devsub.PR_Stage2HFlag
		,devsub.PR_StageOthers
		,devsub.PR_EarliestBillingDueDate
		,devsub.PR_TotalBillingAmount

		/*
		,null as LF_PayeeName
		,null as LF_BilledAmount
		,null as [LF_AccountNumber]
		,null as [LF_Bank]
		,null as [LF_PaymentDescription]
		,null as LF_PaymentMode
		,null as UpdateInfo_Reason
		,null as UpdateInfo_Others		
		,null as [CancelLoan_Remarks]
		,null as [CancelLoan_File]
		,null as [SolicitorSubmissionCompleted]
		,null as [SolicitorCode]
		,null as [SolicitorSubmissionDate]
		*/
		,devsub.[DisbursementMakerEmailAddress] as [DisbursementMakerEmailAddress]
		,devsub.[DisbursementMakerDecision] as [DisbursementMakerDecision]
		,devsub.[DisbursementMakerSubmissionCompleted] as [DisbursementMakerSubmissionCompleted]
		,devsub.[DisbursementMakerRejectionReason] as [DisbursementMakerRejectionReason]
		,devsub.[DisbursementMakerSubmissionDate] as [DisbursementMakerSubmissionDate]
		--,c_rejected.DisbursementCheckerEmailAddress as [DisbursementCheckerEmailAddress]
		,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
		,c_rejected.DisbursementCheckerDecision as [DisbursementCheckerDecision]		
		,c_rejected.DisbursementCheckerSubmissionCompleted as [DisbursementCheckerSubmissionCompleted]
		,c_rejected.DisbursementCheckerRejectionReason as [DisbursementCheckerRejectionReason]
		,c_rejected.DisbursementCheckerSubmissionDate as [DisbursementCheckerSubmissionDate]	      
      ,devsub.[CreatedDate]
      ,devsub.[UpdatedDate]	  	
	  , case when c_rejected.arn is null then 0 else 1 end as 'RejectionStatus'
	  , devsub.ProjectSubmissionOption
	  ,devsub.DeveloperCode
	  ,devsub.ProjectCode
	  ,devsub.PhaseCode
	  ,devsub.DeveloperLoginID
	  ,devsub.ProjectSubmissionDate
	  ,devsub.PR_Stage2IFlag
	  ,devsub.PR_Stage2JFlag
	  ,devsub.PR_Stage2KFlag
	  ,devsub.PR_Stage3
	  ,devsub.PR_Stage4
	  ,devsub.PR_Stage5
	  ,devsub.PR_Stage6
	  ,devsub.PR_Stage7
	  ,devsub.PR_Stage8
	  ,devsub.PR_Stage9
	  ,devsub.SadaFlag
	  ,devsub.ConfirmationOfArchitectFlag
	  ,devsub.ConfirmationOfArchitectRemark
	  ,devsub.FinalBillingFlag
	  ,phase.SADAFlag as DefaultSADAFlag	  
		,case when devsub.[PR_AnyBridgingFinancierFlag] is not null then devsub.[PR_AnyBridgingFinancierFlag] else history.[PR_AnyBridgingFinancierFlag] end as 'PR_AnyBridgingFinancierFlag'				
		,case when devsub.[PR_BridgingFinancier] is not null then devsub.[PR_BridgingFinancier] else history.[PR_BridgingFinancier] end as 'PR_BridgingFinancier'		
		,case when devsub.[PR_BridgingFinancierEmailAddress] is not null then devsub.[PR_BridgingFinancierEmailAddress] else history.[PR_BridgingFinancierEmailAddress] end as 'PR_BridgingFinancierEmailAddress'		
		,case when devsub.[PR_BridgingFinancierRedemptionSum] is not null then devsub.[PR_BridgingFinancierRedemptionSum] else history.[PR_BridgingFinancierRedemptionSum] end as 'PR_BridgingFinancierRedemptionSum'		
		,case when devsub.[PR_RedemptionPaymentAccountNumber] is not null then devsub.[PR_RedemptionPaymentAccountNumber] else history.[PR_RedemptionPaymentAccountNumber] end as 'PR_RedemptionPaymentAccountNumber'		
		,case when devsub.[PR_BeneficiaryBank] is not null then devsub.[PR_BeneficiaryBank] else history.[PR_BeneficiaryBank] end as 'PR_BeneficiaryBank'		
		,case when devsub.[PR_BridgingFinancierRedemptionExpiryDate] is not null then devsub.[PR_BridgingFinancierRedemptionExpiryDate] else history.[PR_BridgingFinancierRedemptionExpiryDate] end as 'PR_BridgingFinancierRedemptionExpiryDate'		
		--,case when devsub.[PR_DeveloperName] is not null then devsub.[PR_DeveloperName] else history.[PR_DeveloperName] end as 'PR_DeveloperName'		
		--,case when devsub.[PR_DeveloperEmailAddress] is not null then devsub.[PR_DeveloperEmailAddress] else history.[PR_DeveloperEmailAddress] end as 'PR_DeveloperEmailAddress'		
		,case when devsub.PR_DeveloperPIC is not null then devsub.PR_DeveloperPIC else history.PR_DeveloperPIC end as 'PR_DeveloperPIC'		
		,case when devsub.PR_DeveloperHDA is not null then devsub.PR_DeveloperHDA else history.PR_DeveloperHDA end as 'PR_DeveloperHDA'		
		,case when devsub.PR_DeveloperHDABank is not null then devsub.PR_DeveloperHDABank else history.PR_DeveloperHDABank end as 'PR_DeveloperHDABank'		
		 ,Developer.[Name] as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress
	  ,devsub.SPADate
	  ,devsub.SPAConstructionPeriodInMonths
	  ,devsub.ExtendedConstructionPeriodInMonths
	  ,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	FROM sqlloads 
		inner join [dbo].ddProjectDisbursementSubmission_DisMaker devsub on devsub.arn = sqlloads.arn 		
		left join SQLSolicitorDPSubmission doc on doc.arn = devsub.arn 		
		left join cte1 on cte1.arn = sqlloads.arn 
		left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte1.arn and history.RunningIDForCompletedSubmission = cte1.maxRunningIDForCompletedSubmission						
		left join ddProjectDisbursementSubmission_DisCheckerRejected c_rejected on c_rejected.arn = devsub.arn and c_rejected.BillingRunningID = devsub.BillingRunningID
		left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 
		left join ddProjectDeveloper Developer on  Developer.ID = sqlloads.developercode 
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = c_rejected.DisbursementCheckerEmailAddress
	where 
		devsub.arn =@arn 	
		and devsub.BillingRunningID= @billingid 	
end