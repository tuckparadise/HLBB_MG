--[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN] 'TAI/RB/2019/Z0002024'

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetRecordByARN]
@arn nvarchar(100) = null 
as
begin
	with cte1 (arn, firstRunningIDForCompletedSubmission,maxRunningIDForCompletedSubmission) as
	(
	select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission, max(RunningIDForCompletedSubmission) as maxRunningIDForCompletedSubmission
	from aaSolDisbursementSubmission_DisMakerSubmission_History
	group by arn 
	),
	cte2 (arn, firstRunningIDForCompletedSubmission, maxRunningIDForCompletedSubmission, BalanceAdviceLetterApplicableFlag) as 
	(
		select cte1.arn, cte1.firstRunningIDForCompletedSubmission, cte1.maxRunningIDForCompletedSubmission, h.BalanceAdviceLetterApplicableFlag
		from cte1
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
	)		
	SELECT 
		sqlloads.[arn], 
		isnull(dmakersub.[SolicitorSubmissionOption],'Submitted') as 'SolicitorSubmissionOption',
		case when cte2.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage',	

		--case when dmakersub.UrgentFlag is null then solsub.UrgentFlag else dmakersub.UrgentFlag end as 'UrgentFlag',
		--case when dmakersub.BalanceAdviceLetterApplicableFlag is null then solsub.BalanceAdviceLetterApplicableFlag else dmakersub.BalanceAdviceLetterApplicableFlag end as 'BalanceAdviceLetterApplicableFlag',
		--case when dmakersub.LS_RedemptionDueDateFlag is null then solsub.LS_RedemptionDueDateFlag else dmakersub.LS_RedemptionDueDateFlag end as 'LS_RedemptionDueDateFlag',
		--case when dmakersub.LS_RedemptionDueDate is null then solsub.LS_RedemptionDueDate else dmakersub.LS_RedemptionDueDate end as 'LS_RedemptionDueDate',
		--case when dmakersub.LS_ExtendedCompletionDateFlag is null then solsub.LS_ExtendedCompletionDateFlag else dmakersub.LS_ExtendedCompletionDateFlag end as 'LS_ExtendedCompletionDateFlag',
		dmakersub.UrgentFlag, 
		dmakersub.BalanceAdviceLetterApplicableFlag,
		dmakersub.LS_RedemptionDueDateFlag,
		dmakersub.LS_RedemptionDueDate,
		dmakersub.LS_ExtendedCompletionDateFlag,

		--case when dmakersub.LS_CompletionDate is null then solsub.LS_CompletionDate else dmakersub.LS_CompletionDate end as 'LS_CompletionDate',
		--case when dmakersub.LS_ExtendedCompletionDate is null then solsub.LS_ExtendedCompletionDate else dmakersub.LS_ExtendedCompletionDate end as 'LS_ExtendedCompletionDate',
		--case when dmakersub.PR_DeveloperBillingDueDateFlag is null then solsub.PR_DeveloperBillingDueDateFlag else dmakersub.PR_DeveloperBillingDueDateFlag end as 'PR_DeveloperBillingDueDateFlag',
		--case when dmakersub.PR_Stage2AFlag is null then solsub.PR_Stage2AFlag else dmakersub.PR_Stage2AFlag end as 'PR_Stage2AFlag',
		--case when dmakersub.PR_Stage2BFlag is null then solsub.PR_Stage2BFlag else dmakersub.PR_Stage2BFlag end as 'PR_Stage2BFlag',
		dmakersub.LS_CompletionDate,
		dmakersub.LS_ExtendedCompletionDate,
		dmakersub.PR_DeveloperBillingDueDateFlag,
		dmakersub.PR_Stage2AFlag,
		dmakersub.PR_Stage2BFlag,

		--case when dmakersub.PR_Stage2CFlag is null then solsub.PR_Stage2CFlag else dmakersub.PR_Stage2CFlag end as 'PR_Stage2CFlag',
		--case when dmakersub.PR_Stage2DFlag is null then solsub.PR_Stage2DFlag else dmakersub.PR_Stage2DFlag end as 'PR_Stage2DFlag',
		--case when dmakersub.PR_Stage2EFlag is null then solsub.PR_Stage2EFlag else dmakersub.PR_Stage2EFlag end as 'PR_Stage2EFlag',
		--case when dmakersub.PR_Stage2FFlag is null then solsub.PR_Stage2FFlag else dmakersub.PR_Stage2FFlag end as 'PR_Stage2FFlag',
		--case when dmakersub.PR_Stage2GFlag is null then solsub.PR_Stage2GFlag else dmakersub.PR_Stage2GFlag end as 'PR_Stage2GFlag',
		dmakersub.PR_Stage2CFlag,
		dmakersub.PR_Stage2DFlag,
		dmakersub.PR_Stage2EFlag,
		dmakersub.PR_Stage2FFlag,
		dmakersub.PR_Stage2GFlag,

		--case when dmakersub.PR_Stage2HFlag is null then solsub.PR_Stage2HFlag else dmakersub.PR_Stage2HFlag end as 'PR_Stage2HFlag',
		--case when dmakersub.PR_StageOthers is null then solsub.PR_StageOthers else dmakersub.PR_StageOthers end as 'PR_StageOthers',
		--case when dmakersub.PR_EarliestBillingDueDate is null then solsub.PR_EarliestBillingDueDate else dmakersub.PR_EarliestBillingDueDate end as 'PR_EarliestBillingDueDate',
		--case when dmakersub.PR_TotalBillingAmount is null then solsub.PR_TotalBillingAmount else dmakersub.PR_TotalBillingAmount end as 'PR_TotalBillingAmount',
		--case when dmakersub.PR_AnyBridgingFinancierFlag is null then solsub.PR_AnyBridgingFinancierFlag else dmakersub.PR_AnyBridgingFinancierFlag end as 'PR_AnyBridgingFinancierFlag',
		dmakersub.PR_Stage2HFlag,
		dmakersub.PR_StageOthers,
		dmakersub.PR_EarliestBillingDueDate,
		dmakersub.PR_TotalBillingAmount,
		dmakersub.PR_AnyBridgingFinancierFlag,

		--case when dmakersub.PR_BridgingFinancier is null then solsub.PR_BridgingFinancier else dmakersub.PR_BridgingFinancier end as 'PR_BridgingFinancier',
		--case when dmakersub.PR_BridgingFinancierEmailAddress is null then solsub.PR_BridgingFinancierEmailAddress else dmakersub.PR_BridgingFinancierEmailAddress end as 'PR_BridgingFinancierEmailAddress',
		--case when dmakersub.PR_BridgingFinancierRedemptionSum is null then solsub.PR_BridgingFinancierRedemptionSum else dmakersub.PR_BridgingFinancierRedemptionSum end as 'PR_BridgingFinancierRedemptionSum',
		--case when dmakersub.PR_RedemptionPaymentAccountNumber is null then solsub.PR_RedemptionPaymentAccountNumber else dmakersub.PR_RedemptionPaymentAccountNumber end as 'PR_RedemptionPaymentAccountNumber',
		--case when dmakersub.PR_BeneficiaryBank is null then solsub.PR_BeneficiaryBank else dmakersub.PR_BeneficiaryBank end as 'PR_BeneficiaryBank',
		dmakersub.PR_BridgingFinancier,
		dmakersub.PR_BridgingFinancierEmailAddress,
		dmakersub.PR_BridgingFinancierRedemptionSum,
		dmakersub.PR_RedemptionPaymentAccountNumber,
		dmakersub.PR_BeneficiaryBank,

		--case when dmakersub.PR_BridgingFinancierRedemptionExpiryDate is null then solsub.PR_BridgingFinancierRedemptionExpiryDate else dmakersub.PR_BridgingFinancierRedemptionExpiryDate end as 'PR_BridgingFinancierRedemptionExpiryDate',
		--case when dmakersub.PR_DeveloperName is null then solsub.PR_DeveloperName else dmakersub.PR_DeveloperName end as 'PR_DeveloperName',
		--case when dmakersub.PR_DeveloperEmailAddress is null then solsub.PR_DeveloperEmailAddress else dmakersub.PR_DeveloperEmailAddress end as 'PR_DeveloperEmailAddress',
		--case when dmakersub.PR_DeveloperPIC is null then solsub.PR_DeveloperPIC else dmakersub.PR_DeveloperPIC end as 'PR_DeveloperPIC',
		--case when dmakersub.PR_DeveloperHDA is null then solsub.PR_DeveloperHDA else dmakersub.PR_DeveloperHDA end as 'PR_DeveloperHDA',
		dmakersub.PR_BridgingFinancierRedemptionExpiryDate,
		--dmakersub.PR_DeveloperName, 
		--dmakersub.PR_DeveloperEmailAddress,
		dmakersub.PR_DeveloperPIC,
		dmakersub.PR_DeveloperHDA,

		--case when dmakersub.PR_DeveloperHDABank is null then solsub.PR_DeveloperHDABank else dmakersub.PR_DeveloperHDABank end as 'PR_DeveloperHDABank',
		--case when dmakersub.LF_PayeeName is null then solsub.LF_PayeeName else dmakersub.LF_PayeeName end as 'LF_PayeeName',
		--case when dmakersub.LF_BilledAmount is null then solsub.LF_BilledAmount else dmakersub.LF_BilledAmount end as 'LF_BilledAmount',
		--case when dmakersub.LF_AccountNumber is null then solsub.LF_AccountNumber else dmakersub.LF_AccountNumber end as 'LF_AccountNumber',
		--case when dmakersub.LF_Bank is null then solsub.LF_Bank else dmakersub.LF_Bank end as 'LF_Bank',
		dmakersub.PR_DeveloperHDABank,
		dmakersub.LF_PayeeName,
		dmakersub.LF_BilledAmount,
		dmakersub.LF_AccountNumber,
		dmakersub.LF_Bank,

		--case when dmakersub.LF_PaymentDescription is null then solsub.LF_PaymentDescription else dmakersub.LF_PaymentDescription end as 'LF_PaymentDescription',
		--case when dmakersub.LF_PaymentMode is null then solsub.LF_PaymentMode else dmakersub.LF_PaymentMode end as 'LF_PaymentMode',		
		dmakersub.LF_PaymentDescription,
		dmakersub.LF_PaymentMode,

		isnull(dmakersub.[UpdateInfo_Reason],'Others') as 'UpdateInfo_Reason'
		,dmakersub.[UpdateInfo_Others]
		,dmakersub.[CancelLoan_Remarks]
		,dmakersub.[CancelLoan_File]     
		,dmakersub.[SolicitorSubmissionCompleted]
		,dmakersub.[SolicitorCode]
		,dmakersub.[SolicitorSubmissionDate]   
	--	 ,solsub.[DisbursementMakerEmailAddress]
      --,solsub.[DisbursementMakerDecision]
     -- ,solsub.[DisbursementMakerSubmissionCompleted]
     -- ,solsub.[DisbursementMakerRejectionReason]
     -- ,solsub.[DisbursementMakerSubmissionDate]      
	  ,case when isnull(dmakersub.DisbursementMakerEmailAddress,'') ='' then RejectNoteForSolicitor.DisbursementMakerEmailAddress else dmakersub.DisbursementMakerEmailAddress end as DisbursementMakerEmailAddress 
	  ,case when isnull(dmakersub.DisbursementMakerDecision,'') ='' then RejectNoteForSolicitor.DisbursementMakerDecision else dmakersub.DisbursementMakerDecision end as DisbursementMakerDecision 
	  ,case when isnull(dmakersub.DisbursementMakerSubmissionCompleted,'') ='' then RejectNoteForSolicitor.DisbursementMakerSubmissionCompleted else dmakersub.DisbursementMakerSubmissionCompleted end as DisbursementMakerSubmissionCompleted 
	  ,case when isnull(dmakersub.DisbursementMakerRejectionReason,'') ='' then RejectNoteForSolicitor.DisbursementMakerRejectionReason else dmakersub.DisbursementMakerRejectionReason end as DisbursementMakerRejectionReason 
	  ,case when isnull(dmakersub.DisbursementMakerSubmissionDate,'') ='' then RejectNoteForSolicitor.DisbursementMakerSubmissionDate else dmakersub.DisbursementMakerSubmissionDate end as DisbursementMakerSubmissionDate 
      --,rejected.[DisbursementCheckerEmailAddress]
	  ,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
      ,rejected.[DisbursementCheckerDecision]
      ,rejected.[DisbursementCheckerSubmissionCompleted]
      ,rejected.[DisbursementCheckerRejectionReason]
      ,rejected.[DisbursementCheckerSubmissionDate]
      ,dmakersub.[CreatedDate]
      ,dmakersub.[UpdatedDate]	  
	  , case when rejected.arn is null then 0 else 1 end as 'RejectionStatus'
	  --, rejected.DisbursementCheckerRejectionReason 	  
	    , dmakersub.ProjectSubmissionOption
	  ,dmakersub.DeveloperCode
	  ,dmakersub.ProjectCode
	  ,dmakersub.PhaseCode
	  ,dmakersub.DeveloperLoginID
	  ,dmakersub.ProjectSubmissionDate
	  ,dmakersub.PR_Stage2IFlag
	  ,dmakersub.PR_Stage2JFlag
	  ,dmakersub.PR_Stage2KFlag
	  ,dmakersub.PR_Stage3
	  ,dmakersub.PR_Stage4
	  ,dmakersub.PR_Stage5
	  ,dmakersub.PR_Stage6
	  ,dmakersub.PR_Stage7
	  ,dmakersub.PR_Stage8
	  ,dmakersub.PR_Stage9
	  ,dmakersub.SadaFlag
	  ,dmakersub.ConfirmationOfArchitectFlag
	  ,dmakersub.ConfirmationOfArchitectRemark
	  ,dmakersub.FinalBillingFlag
	  ,phase.SADAFlag as DefaultSADAFlag	
	   ,Developer.[Name] as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress
	  	  ,dmakersub.SPADate 
		,dmakersub.SPAConstructionPeriodInMonths
		,dmakersub.ExtendedConstructionPeriodInMonths 
		,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	FROM sqlloads 
		inner join [dbo].aaSolDisbursementSubmission_DisMakerSubmission dmakersub on dmakersub.arn = sqlloads.arn 
		left join SQLSolicitorDPSubmission doc on doc.arn = dmakersub.arn 
		--left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1
		left join cte2 on cte2.arn = dmakersub.arn 
		left join aaSolDisbursementSubmission_DisCheckerRejected rejected on rejected.arn = dmakersub.arn 
		left join [dbo].aaSolDisbursementSubmission_DisMakerRejected RejectNoteForSolicitor on RejectNoteForSolicitor.arn = sqlloads.arn 
		left join aaSolDisbursementSubmission_DisMakerSubmission_History history on history.arn = cte2.arn and history.RunningIDForCompletedSubmission = cte2.maxRunningIDForCompletedSubmission		
		--left join [dbo].aaSolDisbursementSubmission solsub on solsub.arn = sqlloads.arn 
		left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 				
		left join ddProjectDeveloper Developer on  Developer.ID = sqlloads.developercode 
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = rejected.DisbursementCheckerEmailAddress
	where 
	sqlloads.arn =@arn 
end