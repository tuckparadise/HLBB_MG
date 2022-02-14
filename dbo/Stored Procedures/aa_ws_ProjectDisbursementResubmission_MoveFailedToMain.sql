CREATE       procedure [dbo].[aa_ws_ProjectDisbursementResubmission_MoveFailedToMain]
@arn nvarchar(100) = null ,
@runningID nvarchar(100) = null ,
@error nvarchar(max) = null output ,
@senderemail nvarchar(max) = null output ,
@receiveremail nvarchar(max) = null output ,
@emailheader nvarchar(max) = null output ,
@emailcontent nvarchar(max) = null output 
as
begin	
	
	--declare @status nvarchar(100)
	INSERT INTO [dbo].[ddProjectDisbursementSubmission_DisMaker_Rejected]
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
           ,[ConfirmationOfArchitectRemark]
           ,[BillingRunningID]
           ,[PrimaryCustomerName]
           ,[FinancingAmount]
           ,[AddressLine1]
           ,[ExtraField1]
           ,[ExtraField2]
           ,[ExtraField3]
           ,[ExtraField4]
           ,[SPADate]
           ,[SPAConstructionPeriodInMonths]
           ,[ExtendedConstructionPeriodInMonths])
	SELECT [arn]
		,null as [BalanceAdviceLetterApplicableFlag]
		,null as [UrgentFlag]
		,null as [LS_RedemptionDueDateFlag]
		,null as [LS_RedemptionDueDate]
		,null as [LS_ExtendedCompletionDateFlag]
		,null as [LS_CompletionDate]
		,null as [LS_ExtendedCompletionDate]
		,null as [PR_DeveloperBillingDueDateFlag]
		, [PR_Stage2AFlag]
		, [PR_Stage2BFlag]
		, [PR_Stage2CFlag]
		, [PR_Stage2DFlag]
		, [PR_Stage2EFlag]
		, [PR_Stage2FFlag]
		, [PR_Stage2GFlag]
		, [PR_Stage2HFlag]
		, [PR_StageOthers]
		,null as [PR_EarliestBillingDueDate]
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
		,'Bad Attachment' as [DisbursementMakerRejectionReason]
		--,null as [DisbursementMakerRejectionReason]
		,getdate() as [DisbursementMakerSubmissionDate]
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
		,null as [FinalBillingFlag]
		,'Submitted' as [ProjectSubmissionOption]
		,0 as [ProjectSubmissionCompleted]
		,[DeveloperCode]
		,[ProjectCode]
		,[PhaseCode]
		,null as [DeveloperLoginID]
		,null as [ProjectSubmissionDate]
		,null  as [ProjectSubmissionPDFID]
		, PR_Stage2IFlag
		, PR_Stage2JFlag
		, PR_Stage2KFlag
		, [PR_Stage3]
		, [PR_Stage4]
		, [PR_Stage5]
		, [PR_Stage6]
		, [PR_Stage7]
		, [PR_Stage8]
		, [PR_Stage9]
		,null as attachment1
		,null as attachment2
		,DraftID
		,null as [SadaFlag]
		,null as [ConfirmationOfArchitectFlag]
		,null as [ConfirmationOfArchitectRemark]
		,[BillingRunningID]
        ,[PrimaryCustomerName]
        ,[FinancingAmount]
        ,[AddressLine1]
        ,[ExtraField1] as [ExtraField1]
        ,[ExtraField2] as [ExtraField2]
        ,[ExtraField3] as [ExtraField3]
        ,[ExtraField4] as [ExtraField4]
		,null as [SPADate]
		,null as [SPAConstructionPeriodInMonths]
		,null as [ExtendedConstructionPeriodInMonths]	
	from ddProjectDisbursementSubmission_DisMaker_Rejected_staging 
	where RejectedRunningID = @runningID

	declare @NewRejectedID bigint 

	set @NewRejectedID =(SELECT SCOPE_IDENTITY() )	

	declare @developercode nvarchar(max) 
	declare @projectcode nvarchar(max) 
	declare @phasecode nvarchar(max) 

	set @phasecode = (select phasecode FROM [dbo].ddProjectDisbursementSubmission_DisMaker_Rejected_staging 	
	where RejectedRunningID = @runningID
	) 
	
	set @projectcode = (select ProjectCode FROM [dbo].ddProjectDisbursementSubmission_DisMaker_Rejected_staging 	
	where RejectedRunningID = @runningID
		) 

	set @developercode = (select DeveloperCode FROM [dbo].ddProjectDisbursementSubmission_DisMaker_Rejected_staging 	
	where RejectedRunningID = @runningID
		) 

	set  @senderemail = (select [SenderEmail] FROM [dbo].[Settings])

	set @receiveremail = (select phaseemail from ddprojectphase where phasecode = @phasecode and projectcode = @projectcode and DeveloperCode = @DeveloperCode)

	set @emailheader = ( select dbo.ufn_AV_project_header_generate(@arn) )

	set @emailcontent = ( select dbo.ufn_AV_project_body_generate(@arn) )

	if exists
	(
		select 1
		from ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly
		where RejectedRunningID = @runningID
	)
	begin
		update ddProjectDisbursementSubmission_DisMaker_Rejected_ViewOnly
		set RejectedRunningID = @NewRejectedID
		where RejectedRunningID = @runningID
	end 

	delete 
	from ddProjectDisbursementSubmission_DisMaker_Rejected_staging 
	where RejectedRunningID = @runningID

	--select top 1 @solicitoremail = solicitoremail from sqlloads where arn = @arn 

	
	--delete from SQLJOB_AV_ProjectDisbursement_email_content

	--insert into aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging
	--insert into SQLJOB_AV_ProjectDisbursement_email_content
	--select @arn,   @receiveremail, @senderemail, dbo.[ufn_AV_project_header_generate](@arn), dbo.[ufn_AV_project_body_generate](@arn) 
		

end