/*
select * from ddProjectDisbursementSubmission_DisMaker
where arn = 'izyan001'

update ddProjectDisbursementSubmission_DisMaker
set DisbursementMakerEmailAddress = 'workgroup\izyan'
where arn = 'izyan001'

go
*/

CREATE             procedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRecordByARN]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
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
		
		,devsub.[PR_DeveloperBillingDueDateFlag]
		,devsub.[PR_Stage2AFlag]
		,devsub.[PR_Stage2BFlag]
		,devsub.[PR_Stage2CFlag]
		,devsub.[PR_Stage2DFlag]
		,devsub.[PR_Stage2EFlag]
		,devsub.[PR_Stage2FFlag]
		,devsub.[PR_Stage2GFlag]
		,devsub.[PR_Stage2HFlag]
		,devsub.[PR_StageOthers]
		,devsub.[PR_EarliestBillingDueDate]		
		,devsub.[PR_TotalBillingAmount]
			
		,devsub.PR_AnyBridgingFinancierFlag as 'PR_AnyBridgingFinancierFlag'
		,devsub.[PR_BridgingFinancier] as 'PR_BridgingFinancier'
		,devsub.[PR_BridgingFinancierEmailAddress] as 'PR_BridgingFinancierEmailAddress'
		,devsub.[PR_BridgingFinancierRedemptionSum] as 'PR_BridgingFinancierRedemptionSum'
		, devsub.[PR_RedemptionPaymentAccountNumber]  as 'PR_RedemptionPaymentAccountNumber'
		, devsub.[PR_BeneficiaryBank]  as 'PR_BeneficiaryBank'
		, devsub.[PR_BridgingFinancierRedemptionExpiryDate]  as 'PR_BridgingFinancierRedemptionExpiryDate'
		--, devsub.[PR_DeveloperName]  as 'PR_DeveloperName'
		--, devsub.[PR_DeveloperEmailAddress]  as 'PR_DeveloperEmailAddress'
		, devsub.[PR_DeveloperPIC]  as 'PR_DeveloperPIC'
		, devsub.[PR_DeveloperHDA]  as 'PR_DeveloperHDA'
		, devsub.[PR_DeveloperHDABank]  as 'PR_DeveloperHDABank'

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

		--,devsub.[DisbursementMakerEmailAddress]
		,InternalUser.UserFullName as DisbursementMakerEmailAddress
		,devsub.[DisbursementMakerDecision]		
		,devsub.[DisbursementMakerSubmissionCompleted]
		,devsub.[DisbursementMakerRejectionReason]
		,devsub.[DisbursementMakerSubmissionDate]      
		,devsub.[DisbursementCheckerEmailAddress]
		,devsub.[DisbursementCheckerDecision]
		,devsub.[DisbursementCheckerSubmissionCompleted]
		,devsub.[DisbursementCheckerRejectionReason]
		,devsub.[DisbursementCheckerSubmissionDate]
		,devsub.[CreatedDate]
		,devsub.[UpdatedDate]	  
		 ,devsub.[DisbursementCheckerPDFID]
      ,devsub.[RCOMakerEmailAddress]
      ,devsub.[RCOMakerDecision]
      ,devsub.[RCOMakerSubmissionCompleted]
      ,devsub.[RCOMakerRejectionReason]
      ,devsub.[RCOMakerSubmissionDate]
      ,devsub.[RCOMakerPDFID]
      ,devsub.[RCOCheckerEmailAddress]
      ,devsub.[RCOCheckerDecision]
      ,devsub.[RCOCheckerSubmissionCompleted]
      ,devsub.[RCOCheckerRejectionReason]
      ,devsub.[RCOCheckerSubmissionDate]
      ,devsub.[RCOCheckerPDFID]	
	  --, case when rejected.arn is null then 0 else 1 end as 'RejectionStatus'	
	  , null as 'RejectionStatus'	

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
	  ,sqlloads.DeveloperName as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress
	  ,devsub.SPADate 
		,devsub.SPAConstructionPeriodInMonths
		,devsub.ExtendedConstructionPeriodInMonths 
		,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	FROM sqlloads 
		inner join [dbo].ddProjectDisbursementSubmission_DisMaker devsub on devsub.arn = sqlloads.arn 		
		left join ddProjectPhase phase on phase.PhaseCode = sqlloads.phasecode and phase.DeveloperCode = sqlloads.developercode and phase.projectcode = sqlloads.projectcode 
		left join ddProjectDeveloper Developer on  Developer.ID = sqlloads.developercode 
		--left join SQLSolicitorDPSubmission doc on doc.arn = devsub.arn 		
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 
					*/
		--left join aaIntDisbursementSubmission_RCOMakerRejected rejected on rejected.arn = intsub.arn and rejected.BillingRunningID = intsub.BillingRunningID
		left join InternalUser on InternalUser.UserName = devsub.DisbursementMakerEmailAddress
	where 
		devsub.arn =@arn 		
		and devsub.BillingRunningID= @billingid 
end