CREATE             procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetRecordByARN]
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
		/* 20220107 - change the value of the default PR tab to blank 
		,case when intsub.PR_DeveloperBillingDueDateFlag is not null then intsub.PR_DeveloperBillingDueDateFlag else history.PR_DeveloperBillingDueDateFlag end as 'PR_DeveloperBillingDueDateFlag'
		,case when intsub.[PR_Stage2AFlag] is not null then intsub.[PR_Stage2AFlag] else history.[PR_Stage2AFlag] end as 'PR_Stage2AFlag'
		,case when intsub.[PR_Stage2BFlag] is not null then intsub.[PR_Stage2BFlag] else history.[PR_Stage2BFlag] end as 'PR_Stage2BFlag'
		,case when intsub.[PR_Stage2CFlag] is not null then intsub.[PR_Stage2CFlag] else history.[PR_Stage2CFlag] end as 'PR_Stage2CFlag'
		,case when intsub.[PR_Stage2DFlag] is not null then intsub.[PR_Stage2DFlag] else history.[PR_Stage2DFlag] end as 'PR_Stage2DFlag'
		,case when intsub.[PR_Stage2EFlag] is not null then intsub.[PR_Stage2EFlag] else history.[PR_Stage2EFlag] end as 'PR_Stage2EFlag'
		,case when intsub.[PR_Stage2FFlag] is not null then intsub.[PR_Stage2FFlag] else history.[PR_Stage2FFlag] end as 'PR_Stage2FFlag'
		,case when intsub.[PR_Stage2GFlag] is not null then intsub.[PR_Stage2GFlag] else history.[PR_Stage2GFlag] end as 'PR_Stage2GFlag'
		,case when intsub.[PR_Stage2HFlag] is not null then intsub.[PR_Stage2HFlag] else history.[PR_Stage2HFlag] end as 'PR_Stage2HFlag'		
		,case when intsub.[PR_StageOthers] is not null then intsub.[PR_StageOthers] else history.[PR_StageOthers] end as 'PR_StageOthers'				
		,case when intsub.PR_EarliestBillingDueDate is not null then intsub.PR_EarliestBillingDueDate else history.PR_EarliestBillingDueDate end as 'PR_EarliestBillingDueDate'
		,case when intsub.[PR_TotalBillingAmount] is not null then intsub.[PR_TotalBillingAmount] else history.[PR_TotalBillingAmount] end as 'PR_TotalBillingAmount'		
		*/
		,intsub.PR_DeveloperBillingDueDateFlag
		,intsub.[PR_Stage2AFlag]
		,intsub.[PR_Stage2BFlag] 
		,intsub.[PR_Stage2CFlag]
		,intsub.[PR_Stage2DFlag]
		,intsub.[PR_Stage2EFlag]
		,intsub.[PR_Stage2FFlag]
		,intsub.[PR_Stage2GFlag]
		,intsub.[PR_Stage2HFlag]
		,intsub.[PR_StageOthers]
		,intsub.PR_EarliestBillingDueDate
		,intsub.[PR_TotalBillingAmount]

		,case when intsub.[PR_AnyBridgingFinancierFlag] is not null then intsub.[PR_AnyBridgingFinancierFlag] else history.[PR_AnyBridgingFinancierFlag] end as 'PR_AnyBridgingFinancierFlag'				
		,case when intsub.[PR_BridgingFinancier] is not null then intsub.[PR_BridgingFinancier] else history.[PR_BridgingFinancier] end as 'PR_BridgingFinancier'		
		,case when intsub.[PR_BridgingFinancierEmailAddress] is not null then intsub.[PR_BridgingFinancierEmailAddress] else history.[PR_BridgingFinancierEmailAddress] end as 'PR_BridgingFinancierEmailAddress'		
		,case when intsub.[PR_BridgingFinancierRedemptionSum] is not null then intsub.[PR_BridgingFinancierRedemptionSum] else history.[PR_BridgingFinancierRedemptionSum] end as 'PR_BridgingFinancierRedemptionSum'		
		,case when intsub.[PR_RedemptionPaymentAccountNumber] is not null then intsub.[PR_RedemptionPaymentAccountNumber] else history.[PR_RedemptionPaymentAccountNumber] end as 'PR_RedemptionPaymentAccountNumber'		
		,case when intsub.[PR_BeneficiaryBank] is not null then intsub.[PR_BeneficiaryBank] else history.[PR_BeneficiaryBank] end as 'PR_BeneficiaryBank'		
		,case when intsub.[PR_BridgingFinancierRedemptionExpiryDate] is not null then intsub.[PR_BridgingFinancierRedemptionExpiryDate] else history.[PR_BridgingFinancierRedemptionExpiryDate] end as 'PR_BridgingFinancierRedemptionExpiryDate'		
		--,case when intsub.[PR_DeveloperName] is not null then intsub.[PR_DeveloperName] else history.[PR_DeveloperName] end as 'PR_DeveloperName'		
		--,case when intsub.[PR_DeveloperEmailAddress] is not null then intsub.[PR_DeveloperEmailAddress] else history.[PR_DeveloperEmailAddress] end as 'PR_DeveloperEmailAddress'		
		,case when intsub.PR_DeveloperPIC is not null then intsub.PR_DeveloperPIC else history.PR_DeveloperPIC end as 'PR_DeveloperPIC'		
		,case when intsub.PR_DeveloperHDA is not null then intsub.PR_DeveloperHDA else history.PR_DeveloperHDA end as 'PR_DeveloperHDA'		
		,case when intsub.PR_DeveloperHDABank is not null then intsub.PR_DeveloperHDABank else history.PR_DeveloperHDABank end as 'PR_DeveloperHDABank'		

		/*
		, isnull(solsubhistory.[PR_AnyBridgingFinancierFlag],cast(1 as bit)) as 'PR_AnyBridgingFinancierFlag'
		,solsubhistory.[PR_BridgingFinancier] as 'PR_BridgingFinancier'
		,solsubhistory.[PR_BridgingFinancierEmailAddress] as 'PR_BridgingFinancierEmailAddress'
		,solsubhistory.[PR_BridgingFinancierRedemptionSum] as 'PR_BridgingFinancierRedemptionSum'
		, solsubhistory.[PR_RedemptionPaymentAccountNumber]  as 'PR_RedemptionPaymentAccountNumber'
		, solsubhistory.[PR_BeneficiaryBank]  as 'PR_BeneficiaryBank'
		, solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate]  as 'PR_BridgingFinancierRedemptionExpiryDate'
		, solsubhistory.[PR_DeveloperName]  as 'PR_DeveloperName'
		, solsubhistory.[PR_DeveloperEmailAddress]  as 'PR_DeveloperEmailAddress'
		, solsubhistory.[PR_DeveloperPIC]  as 'PR_DeveloperPIC'
		, solsubhistory.[PR_DeveloperPIC]  as 'PR_DeveloperHDA'
		, solsubhistory.[PR_DeveloperHDABank]  as 'PR_DeveloperHDABank'
		*/
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
		,intsub.SolicitorSubmissionDate as [SolicitorSubmissionDate]
		,intsub.[DisbursementMakerEmailAddress] as [DisbursementMakerEmailAddress]
		,intsub.[DisbursementMakerDecision] as [DisbursementMakerDecision]
		,intsub.[DisbursementMakerSubmissionCompleted] as [DisbursementMakerSubmissionCompleted]
		,intsub.[DisbursementMakerRejectionReason] as [DisbursementMakerRejectionReason]
		,intsub.[DisbursementMakerSubmissionDate] as [DisbursementMakerSubmissionDate]
		--,rejected.DisbursementCheckerEmailAddress as [DisbursementCheckerEmailAddress]
		,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
		,rejected.DisbursementCheckerDecision as [DisbursementCheckerDecision]		
		,rejected.DisbursementCheckerSubmissionCompleted as [DisbursementCheckerSubmissionCompleted]
		,rejected.DisbursementCheckerRejectionReason as [DisbursementCheckerRejectionReason]
		,rejected.DisbursementCheckerSubmissionDate as [DisbursementCheckerSubmissionDate]	      
      ,intsub.[CreatedDate]
      ,intsub.[UpdatedDate]	  	
	  , case when rejected.arn is null then 0 else 1 end as 'RejectionStatus'
	   , intsub.ProjectSubmissionOption
	  ,intsub.DeveloperCode
	  ,intsub.ProjectCode
	  ,intsub.PhaseCode
	  ,intsub.DeveloperLoginID
	  ,intsub.ProjectSubmissionDate

	  ,intsub.PR_Stage2IFlag
	  ,intsub.PR_Stage2JFlag
	  ,intsub.PR_Stage2KFlag
	  ,intsub.PR_Stage3
	  ,intsub.PR_Stage4
	  ,intsub.PR_Stage5
	  ,intsub.PR_Stage6
	  ,intsub.PR_Stage7
	  ,intsub.PR_Stage8
	  ,intsub.PR_Stage9
	  ,intsub.SadaFlag
	  ,intsub.ConfirmationOfArchitectFlag
	  ,intsub.ConfirmationOfArchitectRemark
	  ,intsub.FinalBillingFlag

	  ,phase.SADAFlag as DefaultSADAFlag	

	   ,Developer.[Name] as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress

	  ,intsub.SPADate 
		,intsub.SPAConstructionPeriodInMonths
		,intsub.ExtendedConstructionPeriodInMonths 
		,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	FROM sqlloads 
		inner join [dbo].[aaIntDisbursementSubmission] intsub on intsub.arn = sqlloads.arn 		
		left join SQLSolicitorDPSubmission doc on doc.arn = intsub.arn 		
		left join cte1 on cte1.arn = sqlloads.arn 
		left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte1.arn and history.RunningIDForCompletedSubmission = cte1.maxRunningIDForCompletedSubmission				
		left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
		left join ddProjectDeveloper Developer on  Developer.ID = sqlloads.developercode 
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 	
		*/
		left join aaIntDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = intsub.arn and rejected.BillingRunningID = intsub.BillingRunningID
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = rejected.DisbursementCheckerEmailAddress

	where 
		intsub.arn =@arn 	and intsub.BillingRunningID= @billingid 	
end