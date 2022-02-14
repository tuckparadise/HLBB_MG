﻿CREATE       procedure [dbo].[ddProjectDisbursementSubmission_MoveToMain]
@draftID bigint = null, 
@error nvarchar(max) = null output 
as
begin
	
	insert into ddProjectDisbursementSubmission_DisMaker
	SELECT d.[arn]
		,null as [BalanceAdviceLetterApplicableFlag]
		,null as [UrgentFlag]
		,null as [LS_RedemptionDueDateFlag]
		,null as [LS_RedemptionDueDate]
		,null as [LS_ExtendedCompletionDateFlag]
		,null as [LS_CompletionDate]
		,null as [LS_ExtendedCompletionDate]
		,null as [PR_DeveloperBillingDueDateFlag]
		,m.[PR_Stage2AFlag]
		,m.[PR_Stage2BFlag]
		,m.[PR_Stage2CFlag]
		,m.[PR_Stage2DFlag]
		,m.[PR_Stage2EFlag]
		,m.[PR_Stage2FFlag]
		,m.[PR_Stage2GFlag]
		,m.[PR_Stage2HFlag]
		,m.[PR_StageOthers]
		,m.[PR_EarliestBillingDueDate]
		,null as [PR_TotalBillingAmount]
		,null as [PR_AnyBridgingFinancierFlag]
		,null as [PR_BridgingFinancier]
		,null as [PR_BridgingFinancierEmailAddress]
		,null as [PR_BridgingFinancierRedemptionSum]
		,null as [PR_RedemptionPaymentAccountNumber]
		,null as [PR_BeneficiaryBank]
		,null as [PR_BridgingFinancierRedemptionExpiryDate]
		,null as [PR_DeveloperName]
		,null as [PR_DeveloperEmailAddress]
		,null as [PR_DeveloperPIC]
		,null as [PR_DeveloperHDA]
		,null as [PR_DeveloperHDABank]
		,null as [LF_PayeeName]
		,null as [LF_BilledAmount]
		,null as [LF_AccountNumber]
		,null as [LF_Bank]
		,null as [LF_PaymentDescription]
		,null as [LF_PaymentMode]
		,null as [UpdateInfo_Reason]
		,null as [UpdateInfo_Others]
		,null as [CancelLoan_Remarks]
		,null as [CancelLoan_File]
		,null as [SolicitorSubmissionOption]
		,null as [SolicitorSubmissionCompleted]
		,null as [SolicitorCode]
		,null as [SolicitorSubmissionDate]
		,null as [SolicitorSubmissionPDFID]
		,null as [DisbursementMakerEmailAddress]
		,null as [DisbursementMakerDecision]
		,null as [DisbursementMakerSubmissionCompleted]
		,null as [DisbursementMakerRejectionReason]
		,null as [DisbursementMakerSubmissionDate]
		,null as [DisbursementMakerSubmissionPDFID]
		,null as [DisbursementCheckerEmailAddress]
		,null as [DisbursementCheckerDecision]
		,null as [DisbursementCheckerSubmissionCompleted]
		,null as [DisbursementCheckerRejectionReason]
		,null as [DisbursementCheckerSubmissionDate]
		,null as [DisbursementCheckerPDFID]
		,null as [RCOMakerEmailAddress]
		,null as [RCOMakerDecision]
		,null as [RCOMakerSubmissionCompleted]
		,null as [RCOMakerRejectionReason]
		,null as [RCOMakerSubmissionDate]
		,null as [RCOMakerPDFID]
		,null as [RCOCheckerEmailAddress]
		,null as [RCOCheckerDecision]
		,null as [RCOCheckerSubmissionCompleted]
		,null as [RCOCheckerRejectionReason]
		,null as [RCOCheckerSubmissionDate]
		,null as [RCOCheckerPDFID]
		,getdate() as [CreatedDate]
		,getdate() as [UpdatedDate]			  
		,m.[FinalBillingFlag]
		,'Submitted' as [ProjectSubmissionOption]
		,1 as [ProjectSubmissionCompleted]
		,m.[DeveloperCode]
		,m.[ProjectCode]
		,m.[PhaseCode]
		,m.[DeveloperLoginID]
		,getdate() as [ProjectSubmissionDate]
		,m.pdfid as [ProjectSubmissionPDFID]
		,m.PR_Stage2IFlag
		,m.PR_Stage2JFlag
		,m.PR_Stage2KFlag
		,m.[PR_Stage3]
		,m.[PR_Stage4]
		,m.[PR_Stage5]
		,m.[PR_Stage6]
		,m.[PR_Stage7]
		,m.[PR_Stage8]
		,m.[PR_Stage9]
		,null as attachment1
		,null as attachment2
		,@DraftID
		,null as [SadaFlag]
		,null as [ConfirmationOfArchitectFlag]
		,null as [ConfirmationOfArchitectRemark]
		,null as [SPADate]
		,null as [SPAConstructionPeriodInMonths]
		,null as [ExtendedConstructionPeriodInMonths]
	--from 	[ddProjectDisbursementSubmission_SubmissionHistory2]
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] d
	inner join ddProjectDisbursementSubmission_draft_Master_staging m on m.DraftID = d.DraftID	
	where d.[DraftID] = @DraftID

	-- insert into wf history 
	insert into WorkflowHistory_ProjectBilling	
	select 'Disbursement By Developer' ,d.arn,'Disbursement Submitted',m.developerloginid, null, getdate(),maker.BillingRunningID
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] d
	inner join ddProjectDisbursementSubmission_draft_Master_staging m on m.DraftID = d.DraftID
	inner join ddProjectDisbursementSubmission_DisMaker maker on maker.arn = d.arn and maker.DraftID = d.draftid 
	where d.[DraftID] = @DraftID
	
	
	update [ddProjectDisbursementSubmission_draft_staging]
	set Attachment1 = null, 
		Attachment2 = null
	where [DraftID] = @DraftID
	
	insert into ddProjectDisbursementSubmission_draft_Master_History
	select *
	FROM [dbo].ddProjectDisbursementSubmission_draft_Master_Staging 
	where [DraftID] = @DraftID 

	insert into ddProjectDisbursementSubmission_draft_History
	select *
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] 
	where [DraftID] = @DraftID 

	delete 
	FROM [dbo].ddProjectDisbursementSubmission_draft_Master_Staging 
	where [DraftID] = @DraftID 

	delete
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] 
	where [DraftID] = @DraftID 
	
	--values ('Disbursement By Developer',@arn,'Disbursement Submitted',@ProjectCode,null,getdate(), @NewBillingID)

	/*
	insert into ddProjectDisbursementSubmission
	SELECT [arn]
      ,[BalanceAdviceLetterApplicableFlag]
      ,[UrgentFlag]
      ,[LS_RedemptionDueDateFlag]
      ,[LS_RedemptionDueDate]
      ,[LS_ExtendedCompletionDateFlag]
      ,[LS_CompletionDate]
      ,[LS_ExtendedCompletionDate]
      ,[PR_DeveloperBillingDueDateFlag]
      ,[PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      ,[PR_AnyBridgingFinancierFlag]
      ,[PR_BridgingFinancier]
      ,[PR_BridgingFinancierEmailAddress]
      ,[PR_BridgingFinancierRedemptionSum]
      ,[PR_RedemptionPaymentAccountNumber]
      ,[PR_BeneficiaryBank]
      ,[PR_BridgingFinancierRedemptionExpiryDate]
      ,[PR_DeveloperName]
      ,[PR_DeveloperEmailAddress]
      ,[PR_DeveloperPIC]
      ,[PR_DeveloperHDA]
      ,[PR_DeveloperHDABank]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[UpdateInfo_Reason]
      ,[UpdateInfo_Others]
      ,[CancelLoan_Remarks]
      ,[CancelLoan_File]
      ,[SolicitorSubmissionOption]
      ,[SolicitorSubmissionCompleted]
      ,[SolicitorCode]
      ,[SolicitorSubmissionDate]
      ,[SolicitorSubmissionPDFID]
      ,[DisbursementMakerEmailAddress]
      ,[DisbursementMakerDecision]
      ,[DisbursementMakerSubmissionCompleted]
      ,[DisbursementMakerRejectionReason]
      ,[DisbursementMakerSubmissionDate]
      ,[DisbursementMakerSubmissionPDFID]
      ,[DisbursementCheckerEmailAddress]
      ,[DisbursementCheckerDecision]
      ,[DisbursementCheckerSubmissionCompleted]
      ,[DisbursementCheckerRejectionReason]
      ,[DisbursementCheckerSubmissionDate]
      ,[DisbursementCheckerPDFID]
      ,[RCOMakerEmailAddress]
      ,[RCOMakerDecision]
      ,[RCOMakerSubmissionCompleted]
      ,[RCOMakerRejectionReason]
      ,[RCOMakerSubmissionDate]
      ,[RCOMakerPDFID]
      ,[RCOCheckerEmailAddress]
      ,[RCOCheckerDecision]
      ,[RCOCheckerSubmissionCompleted]
      ,[RCOCheckerRejectionReason]
      ,[RCOCheckerSubmissionDate]
      ,[RCOCheckerPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[FinalBillingFlag]
      ,[ProjectSubmissionOption]
      ,[ProjectSubmissionCompleted]
      ,[ProjectCode]
      ,[ProjectSubmissionDate]
      ,[ProjectSubmissionPDFID]
      ,[SadaFlag]
      ,[ConfirmationOfArchitectFlag]
      ,[ConfirmationOfArchitectRemark]
	       ,[PR_Stage3]
		   ,[PR_Stage4]
		   ,[PR_Stage5]
      ,[DraftID]
	from ddProjectDisbursementSubmission_staging
	where BillingRunningID = @billingid
	
	declare @NewBillingID bigint 
	set @NewBillingID = SCOPE_IDENTITY() 
		
	delete from ddProjectDisbursementSubmission_staging
	where BillingRunningID = @billingid

	insert into ddProjectDisbursementSubmission_DisMaker
	SELECT [arn]
      ,[BalanceAdviceLetterApplicableFlag]
      ,[UrgentFlag]
      ,[LS_RedemptionDueDateFlag]
      ,[LS_RedemptionDueDate]
      ,[LS_ExtendedCompletionDateFlag]
      ,[LS_CompletionDate]
      ,[LS_ExtendedCompletionDate]
      ,[PR_DeveloperBillingDueDateFlag]
      ,[PR_Stage2AFlag]
      ,[PR_Stage2BFlag]
      ,[PR_Stage2CFlag]
      ,[PR_Stage2DFlag]
      ,[PR_Stage2EFlag]
      ,[PR_Stage2FFlag]
      ,[PR_Stage2GFlag]
      ,[PR_Stage2HFlag]
      ,[PR_StageOthers]
      ,[PR_EarliestBillingDueDate]
      ,[PR_TotalBillingAmount]
      ,[PR_AnyBridgingFinancierFlag]
      ,[PR_BridgingFinancier]
      ,[PR_BridgingFinancierEmailAddress]
      ,[PR_BridgingFinancierRedemptionSum]
      ,[PR_RedemptionPaymentAccountNumber]
      ,[PR_BeneficiaryBank]
      ,[PR_BridgingFinancierRedemptionExpiryDate]
      ,[PR_DeveloperName]
      ,[PR_DeveloperEmailAddress]
      ,[PR_DeveloperPIC]
      ,[PR_DeveloperHDA]
      ,[PR_DeveloperHDABank]
      ,[LF_PayeeName]
      ,[LF_BilledAmount]
      ,[LF_AccountNumber]
      ,[LF_Bank]
      ,[LF_PaymentDescription]
      ,[LF_PaymentMode]
      ,[UpdateInfo_Reason]
      ,[UpdateInfo_Others]
      ,[CancelLoan_Remarks]
      ,[CancelLoan_File]
      ,[SolicitorSubmissionOption]
      ,[SolicitorSubmissionCompleted]
      ,[SolicitorCode]
      ,[SolicitorSubmissionDate]
      ,[SolicitorSubmissionPDFID]
      ,[DisbursementMakerEmailAddress]
      ,[DisbursementMakerDecision]
      ,[DisbursementMakerSubmissionCompleted]
      ,[DisbursementMakerRejectionReason]
      ,[DisbursementMakerSubmissionDate]
      ,[DisbursementMakerSubmissionPDFID]
      ,[DisbursementCheckerEmailAddress]
      ,[DisbursementCheckerDecision]
      ,[DisbursementCheckerSubmissionCompleted]
      ,[DisbursementCheckerRejectionReason]
      ,[DisbursementCheckerSubmissionDate]
      ,[DisbursementCheckerPDFID]
      ,[RCOMakerEmailAddress]
      ,[RCOMakerDecision]
      ,[RCOMakerSubmissionCompleted]
      ,[RCOMakerRejectionReason]
      ,[RCOMakerSubmissionDate]
      ,[RCOMakerPDFID]
      ,[RCOCheckerEmailAddress]
      ,[RCOCheckerDecision]
      ,[RCOCheckerSubmissionCompleted]
      ,[RCOCheckerRejectionReason]
      ,[RCOCheckerSubmissionDate]
      ,[RCOCheckerPDFID]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[FinalBillingFlag]
      ,[ProjectSubmissionOption]
      ,[ProjectSubmissionCompleted]
      ,[ProjectCode]
      ,[ProjectSubmissionDate]
      ,[ProjectSubmissionPDFID]
      ,[SadaFlag]
      ,[ConfirmationOfArchitectFlag]
      ,[ConfirmationOfArchitectRemark]
	  ,[PR_Stage3]
	  ,[PR_Stage4]
	  ,[PR_Stage5]
      ,[DraftID]
	  ,@NewBillingID
	from ddProjectDisbursementSubmission
	where BillingRunningID = @NewBillingID
	
	declare @ProjectCode nvarchar(max) 

	set @ProjectCode = (select projectcode from ddProjectDisbursementSubmission_DisMaker where BillingRunningID = @NewBillingID )

	insert into WorkflowHistory_ProjectBilling
	values ('Disbursement By Developer',@arn,'Disbursement Submitted',@ProjectCode,null,getdate(), @NewBillingID)
	*/
end