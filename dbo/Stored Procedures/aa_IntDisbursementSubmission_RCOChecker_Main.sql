CREATE                  procedure [dbo].[aa_IntDisbursementSubmission_RCOChecker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@RCOCheckerEmailAddress  nvarchar(max) = null ,
@RCOCheckerDecision nvarchar(max) = null ,
@RCOCheckerSubmissionCompleted nvarchar(max) = null ,
@RCOCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@RunningIDForCompletedSubmission bigint = null output
as
begin	
	set @Error = ''	

	if (@RCOCheckerEmailAddress like 'K2:%')
	begin		
		set @RCOCheckerEmailAddress = Stuff(@RCOCheckerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if (@RCOCheckerDecision = 'Reject' and @RCOCheckerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@RCOCheckerRejectionReason)) = '' or @RCOCheckerRejectionReason is null)
		begin
			set @Error = 'Please fill in Remarks'
		end 
		
	end 

	

	if (@Error = '')
	begin						

		delete from [aaIntDisbursementSubmission_RCOCheckerRejected]
		where arn = @arn 
			and BillingRunningID = 	@billingid	

		if (@RCOCheckerDecision = 'Reject' and @RCOCheckerSubmissionCompleted = 1)
		begin
			INSERT INTO [dbo].[aaIntDisbursementSubmission_RCOCheckerRejected]
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
			   )
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
				  ,DisbursementCheckerEmailAddress
				  ,DisbursementCheckerDecision
				  ,DisbursementCheckerSubmissionCompleted
				  ,DisbursementCheckerRejectionReason
				  ,[DisbursementCheckerSubmissionDate]
				  ,[DisbursementCheckerPDFID]				  
				  ,[RCOMakerEmailAddress]
				,RCOMakerDecision
			   ,RCOMakerSubmissionCompleted
			   ,RCOMakerRejectionReason
			   ,RCOMakersubmissiondate
			   ,[RCOMakerPDFID]
			   ,@RCOCheckerEmailAddress
			   ,@RCOCheckerDecision
			   ,@RCOCheckerSubmissionCompleted
			   ,@RCOCheckerRejectionReason
			   ,getdate()
			   ,[RCOCheckerPDFID]
			   ,[CreatedDate]
				  ,[UpdatedDate]				 
			  FROM [dbo].[aaintDisbursementSubmission]
			  where arn = @arn 				
				and BillingRunningID = 	@billingid	

			update aaIntDisbursementSubmission
			set RCOCheckerEmailAddress = null, 
				RCOCheckerDecision = null, 
				RCOCheckerSubmissionCompleted = null, 
				RCOCheckerRejectionReason = null,
				[RCOMakerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 				
				and BillingRunningID = 	@billingid	

		end 
		else
		begin
			update aaIntDisbursementSubmission
			set RCOCheckerEmailAddress = @RCOCheckerEmailAddress, 
				RCOCheckerDecision = @RCOCheckerDecision, 
				RCOCheckerSubmissionCompleted = @RCOCheckerSubmissionCompleted, 
				RCOCheckerRejectionReason = @RCOCheckerRejectionReason,	
				[RCOCheckerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 				
				and BillingRunningID = 	@billingid	

			update aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			set RCOCheckerEmail=@RCOCheckerEmailAddress,
				RCOCheckerApprovedDate= getdate()
			where arn = @arn 	
				and BillingRunningID = 	@billingid	
		end 

		 if (@RCOCheckerSubmissionCompleted=1)
		 begin
			insert into MortgageAppTaskInstance_billing_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
				,@billingid
			from MortgageAppTaskInstance_billing
			where workflow = 'DisbRCOCheckerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 

			delete from MortgageAppTaskInstance_billing
			where workflow = 'DisbRCOCheckerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 
		 end 

		 
		if ( @RCOCheckerSubmissionCompleted=1 and @RCOCheckerDecision = 'Approve')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Approved By RCO Checker',@RCOCheckerEmailAddress,null,getdate(), @billingid)
		end 		 

		if ( @RCOCheckerSubmissionCompleted=1 and @RCOCheckerDecision = 'Reject')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Rejected By RCO Checker',@RCOCheckerEmailAddress,null,getdate(), @billingid)
		end 

		 --payment detail history 
		if exists 
		(
			select 1
			from aaIntDisbursementSubmission
			where RCOCheckerSubmissionCompleted = 1 
				and arn = @arn 			
				and BillingRunningID = @billingid 
		)
		begin
			if exists 
			(
				select 1
				from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 
					and BillingRunningID = @billingid 
			)
			begin
				
				/*
				declare @runningid int 
				if not exists 
				(
					select 1
					from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 
				)
				begin
					set @runningid = 1
				end 
				else
				begin
					declare @previousmaxrunningid int 
					select @previousmaxrunningid = max(RunningIDForCompletedSubmission)
					from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 

					set @runningid = @previousmaxrunningid + 1
				end 
				*/
				insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
				select * from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					
				and BillingRunningID = @billingid 

				delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					
				and BillingRunningID = @billingid 
			end 

			/*
			declare @runningid2 int 
			if not exists 
			(
				select 1
				from aaIntDisbursementSubmission_History
				where arn = @arn 
			)
			begin
				set @runningid2 = 1
			end 
			else
			begin
				declare @previousmaxrunningid2 int 
				select @previousmaxrunningid2 = max(RunningIDForCompletedSubmission)
				from aaIntDisbursementSubmission_History
				where arn = @arn 

				set @runningid2 = @previousmaxrunningid + 1
			end 
			*/

			insert into aaIntDisbursementSubmission_History  
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
		   ,BillingRunningID)						
			SELECT IntSub.[arn]
				  ,IntSub.[BalanceAdviceLetterApplicableFlag]
				  ,IntSub.[UrgentFlag]
				  ,IntSub.[LS_RedemptionDueDateFlag]
				  ,IntSub.[LS_RedemptionDueDate]
				  ,IntSub.[LS_ExtendedCompletionDateFlag]
				  ,IntSub.[LS_CompletionDate]
				  ,IntSub.[LS_ExtendedCompletionDate]
				  ,IntSub.[PR_DeveloperBillingDueDateFlag]
				  ,IntSub.[PR_Stage2AFlag]
				  ,IntSub.[PR_Stage2BFlag]
				  ,IntSub.[PR_Stage2CFlag]
				  ,IntSub.[PR_Stage2DFlag]
				  ,IntSub.[PR_Stage2EFlag]
				  ,IntSub.[PR_Stage2FFlag]
				  ,IntSub.[PR_Stage2GFlag]
				  ,IntSub.[PR_Stage2HFlag]
				  ,IntSub.[PR_StageOthers]
				  ,IntSub.[PR_EarliestBillingDueDate]
				  ,IntSub.[PR_TotalBillingAmount]
				  ,IntSub.[PR_AnyBridgingFinancierFlag]
				  ,IntSub.[PR_BridgingFinancier]
				  ,IntSub.[PR_BridgingFinancierEmailAddress]
				  ,IntSub.[PR_BridgingFinancierRedemptionSum]
				  ,IntSub.[PR_RedemptionPaymentAccountNumber]
				  ,IntSub.[PR_BeneficiaryBank]
				  ,IntSub.[PR_BridgingFinancierRedemptionExpiryDate]
				  ,IntSub.[PR_DeveloperName]
				  ,IntSub.[PR_DeveloperEmailAddress]
				  ,IntSub.[PR_DeveloperPIC]
				  ,IntSub.[PR_DeveloperHDA]
				  ,IntSub.[PR_DeveloperHDABank]
				  ,IntSub.[LF_PayeeName]
				  ,IntSub.[LF_BilledAmount]
				  ,IntSub.[LF_AccountNumber]
				  ,IntSub.[LF_Bank]
				  ,IntSub.[LF_PaymentDescription]
				  ,IntSub.[LF_PaymentMode]
				  ,IntSub.[UpdateInfo_Reason]
				  ,IntSub.[UpdateInfo_Others]
				  ,IntSub.[CancelLoan_Remarks]
				  ,IntSub.[CancelLoan_File]
				  ,IntSub.[SolicitorSubmissionOption]
				  ,IntSub.[SolicitorSubmissionCompleted]
				  ,IntSub.[SolicitorCode]
				  ,IntSub.[SolicitorSubmissionDate]
				  ,IntSub.[SolicitorSubmissionPDFID]
				  ,IntSub.[DisbursementMakerEmailAddress]
				  ,IntSub.[DisbursementMakerDecision]
				  ,IntSub.[DisbursementMakerSubmissionCompleted]
				  ,IntSub.[DisbursementMakerRejectionReason]
				  ,IntSub.[DisbursementMakerSubmissionDate]
				  ,IntSub.[DisbursementMakerSubmissionPDFID]
				  ,IntSub.[DisbursementCheckerEmailAddress]
				  ,IntSub.[DisbursementCheckerDecision]
				  ,IntSub.[DisbursementCheckerSubmissionCompleted]
				  ,IntSub.[DisbursementCheckerRejectionReason]
				  ,IntSub.[DisbursementCheckerSubmissionDate]
				  ,IntSub.[DisbursementCheckerPDFID]
				  ,IntSub.[RCOMakerEmailAddress]
				  ,IntSub.[RCOMakerDecision]
				  ,IntSub.[RCOMakerSubmissionCompleted]
				  ,IntSub.[RCOMakerRejectionReason]
				  ,IntSub.[RCOMakerSubmissionDate]
				  ,IntSub.[RCOMakerPDFID]
				  ,IntSub.[RCOCheckerEmailAddress]
				  ,IntSub.[RCOCheckerDecision]
				  ,IntSub.[RCOCheckerSubmissionCompleted]
				  ,IntSub.[RCOCheckerRejectionReason]
				  ,IntSub.[RCOCheckerSubmissionDate]
				  ,IntSub.[RCOCheckerPDFID]
				  ,IntSub.[CreatedDate]
				  ,IntSub.[UpdatedDate]
				  ,IntSub.[BillingRunningID]				  
			  FROM [dbo].[aaIntDisbursementSubmission] IntSub
			  /*
			  left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 	
			*/
				where IntSub.arn = @arn 
				and IntSub.BillingRunningID = @billingid 

			delete from aaIntDisbursementSubmission
			where arn = @arn 				
			and BillingRunningID = @billingid 

			-- return RunningID
			SELECT top 1  @RunningIDForCompletedSubmission = BillingRunningID 
			FROM aaIntDisbursementSubmission_History 
			where arn = @arn 				
			order by BillingRunningID desc
		end 
	end

end