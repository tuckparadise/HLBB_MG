CREATE   procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_Main]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@RejectedRunningID bigint = null,
@arn nvarchar(max) = null,
@DeveloperLoginID nvarchar(max) = null ,
@Attachment1 nvarchar(max) = null ,
@Attachment2 nvarchar(max) = null ,
@Completion bit = null ,
@Error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	if (@Attachment1 = '<file><name>scnull</name><content>scnull</content></file>')
	begin
		set @Attachment1 = null 
	end 

	if (@Attachment2 = '<file><name>scnull</name><content>scnull</content></file>')
	begin
		set @Attachment2 = null 
	end 

	if (@Completion = 1)
	begin
		if ((@Attachment1 is null or ltrim(rtrim(@Attachment1)) = '') and (@Attachment2 is null or ltrim(rtrim(@Attachment2)) = ''))
		begin
			set @error = @error + 'Please attach at least 1 attachment for case '+@arn+'<br>'
		end 
	end 
	
	if (@error = '' )
	begin
		update ddProjectDisbursementSubmission_DisMaker_Rejected
		set Attachment1 = @Attachment1,
			Attachment2 = @Attachment2,
			DeveloperLoginID = @DeveloperLoginID,			
			ProjectSubmissionOption = 'Resubmission',
			ProjectSubmissionDate = getdate(),
			ProjectSubmissionCompleted = @Completion,
			UpdatedDate = getdate()
		where RejectedRunningID = @RejectedRunningID

		if (@Completion = 1)
		begin
			
			insert into ddProjectDisbursementSubmission_DisMaker_Rejected_Staging			
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
				  --,'Resubmission' as [ProjectSubmissionOption]
				  ,[ProjectSubmissionOption]
				  --,1 as [ProjectSubmissionCompleted]
				  ,[ProjectSubmissionCompleted]
				  ,[DeveloperCode]
				  ,[ProjectCode]
				  ,[PhaseCode]
				  --,@DeveloperLoginID as [DeveloperLoginID]
				  ,[DeveloperLoginID]
				  --,getdate() as [ProjectSubmissionDate]
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
				  ,[PrimaryCustomerName]
				  ,[FinancingAmount]
				  ,[AddressLine1]
				  ,[ExtraField1]
				  ,[ExtraField2]
				  ,[ExtraField3]
				  ,[ExtraField4]
				  ,[RejectedRunningID]
				  ,[SPADate]
				  ,[SPAConstructionPeriodInMonths]
				  ,[ExtendedConstructionPeriodInMonths]
			from ddProjectDisbursementSubmission_DisMaker_Rejected
			where RejectedRunningID = @RejectedRunningID
			
			INSERT INTO [dbo].[ddProjectDisbursementSubmission_SubmissionHistory2]
           ([PR_Stage2AFlag]
           ,[PR_Stage2BFlag]
           ,[PR_Stage2CFlag]
           ,[PR_Stage2DFlag]
           ,[PR_Stage2EFlag]
           ,[PR_Stage2FFlag]
           ,[PR_Stage2GFlag]
           ,[PR_Stage2HFlag]
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
           ,[PR_StageOthers]
           ,[PR_EarliestBillingDueDate]
           ,[PR_TotalBillingAmount]
           ,[FinalBillingFlag]
           ,[DeveloperCode]
           ,[ProjectCode]
           ,[PhaseCode]
           ,[DeveloperLoginID]
           ,[PDFID]
           ,[DraftID]
           ,[PrimaryCustomerName]
           ,[ARN]
           ,[FinancingAmount]
           ,[AddressLine1]
           ,[BillingAmount]
           ,[SubmittedDate]
           ,[ExtraField1]
           ,[ExtraField2]
           ,[ExtraField3]
           ,[ExtraField4])
			SELECT m.[PR_Stage2AFlag]
			  ,m.[PR_Stage2BFlag]
			  ,m.[PR_Stage2CFlag]
			  ,m.[PR_Stage2DFlag]
			  ,m.[PR_Stage2EFlag]
			  ,m.[PR_Stage2FFlag]
			  ,m.[PR_Stage2GFlag]
			  ,m.[PR_Stage2HFlag]
			  ,m.[PR_Stage2IFlag]
			  ,m.[PR_Stage2JFlag]
			  ,m.[PR_Stage2KFlag]
			  ,m.[PR_Stage3]
			  ,m.[PR_Stage4]
			  ,m.[PR_Stage5]
			  ,m.[PR_Stage6]
			  ,m.[PR_Stage7]
			  ,m.[PR_Stage8]
			  ,m.[PR_Stage9]
			  ,m.[PR_StageOthers]
			  ,m.[PR_EarliestBillingDueDate]
			  ,null as [PR_TotalBillingAmount]
			  ,m.[FinalBillingFlag]
			  ,rejected.[DeveloperCode]
			  ,rejected.[ProjectCode]
			  ,rejected.[PhaseCode]
			  ,@DeveloperLoginID		 
			  ,null as [PDFID]
			  ,rejected.DraftID as [DraftID]			  
			  ,rejected.[PrimaryCustomerName]
			  ,rejected.[ARN]
			  ,rejected.[FinancingAmount]
			  ,rejected.[AddressLine1]
			  ,d.BillingAmount as [BillingAmount]			  		
			  ,getdate()
			  ,rejected.[ExtraField1]
			  ,rejected.[ExtraField2]
			  ,rejected.[ExtraField3]
			  ,rejected.[ExtraField4]
		  FROM [dbo].ddProjectDisbursementSubmission_DisMaker_Rejected rejected
		  inner join ddProjectDisbursementSubmission_draft_Master_history m on m.DraftID = rejected.DraftID 
		  --inner join ddProjectDisbursementSubmission_draft_history d on m.DraftID = d.DraftID 
		  inner join ddProjectDisbursementSubmission_draft_history d on d.draftid = m.draftid and d.arn = rejected.arn 
		  where RejectedRunningID = @RejectedRunningID

		  
		delete from ddProjectDisbursementSubmission_DisMaker_Rejected
		where RejectedRunningID = @RejectedRunningID
			

			set @error = @error + 'Submission Completed for case '+@arn+'<br>'
		end 
		
	end 
end