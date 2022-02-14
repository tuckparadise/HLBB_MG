CREATE     procedure [dbo].[aa_ws_SolDisbursementSubmission_MoveToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	
	/*
	update aaSolDisbursementSubmission_staging
	set CancelLoan_File = null		
	where arn = @arn 
	*/

	insert into SQLSolicitorDPSubmissionRemark
	select * from SQLSolicitorDPSubmissionRemark_staging
	where arn = @arn

	insert into aaSolDisbursementSubmission
	select * from aaSolDisbursementSubmission_staging
	where arn = @arn

	insert into aaSolDisbursementSubmission_PaymentDetail
	select * from aaSolDisbursementSubmission_PaymentDetail_staging 
	where arn = @arn

	delete from SQLSolicitorDPSubmissionRemark_staging
	where arn = @arn 

	delete from aaSolDisbursementSubmission_PaymentDetail_staging
	where arn = @arn 

	delete from aaSolDisbursementSubmission_staging
	where arn = @arn 


	-- export disbursement info to aaSolDisbursementSubmission_DisMakerSubmission
	delete from aaSolDisbursementSubmission_DisMakerSubmission
	where arn = @arn 

	-- 20210401- for LS, copy LS info submitted by Sol instead of first advice 
	-- 20210401- for PR, copy PR info approved by checker instead of first advice
	declare @DisManner nvarchar(max)
	set @DisManner = (select disbursementManner
	from sqlloads 
	where arn = @arn )
	-- end 

		
	--20210321- start default PR/LS info as first advice for balance advice submission by sol 
	--20210401- start default PR info as first advice for balance advice submission by sol 
	--20210401- start default LS info as balance advice submitted by sol 
	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		where arn = @arn 
	)
	begin
		if (@DisManner = 'LS')
		begin
			insert into aaSolDisbursementSubmission_DisMakerSubmission
			 ([arn]
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
			   ,[ConfirmationOfArchitectRemark])
			select 
				aaSolDisbursementSubmission.[arn]
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
			   ,aaSolDisbursementSubmission.[SolicitorCode]
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
			   ,getdate()
			   ,getdate()
			   ,null as [FinalBillingFlag]
			   ,null as [ProjectSubmissionOption]
			   ,null as [ProjectSubmissionCompleted]
			   ,sqlloads.DeveloperCode as [DeveloperCode]
			   ,sqlloads.[ProjectCode] as [ProjectCode]
			   ,sqlloads.[PhaseCode] as [PhaseCode]
			   ,null as [DeveloperLoginID]
			   ,null as [ProjectSubmissionDate]
			   ,null as [ProjectSubmissionPDFID]
			   ,null as [PR_Stage2IFlag]
			   ,null as [PR_Stage2JFlag]
			   ,null as [PR_Stage2KFlag]
			   ,null as [PR_Stage3]
			   ,null as [PR_Stage4]
			   ,null as [PR_Stage5]
			   ,null as [PR_Stage6]
			   ,null as [PR_Stage7]
			   ,null as [PR_Stage8]
			   ,null as [PR_Stage9]
			   ,null as [Attachment1]
			   ,null as [Attachment2]
			   ,null as [DraftID]
			   ,null as [SadaFlag]
			   ,null as [ConfirmationOfArchitectFlag]
			   ,null as [ConfirmationOfArchitectRemark]
			from aaSolDisbursementSubmission
			left join sqlloads on sqlloads.arn = aaSolDisbursementSubmission.arn 
			where aaSolDisbursementSubmission.arn = @arn 	
		end 

		if (@DisManner = 'PR')
		begin

			INSERT INTO [dbo].[aaSolDisbursementSubmission_DisMakerSubmission]
			  ([arn]
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
			   ,[ConfirmationOfArchitectRemark])
			SELECT SolSub.[arn]
			  ,SolSub.[BalanceAdviceLetterApplicableFlag]
			  ,SolSub.[UrgentFlag]
			  ,FirstAdvice.[LS_RedemptionDueDateFlag]
			  ,FirstAdvice.[LS_RedemptionDueDate]
			  ,FirstAdvice.[LS_ExtendedCompletionDateFlag]
			  ,FirstAdvice.[LS_CompletionDate]
			  ,FirstAdvice.[LS_ExtendedCompletionDate]
			   ,null as [PR_DeveloperBillingDueDateFlag]
			  ,null as [PR_Stage2AFlag]
			  ,null as [PR_Stage2BFlag]
			  ,null as [PR_Stage2CFlag]
			  ,null as [PR_Stage2DFlag]
			  ,null as [PR_Stage2EFlag]
			  ,null as [PR_Stage2FFlag]
			  ,null as [PR_Stage2GFlag]
			  ,null as [PR_Stage2HFlag]
			  ,null as [PR_StageOthers]
			  ,null as [PR_EarliestBillingDueDate]
			  ,null as [PR_TotalBillingAmount]
			  /*
			  ,FirstAdvice.[PR_DeveloperBillingDueDateFlag]
			  ,FirstAdvice.[PR_Stage2AFlag]
			  ,FirstAdvice.[PR_Stage2BFlag]
			  ,FirstAdvice.[PR_Stage2CFlag]
			  ,FirstAdvice.[PR_Stage2DFlag]
			  ,FirstAdvice.[PR_Stage2EFlag]
			  ,FirstAdvice.[PR_Stage2FFlag]
			  ,FirstAdvice.[PR_Stage2GFlag]
			  ,FirstAdvice.[PR_Stage2HFlag]
			  ,FirstAdvice.[PR_StageOthers]
			  ,FirstAdvice.[PR_EarliestBillingDueDate]
			  ,FirstAdvice.[PR_TotalBillingAmount]
			  */
			  ,FirstAdvice.[PR_AnyBridgingFinancierFlag]
			  ,FirstAdvice.[PR_BridgingFinancier]
			  ,FirstAdvice.[PR_BridgingFinancierEmailAddress]
			  ,FirstAdvice.[PR_BridgingFinancierRedemptionSum]
			  ,FirstAdvice.[PR_RedemptionPaymentAccountNumber]
			  ,FirstAdvice.[PR_BeneficiaryBank]
			  ,FirstAdvice.[PR_BridgingFinancierRedemptionExpiryDate]
			  ,FirstAdvice.[PR_DeveloperName]
			  ,FirstAdvice.[PR_DeveloperEmailAddress]
			  ,FirstAdvice.[PR_DeveloperPIC]
			  ,FirstAdvice.[PR_DeveloperHDA]
			  ,FirstAdvice.[PR_DeveloperHDABank]
			  ,FirstAdvice.[LF_PayeeName]
			  ,FirstAdvice.[LF_BilledAmount]
			  ,FirstAdvice.[LF_AccountNumber]
			  ,FirstAdvice.[LF_Bank]
			  ,FirstAdvice.[LF_PaymentDescription]
			  ,FirstAdvice.[LF_PaymentMode]
			  ,SolSub.[UpdateInfo_Reason]
			  ,SolSub.[UpdateInfo_Others]
			  ,SolSub.[CancelLoan_Remarks]
			  ,SolSub.[CancelLoan_File]
			  ,SolSub.[SolicitorSubmissionOption]
			  ,SolSub.[SolicitorSubmissionCompleted]
			  ,SolSub.[SolicitorCode]
			  ,SolSub.[SolicitorSubmissionDate]
			  ,SolSub.[SolicitorSubmissionPDFID]
			  ,SolSub.[DisbursementMakerEmailAddress]
			  ,SolSub.[DisbursementMakerDecision]
			  ,SolSub.[DisbursementMakerSubmissionCompleted]
			  ,SolSub.[DisbursementMakerRejectionReason]
			  ,SolSub.[DisbursementMakerSubmissionDate]
			  ,SolSub.[DisbursementMakerSubmissionPDFID]
			  ,SolSub.[DisbursementCheckerEmailAddress]
			  ,SolSub.[DisbursementCheckerDecision]
			  ,SolSub.[DisbursementCheckerSubmissionCompleted]
			  ,SolSub.[DisbursementCheckerRejectionReason]
			  ,SolSub.[DisbursementCheckerSubmissionDate]
			  ,SolSub.[DisbursementCheckerPDFID]
			  ,SolSub.[RCOMakerEmailAddress]
			  ,SolSub.[RCOMakerDecision]
			  ,SolSub.[RCOMakerSubmissionCompleted]
			  ,SolSub.[RCOMakerRejectionReason]
			  ,SolSub.[RCOMakerSubmissionDate]
			  ,SolSub.[RCOMakerPDFID]
			  ,SolSub.[RCOCheckerEmailAddress]
			  ,SolSub.[RCOCheckerDecision]
			  ,SolSub.[RCOCheckerSubmissionCompleted]
			  ,SolSub.[RCOCheckerRejectionReason]
			  ,SolSub.[RCOCheckerSubmissionDate]
			  ,SolSub.[RCOCheckerPDFID]
			  ,getdate()
			  ,getdate()
			  ,null as [FinalBillingFlag]
			   ,null as [ProjectSubmissionOption]
			   ,null as [ProjectSubmissionCompleted]
			   ,sqlloads.DeveloperCode as [DeveloperCode]
			   ,sqlloads.[ProjectCode] as [ProjectCode]
			   ,sqlloads.[PhaseCode] as [PhaseCode]
			   ,null as [DeveloperLoginID]
			   ,null as [ProjectSubmissionDate]
			   ,null as [ProjectSubmissionPDFID]
			   ,null as [PR_Stage2IFlag]
			   ,null as [PR_Stage2JFlag]
			   ,null as [PR_Stage2KFlag]
			   ,null as [PR_Stage3]
			   ,null as [PR_Stage4]
			   ,null as [PR_Stage5]
			   ,null as [PR_Stage6]
			   ,null as [PR_Stage7]
			   ,null as [PR_Stage8]
			   ,null as [PR_Stage9]
			   ,null as [Attachment1]
			   ,null as [Attachment2]
			   ,null as [DraftID]
			   ,null as [SadaFlag]
			   ,null as [ConfirmationOfArchitectFlag]
			   ,null as [ConfirmationOfArchitectRemark]
		  FROM [dbo].[aaSolDisbursementSubmission] SolSub
			inner join aaSolDisbursementSubmission_DisMakerSubmission_History FirstAdvice on FirstAdvice.arn = SolSub.arn 
			left join sqlloads on sqlloads.arn = SolSub.arn 
		  where SolSub.arn = @arn 
		end 
			  
	end 
	else
	begin
		insert into aaSolDisbursementSubmission_DisMakerSubmission
			([arn]
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
			   ,[ConfirmationOfArchitectRemark])			
		select aaSolDisbursementSubmission.[arn]
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
			   ,aaSolDisbursementSubmission.[SolicitorCode]
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
			   ,getdate()
			   ,getdate() 
			   ,null as [FinalBillingFlag]
			   ,null as [ProjectSubmissionOption]
			   ,null as [ProjectSubmissionCompleted]
			   ,sqlloads.DeveloperCode as [DeveloperCode]
			   ,sqlloads.[ProjectCode] as [ProjectCode]
			   ,sqlloads.[PhaseCode] as [PhaseCode]
			   ,null as [DeveloperLoginID]
			   ,null as [ProjectSubmissionDate]
			   ,null as [ProjectSubmissionPDFID]
			   ,null as [PR_Stage2IFlag]
			   ,null as [PR_Stage2JFlag]
			   ,null as [PR_Stage2KFlag]
			   ,null as [PR_Stage3]
			   ,null as [PR_Stage4]
			   ,null as [PR_Stage5]
			   ,null as [PR_Stage6]
			   ,null as [PR_Stage7]
			   ,null as [PR_Stage8]
			   ,null as [PR_Stage9]
			   ,null as [Attachment1]
			   ,null as [Attachment2]
			   ,null as [DraftID]
			   ,null as [SadaFlag]
			   ,null as [ConfirmationOfArchitectFlag]
			   ,null as [ConfirmationOfArchitectRemark]
		from aaSolDisbursementSubmission
		left join sqlloads on sqlloads.arn = aaSolDisbursementSubmission.arn 
		where aaSolDisbursementSubmission.arn = @arn 	
	
	end 
	--20210321- end default PR/LS info as first advice for balance advice submission by sol 
	-- end 

	declare @solicitorstatus nvarchar(max), @solcode nvarchar(max) 
	select @solicitorstatus = SolicitorSubmissionOption, @solcode = SolicitorCode
	from aaSolDisbursementSubmission
	where arn = @arn 

	if (@solicitorstatus in ('Submitted','Resubmitted')) 
	begin
		if exists (select 1 from aaSolDisbursementSubmission_DisMakerRejected where arn = @arn )
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Resubmitted',@solcode,null,getdate())
		end 
		else
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Submitted',@solcode,null,getdate())
		end 
		
	end 	
	
	/*
	if ( @solicitorstatus = 'Resubmitted') 
	begin
		insert into WorkflowHistory
		values ('Disbursement',@arn,'Disbursement Resubmitted',@solcode,null,getdate())
	end 
	*/

	if ( @solicitorstatus = 'UpdateInfo') 
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Update Info Submitted',@solcode,null,getdate())
	end 

	if ( @solicitorstatus = 'Cancelled') 
	begin
		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Cancellation Submitted',@solcode,null,getdate())
	end 

	-- start assign the case back to maker if resubmitted
	if (@solicitorstatus in ('Resubmitted') )
	begin
		--start locate last dis maker from logs and assign to him/her. 
		declare @LastDisMakerFromLog nvarchar(max)

		select top 1 @LastDisMakerFromLog= taskowner 
		from MortgageAppTaskInstance_logs
		where workflow = 'DisbDUMakerSolicitorApproval'
			and Completed = 1
			and arn = @arn 
			--and BillingRunningID = @billingid
		order by updateddate desc

		if (isnull(@LastDisMakerFromLog,'') <> '')
		begin
			insert into MortgageAppTaskInstance
			values ('DisbDUMakerSolicitorApproval', @arn, @LastDisMakerFromLog, getdate(), getdate(), @LastDisMakerFromLog, @LastDisMakerFromLog)

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Maker',@LastDisMakerFromLog,null,getdate())
		end 

		--end locate last dis maker from logs and assign to him/her. .

	end 
	-- end assign the case back to maker if resubmitted
end