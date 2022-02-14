CREATE procedure [dbo].[aa_SolDisbursementSubmission_RCOChecker_Main]
@arn nvarchar(max) = null ,
@RCOCheckerEmailAddress  nvarchar(max) = null ,
@RCOCheckerDecision nvarchar(max) = null ,
@RCOCheckerSubmissionCompleted nvarchar(max) = null ,
@RCOCheckerRejectionReason nvarchar(max) = null ,
@Error nvarchar(max) = null output ,
@outRunningIDForCompletedSubmission bigint = null output
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
			set @Error = 'Please fill in Rejection Remarks'
		end 
	end 

	if (@Error = '')
	begin		
		delete from [aaSolDisbursementSubmission_RCOCheckerRejected]
		where arn = @arn 

		if (@RCOCheckerDecision = 'Reject' and @RCOCheckerSubmissionCompleted = 1)
		begin
						
			
		INSERT INTO [dbo].[aaSolDisbursementSubmission_RCOCheckerRejected]
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
           ,[UpdatedDate])
		   
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
			  ,@RCOCheckerEmailAddress
			  ,@RCOCheckerDecision
			  ,@RCOCheckerSubmissionCompleted
			  ,@RCOCheckerRejectionReason
			  ,getdate()
			  ,null
			  ,[CreatedDate]
			  ,getdate()
		  FROM [dbo].aaSolDisbursementSubmission_DisMakerSubmission
		  where arn = @arn 

		  update aaSolDisbursementSubmission_DisMakerSubmission
			set [RCOCheckerEmailAddress] = null, 
				[RCOCheckerDecision] = null, 
				[RCOCheckerSubmissionCompleted] = null, 
				[RCOCheckerRejectionReason] = null,
				RCOCheckerSubmissionDate = null,
				[RCOMakerSubmissionCompleted] = 0, 
				[UpdatedDate] = getdate()
			where arn = @arn 
			
			insert into MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
			from MortgageAppTaskInstance
			where workflow = 'DisbRCOCheckerSolicitorApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
			where workflow = 'DisbRCOCheckerSolicitorApproval'
			and arn = @arn 

			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Disbursement Rejected By RCO Checker',@RCOCheckerEmailAddress,null,getdate())

		end 
		else
		begin
			update aaSolDisbursementSubmission_DisMakerSubmission
			set [RCOCheckerEmailAddress] = @RCOCheckerEmailAddress, 
				[RCOCheckerDecision] = @RCOCheckerDecision, 
				[RCOCheckerSubmissionCompleted] = @RCOCheckerSubmissionCompleted, 
				[RCOCheckerRejectionReason] = @RCOCheckerRejectionReason,				
				RCOCheckerSubmissionDate = getdate(),
				[UpdatedDate] = getdate()
			where arn = @arn 

			declare @SolicitorSubmissionOption nvarchar(max)

			select @SolicitorSubmissionOption  = SolicitorSubmissionOption
			from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn

			if ((@SolicitorSubmissionOption = 'Submitted' or @SolicitorSubmissionOption = 'Resubmitted') and @RCOCheckerDecision = 'Approve' and @RCOCheckerSubmissionCompleted = 1)
			begin
				insert into MortgageAppTaskInstance_logs 
				select [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,[UpdatedUser]
					, 0
					, 1
				from MortgageAppTaskInstance
				where workflow = 'DisbRCOCheckerSolicitorApproval'
				and arn = @arn 

				delete from MortgageAppTaskInstance
				where workflow = 'DisbRCOCheckerSolicitorApproval'
				and arn = @arn 

				insert into WorkflowHistory
				values ('Disbursement By Solicitor',@arn,'Disbursement Approved By RCO Checker',@RCOCheckerEmailAddress,null,getdate())

				if exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
				)
				begin

					update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					set RCOCheckerEmail = @RCOCheckerEmailAddress,
						RCOCheckerApprovedDate = getdate()
					where arn = @arn 

				end 
			end 
			
		end 
		
		
		if exists 
		(
			select 1
			from aaSolDisbursementSubmission_DisMakerSubmission
			where RCOCheckerSubmissionCompleted = 1 
				and arn = @arn 
		)
		begin
			
			-- move aaSolDisbursementSubmission_PaymentDetail to aaSolDisbursementSubmission_PaymentDetail_history
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 
			)
			begin
				insert into aaSolDisbursementSubmission_PaymentDetail_history
				select * from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 				

				delete from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn					

				/*
				declare @RunningIDForCompletedSubmission2 int 
				if not exists 
				(
					select 1
					from aaSolDisbursementSubmission_PaymentDetail_history
					where arn = @arn 
				)
				begin
					set @RunningIDForCompletedSubmission2 = 1
				end 
				else
				begin
					declare @LastMaxRunningIDForCompletedSubmission2 int 
					select @LastMaxRunningIDForCompletedSubmission2 = max(RunningIDForCompletedSubmission)
					from aaSolDisbursementSubmission_PaymentDetail_history
					where arn = @arn 

					set @RunningIDForCompletedSubmission2 = @LastMaxRunningIDForCompletedSubmission2 + 1
				end 

				declare @RecordCount2 bigint 
				select @RecordCount2 = count(*) 
				from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 								

				declare @aaSolDisbursementSubmission_PaymentDetail_runningid bigint 
				while @RecordCount2 >0
				begin
					select top 1 @aaSolDisbursementSubmission_PaymentDetail_runningid = RunningIDForCurrentSubmission
					from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn 
					order by RunningIDForCurrentSubmission asc 

					insert into aaSolDisbursementSubmission_PaymentDetail_history
					select top 1 *,@RunningIDForCompletedSubmission2 from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn 
					order by RunningIDForCurrentSubmission asc 

					delete from aaSolDisbursementSubmission_PaymentDetail
					where arn = @arn
						and RunningIDForCurrentSubmission = @aaSolDisbursementSubmission_PaymentDetail_runningid

					set @RunningIDForCompletedSubmission2 = @RunningIDForCompletedSubmission2 + 1

					select @RecordCount2 = count(*) 
					from aaSolDisbursementSubmission_PaymentDetail 
					where arn = @arn 
				end 
				*/
			end 
			
			-- move aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail to aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 
			)
			begin
				insert into aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
				select * from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 
				--order by RunningIDForCurrentSubmission asc 

				delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
				where arn = @arn 					

				 /*
				 declare @RunningIDForCompletedSubmission3 int 
				if not exists 
				(
					select 1
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 
				)
				begin
					set @RunningIDForCompletedSubmission3 = 1
				end 
				else
				begin
					declare @LastMaxRunningIDForCompletedSubmission3 int 
					select @LastMaxRunningIDForCompletedSubmission3 = max(RunningIDForCompletedSubmission)
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					where arn = @arn 

					set @RunningIDForCompletedSubmission3 = @LastMaxRunningIDForCompletedSubmission3 + 1
				end 

				declare @RecordCount3 bigint 
				select @RecordCount3 = count(*) 
				from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail 
				where arn = @arn 								

				declare @aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_runningid bigint 
				while @RecordCount3 >0
				begin
					select top 1 @aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_runningid = RunningIDForCurrentSubmission
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
					order by RunningIDForCurrentSubmission asc 

					insert into aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history
					select top 1 *,@RunningIDForCompletedSubmission3 from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
					order by RunningIDForCurrentSubmission asc 

					delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
					where arn = @arn 
						and RunningIDForCurrentSubmission= @aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_runningid

					set @RunningIDForCompletedSubmission3 = @RunningIDForCompletedSubmission3 + 1

					select @RecordCount3 = count(*) 
					from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail 
					where arn = @arn 
				end 
				*/
						
			end 
			
			-- move aaSolDisbursementSubmission to aaSolDisbursementSubmission_History
			insert into aaSolDisbursementSubmission_History
			select * 
			from aaSolDisbursementSubmission
			where arn = @arn 
			
			delete from aaSolDisbursementSubmission
			where arn = @arn 

			insert into aaSolDisbursementSubmission_DisMakerSubmission_History
			select * 
			from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn 
			
			delete from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn 

			/*
			declare @RunningIDForCompletedSubmission int 
			if not exists 
			(
				select 1
				from aaSolDisbursementSubmission_History
				where arn = @arn 
			)
			begin
				set @RunningIDForCompletedSubmission = 1
			end 
			else
			begin
				declare @LastMaxRunningIDForCompletedSubmission int 
				select @LastMaxRunningIDForCompletedSubmission = max(RunningIDForCompletedSubmission)
				from aaSolDisbursementSubmission_History
				where arn = @arn 

				set @RunningIDForCompletedSubmission = @LastMaxRunningIDForCompletedSubmission + 1
			end 

			insert into aaSolDisbursementSubmission_History
			select * , @RunningIDForCompletedSubmission
			from aaSolDisbursementSubmission
			where arn = @arn 
			
			delete from aaSolDisbursementSubmission
			where arn = @arn 
			*/
			-- return RunningIDForCompletedSubmission
			SELECT top 1  @outRunningIDForCompletedSubmission = RunningIDForCompletedSubmission 
			FROM aaSolDisbursementSubmission_DisMakerSubmission_History 
			where arn = @arn 				
			order by RunningIDForCompletedSubmission desc
		end 
		
	end

end