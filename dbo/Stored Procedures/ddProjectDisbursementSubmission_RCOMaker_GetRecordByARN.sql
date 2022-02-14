﻿CREATE             procedure [dbo].[ddProjectDisbursementSubmission_RCOMaker_GetRecordByARN]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	SELECT 
		[arn], 		
		null as 'SolicitorSubmissionOption',		
		'Billing'  as 'Disbursement Stage',
		null as [UrgentFlag], 				
		null as 'BalanceAdviceLetterApplicableFlag',      
		 null as [LS_RedemptionDueDateFlag]
		, null as [LS_RedemptionDueDate]
		,null as [LS_ExtendedCompletionDateFlag]
		,null as 'LS_CompletionDate'
		,null as 'LS_ExtendedCompletionDate'	
		
		,intsub.[PR_DeveloperBillingDueDateFlag]
		,intsub.[PR_Stage2AFlag]
		,intsub.[PR_Stage2BFlag]
		,intsub.[PR_Stage2CFlag]
		,intsub.[PR_Stage2DFlag]
		,intsub.[PR_Stage2EFlag]
		,intsub.[PR_Stage2FFlag]
		,intsub.[PR_Stage2GFlag]
		,intsub.[PR_Stage2HFlag]
		,intsub.[PR_StageOthers]
		,intsub.[PR_EarliestBillingDueDate]		
		,intsub.[PR_TotalBillingAmount]
			
		,intsub.PR_AnyBridgingFinancierFlag as 'PR_AnyBridgingFinancierFlag'
		,intsub.[PR_BridgingFinancier] as 'PR_BridgingFinancier'
		,intsub.[PR_BridgingFinancierEmailAddress] as 'PR_BridgingFinancierEmailAddress'
		,intsub.[PR_BridgingFinancierRedemptionSum] as 'PR_BridgingFinancierRedemptionSum'
		, intsub.[PR_RedemptionPaymentAccountNumber]  as 'PR_RedemptionPaymentAccountNumber'
		, intsub.[PR_BeneficiaryBank]  as 'PR_BeneficiaryBank'
		, intsub.[PR_BridgingFinancierRedemptionExpiryDate]  as 'PR_BridgingFinancierRedemptionExpiryDate'
		, intsub.[PR_DeveloperName]  as 'PR_DeveloperName'
		, intsub.[PR_DeveloperEmailAddress]  as 'PR_DeveloperEmailAddress'
		, intsub.[PR_DeveloperPIC]  as 'PR_DeveloperPIC'
		, intsub.[PR_DeveloperPIC]  as 'PR_DeveloperHDA'
		, intsub.[PR_DeveloperHDABank]  as 'PR_DeveloperHDABank'

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

		,intsub.[DisbursementMakerEmailAddress]
		,intsub.[DisbursementMakerDecision]
		,intsub.[DisbursementMakerSubmissionCompleted]
		,intsub.[DisbursementMakerRejectionReason]
		,intsub.[DisbursementMakerSubmissionDate]      
		--,intsub.[DisbursementCheckerEmailAddress]
		,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
		,intsub.[DisbursementCheckerDecision]
		,intsub.[DisbursementCheckerSubmissionCompleted]
		,intsub.[DisbursementCheckerRejectionReason]
		--,intsub.[DisbursementCheckerSubmissionDate]
		,FORMAT (DisbursementCheckerSubmissionDate, 'dd/MM/yyyy HH:mm:ss') as DisbursementCheckerSubmissionDate
		,intsub.[CreatedDate]
		,intsub.[UpdatedDate]	  
		 ,intsub.[DisbursementCheckerPDFID]
      ,intsub.[RCOMakerEmailAddress]
      ,intsub.[RCOMakerDecision]
      ,intsub.[RCOMakerSubmissionCompleted]
      ,intsub.[RCOMakerRejectionReason]
      ,intsub.[RCOMakerSubmissionDate]
      ,intsub.[RCOMakerPDFID]
      ,intsub.[RCOCheckerEmailAddress]
      ,intsub.[RCOCheckerDecision]
      ,intsub.[RCOCheckerSubmissionCompleted]
      ,intsub.[RCOCheckerRejectionReason]
      ,intsub.[RCOCheckerSubmissionDate]
      ,intsub.[RCOCheckerPDFID]	
	  ,[FinalBillingFlag]
      ,[ProjectSubmissionOption]
      ,[ProjectSubmissionCompleted]
      ,[DeveloperCode]
      ,[ProjectCode]
      ,[PhaseCode]
      ,[DeveloperLoginID]
      ,[ProjectSubmissionDate]
      ,[ProjectSubmissionPDFID]
      ,[PR_Stage2IFlag]
      ,[PR_Stage2JFlag]
      ,[PR_Stage2KFlag]
      ,[PR_Stage3]
      ,[PR_Stage4]
      ,[PR_Stage5]
      ,[PR_Stage6]
      ,[PR_Stage7]
      ,[PR_Stage8]
      ,[PR_Stage9]
      ,[Attachment1]
      ,[Attachment2]
      ,[DraftID]
      ,[SadaFlag]
      ,[ConfirmationOfArchitectFlag]
      ,[ConfirmationOfArchitectRemark]
	  ,[BillingRunningID]
	  --, case when rejected.arn is null then 0 else 1 end as 'RejectionStatus'		  
	  , null as 'RejectionStatus'		
	FROM [ddProjectDisbursementSubmission_RCOMaker] intsub 
		--inner join [dbo].[ddProjectDisbursementSubmission_RCOMaker] intsub on intsub.arn = sqlloads.arn 		
		--left join SQLSolicitorDPSubmission doc on doc.arn = intsub.arn 		
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 
		*/
		--left join aaIntDisbursementSubmission_RCOCheckerRejected rejected on rejected.arn = intsub.arn and rejected.BillingRunningID = intsub.BillingRunningID
		left join InternalUser InternalUser_Checker on InternalUser_Checker.UserName = IntSub.DisbursementCheckerEmailAddress
	where 
		intsub.arn =@arn 		and intsub.BillingRunningID= @billingid
end