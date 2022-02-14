CREATE                  procedure [dbo].[ddProjectDisbursementSubmission__RCOmaker_Main]
@arn nvarchar(max) = null ,
@billingid bigint = null, 
@RCOMakerEmailAddress  nvarchar(max) = null ,
@RCOMakerDecision nvarchar(max) = null ,
@RCOMakerSubmissionCompleted nvarchar(max) = null ,
@RCOMakerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	if (@RCOMakerEmailAddress like 'K2:%')
	begin		
		set @RCOMakerEmailAddress = Stuff(@RCOMakerEmailAddress, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
	begin
		if (ltrim(rtrim(@RCOMakerRejectionReason)) = '' or @RCOMakerRejectionReason is null)
		begin
			set @Error = 'Please fill in Remarks'
		end 
		
	end 

	

	if (@Error = '')
	begin						
		/*
		delete from [aaIntDisbursementSubmission_RCOMakerRejected]
		where arn = @arn
			and BillingRunningID = 	@billingid	
		*/

		/*
		if (@RCOMakerDecision = 'Reject' and @RCOMakerSubmissionCompleted = 1)
		begin
			INSERT INTO [dbo].[aaIntDisbursementSubmission_RCOMakerRejected]
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
				,@RCOMakerDecision
			   ,@RCOMakerSubmissionCompleted
			   ,@RCOMakerRejectionReason
			   ,getdate()
			   ,[RCOMakerPDFID]
			   ,[RCOCheckerEmailAddress]
			   ,[RCOCheckerDecision]
			   ,[RCOCheckerSubmissionCompleted]
			   ,[RCOCheckerRejectionReason]
			   ,[RCOCheckerSubmissionDate]
			   ,[RCOCheckerPDFID]
			   ,[CreatedDate]
				  ,[UpdatedDate]				
			  FROM [dbo].[aaintDisbursementSubmission]
			  where arn = @arn 
			  and BillingRunningID = 	@billingid	

			update aaIntDisbursementSubmission
			set RCOMakerEmailAddress = null, 
				RCOMakerDecision = null, 
				RCOMakerSubmissionCompleted = null, 
				RCOMakerRejectionReason = null,
				[DisbursementCheckerSubmissionCompleted] = 0,				
				[UpdatedDate] = getdate()
			where arn = @arn 				
			and BillingRunningID = 	@billingid	

		end 
		else
		begin
			update aaIntDisbursementSubmission
			set RCOMakerEmailAddress = @RCOMakerEmailAddress, 
				RCOMakerDecision = @RCOMakerDecision, 
				RCOMakerSubmissionCompleted = @RCOMakerSubmissionCompleted, 
				RCOMakerRejectionReason = @RCOMakerRejectionReason,	
				[RCOMakerSubmissionDate] = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 			
			and BillingRunningID = 	@billingid	
			
			update aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			set RCOMakerEmail=@RCOMakerEmailAddress,
				RCOMakerApprovedDate= getdate()
			where arn = @arn 		
			and BillingRunningID = 	@billingid	
		end 
		*/
		
		update ddProjectDisbursementSubmission_RCOMaker
		set RCOMakerEmailAddress = @RCOMakerEmailAddress, 
			RCOMakerDecision = @RCOMakerDecision, 
			RCOMakerSubmissionCompleted = @RCOMakerSubmissionCompleted, 
			RCOMakerRejectionReason = @RCOMakerRejectionReason,	
			[RCOMakerSubmissionDate] = getdate(),
			[UpdatedDate] = getdate()
		where arn = @arn 			
		and BillingRunningID = 	@billingid	
			

		if (@RCOMakerSubmissionCompleted=1)
		begin
			insert into ddProject_MortgageAppTaskInstance_logs 
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
			from ddProject_MortgageAppTaskInstance
			where workflow = 'DisbRCOMakerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 

			delete from ddProject_MortgageAppTaskInstance
			where workflow = 'DisbRCOMakerBillingApproval'
			and arn = @arn 
			and BillingRunningID = @billingid 
			
			-- add record to workflow history for approved
			if ( @RCOMakerSubmissionCompleted=1 and @RCOMakerDecision = 'Approve')
			begin
				insert into WorkflowHistory_ProjectBilling
				values ('Disbursement By Developer- RCO Maker',@arn,'Case Approved By RCO Maker',@RCOMakerEmailAddress,null,getdate(), @billingid)
			end 		 

			/*
			-- add record to workflow history for reject
			if ( @RCOMakerSubmissionCompleted=1 and @RCOMakerDecision = 'Reject')
			begin
				insert into WorkflowHistory_Billing
				values ('Progressive Billing',@arn,'Case Rejected By RCO Maker',@RCOMakerEmailAddress,null,getdate(), @billingid)
			end 
			*/

			-- update rco maker info into payment table
			if exists 
			(
				select 1
				from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
				where arn = @arn 
					and BillingRunningID = 	@billingid	
			)
			begin

				update ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
				set RCOMakerEmail = @RCOMakerEmailAddress,
					RCOMakerApprovedDate = getdate()
				where arn = @arn 
					and BillingRunningID = 	@billingid	

			end 

			-- move table to history
			if exists 
			(
				select 1
				from ddProjectDisbursementSubmission_RCOMaker
				where RCOMakerSubmissionCompleted = 1 
					and arn = @arn 
					and BillingRunningID = 	@billingid	
			)
			begin
			
				insert into ddProjectDisbursementSubmission_RCOMaker_History
				select * 
				from ddProjectDisbursementSubmission_RCOMaker
				where arn = @arn 
					and BillingRunningID = 	@billingid	

				delete from ddProjectDisbursementSubmission_RCOMaker
				where arn = @arn 
					and BillingRunningID = 	@billingid	
				
				if exists 
				(
					select 1
					from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
					where arn = @arn 
						and BillingRunningID = 	@billingid	
				)
				begin				
				
					insert into ddProjectDisbursementSubmission_RCOMaker_PaymentDetail_History
					select * from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
					where arn = @arn 
						and BillingRunningID = 	@billingid	

					delete from ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
					where arn = @arn					
						and BillingRunningID = 	@billingid	

				end 
			
			
			end 
		
		 end

		/*
		if ( @RCOMakerSubmissionCompleted=1 and @RCOMakerDecision = 'Approve')
		begin
			
			--payment detail history 
			if exists 
			(
				select 1
				from aaIntDisbursementSubmission
				where RCOMakerSubmissionCompleted = 1 
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
								
					insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					select * from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 					
					and BillingRunningID = @billingid 
					

					delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 					
					and BillingRunningID = @billingid 
				end 
			

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
		 */
	end 
end