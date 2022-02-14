CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetRejected_ByARN]
@arn nvarchar(100) = null 
as
begin

	
	SELECT solsub.[arn]
		,solsub.[BalanceAdviceLetterApplicableFlag]
		,solsub.[UrgentFlag]
		,solsub.[LS_RedemptionDueDateFlag]
		,solsub.[LS_RedemptionDueDate]
		,solsub.[LS_ExtendedCompletionDateFlag]
		,solsub.[LS_CompletionDate]
		,solsub.[LS_ExtendedCompletionDate]
		,solsub.[PR_DeveloperBillingDueDateFlag]
		,solsub.[PR_Stage2AFlag]
		,solsub.[PR_Stage2BFlag]
		,solsub.[PR_Stage2CFlag]
		,solsub.[PR_Stage2DFlag]
		,solsub.[PR_Stage2EFlag]
		,solsub.[PR_Stage2FFlag]
		,solsub.[PR_Stage2GFlag]
		,solsub.[PR_Stage2HFlag]
		,solsub.[PR_StageOthers]
		,solsub.[PR_EarliestBillingDueDate]
		,solsub.[PR_TotalBillingAmount]
		,solsub.[PR_AnyBridgingFinancierFlag]
		,solsub.[PR_BridgingFinancier]
		,solsub.[PR_BridgingFinancierEmailAddress]
		,solsub.[PR_BridgingFinancierRedemptionSum]
		,solsub.[PR_RedemptionPaymentAccountNumber]
		,solsub.[PR_BeneficiaryBank]
		,solsub.[PR_BridgingFinancierRedemptionExpiryDate]
		--,solsub.[PR_DeveloperName]
		--,solsub.[PR_DeveloperEmailAddress]
		,solsub.[PR_DeveloperPIC]
		,solsub.[PR_DeveloperHDA]
		,solsub.[PR_DeveloperHDABank]
		,solsub.[LF_PayeeName]
		,solsub.[LF_BilledAmount]
		,solsub.[LF_AccountNumber]
		,solsub.[LF_Bank]
		,solsub.[LF_PaymentDescription]
		,solsub.[LF_PaymentMode]
		,solsub.[UpdateInfo_Reason]
		,solsub.[UpdateInfo_Others]
		,solsub.[CancelLoan_Remarks]
		,solsub.[CancelLoan_File]
		,solsub.[SolicitorSubmissionOption]
		,solsub.[SolicitorSubmissionCompleted]
		,solsub.[SolicitorCode]
		,solsub.[SolicitorSubmissionDate]
		,solsub.[SolicitorSubmissionPDFID]
		--,solsub.[DisbursementMakerEmailAddress]
		,InternalUser_maker.UserFullName as DisbursementMakerEmailAddress
		,solsub.[DisbursementMakerDecision]
		,solsub.[DisbursementMakerSubmissionCompleted]
		,solsub.[DisbursementMakerRejectionReason]
		,solsub.[DisbursementMakerSubmissionDate]
		,solsub.[DisbursementMakerSubmissionPDFID]
		--,solsub.[DisbursementCheckerEmailAddress]
		,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
		,solsub.[DisbursementCheckerDecision]
		,solsub.[DisbursementCheckerSubmissionCompleted]
		,solsub.[DisbursementCheckerRejectionReason]
		,solsub.[DisbursementCheckerSubmissionDate]
		,solsub.[DisbursementCheckerPDFID]
		,solsub.[RCOMakerEmailAddress]
      ,solsub.[RCOMakerDecision]
      ,solsub.[RCOMakerSubmissionCompleted]
      ,solsub.[RCOMakerRejectionReason]
      ,solsub.[RCOMakerSubmissionDate]
      ,solsub.[RCOMakerPDFID]
      ,solsub.[RCOCheckerEmailAddress]
      ,solsub.[RCOCheckerDecision]
      ,solsub.[RCOCheckerSubmissionCompleted]
      ,solsub.[RCOCheckerRejectionReason]
      ,solsub.[RCOCheckerSubmissionDate]
      ,solsub.[RCOCheckerPDFID]
		,solsub.[CreatedDate]
		,solsub.[UpdatedDate]
		, solsub.ProjectSubmissionOption
	  ,solsub.DeveloperCode
	  ,solsub.ProjectCode
	  ,solsub.PhaseCode
	  ,solsub.DeveloperLoginID
	  ,solsub.ProjectSubmissionDate
	  ,solsub.PR_Stage2IFlag
	  ,solsub.PR_Stage2JFlag
	  ,solsub.PR_Stage2KFlag
	  ,solsub.PR_Stage3
	  ,solsub.PR_Stage4
	  ,solsub.PR_Stage5
	  ,solsub.PR_Stage6
	  ,solsub.PR_Stage7
	  ,solsub.PR_Stage8
	  ,solsub.PR_Stage9
	  ,solsub.SadaFlag
	  ,solsub.ConfirmationOfArchitectFlag
	  ,solsub.ConfirmationOfArchitectRemark
	  ,solsub.FinalBillingFlag
	  ,phase.SADAFlag as DefaultSADAFlag	
	   ,Developer.[Name] as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress		  
		  ,solsub.SPADate
		  ,solsub.SPAConstructionPeriodInMonths
		  ,solsub.ExtendedConstructionPeriodInMonths
		,case when history.arn IS NOT NULL then 'Balance Advice' ELSE '1st Advice'  end as 'Disbursement Stage'		
		,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	FROM [dbo].[aaSolDisbursementSubmission_DisCheckerRejected] solsub
		left join aaSolDisbursementSubmission_History history on history.arn = solsub.arn and history.RunningIDForCompletedSubmission = 1
		  left join ddProjectPhase phase on phase.PhaseCode = solsub.phasecode and phase.DeveloperCode = solsub.developercode and phase.projectcode = solsub.projectcode 				
		left join ddProjectDeveloper Developer on  Developer.ID = solsub.developercode 
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = solsub.DisbursementCheckerEmailAddress
		left join InternalUser InternalUser_maker on InternalUser_maker.UserName = solsub.DisbursementMakerEmailAddress
	where solsub.arn = @arn 
end