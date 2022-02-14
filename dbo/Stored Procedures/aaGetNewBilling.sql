CREATE     procedure [dbo].[aaGetNewBilling]

as

begin
       declare @CDC nvarchar(max), @sql nvarchar(max), @NewCDC datetime 

	   declare @doctype nvarchar(max)

	   set @doctype = 'CRA06 Billings'

       select @CDC= newBillingCDC
       from tblCDC

       declare @VersionTblName nvarchar(max)

       select @VersionTblName= [VersionTblName]	   	   
       --select * 
	   FROM [EDMSDBSERVER].[HLBB_DMS].[dbo].[TblDocProfile]
       where ProfileName = 'MG-Mortgage'
	   
		set @sql = '
			select top 1 @NewCDC = DateModified
				from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
				inner join (
							select RecID, max(version) as version
							from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
							where field6=  '''+@doctype+'''
							group by RecID
							) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
				where tbl.DateCreated > @CDC 			
				
				order by DateModified desc'
		
		--select @sql

		--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
		EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max),@NewCDC datetime OUTPUT' , @CDC  , @NewCDC OUTPUT
 		
		if (@NewCDC is not null )
		begin
			TRUNCATE TABLE aaIntDisbursement_New_Billing_Staging

			set @sql = '
				insert into aaIntDisbursement_New_Billing_Staging (RowNumber,ARN)
				select ROW_NUMBER() OVER(ORDER BY tbl100.arn ASC) AS RowNumber,tbl100.arn
				from (
					select tbl.field3 as [ARN]
					from [EDMSDBSERVER].[HLBB_DMS].[dbo].' + @VersionTblName + ' tbl
					inner join (
								select RecID, max(version) as version
								from [EDMSDBSERVER].[HLBB_DMS].[dbo].'+ @VersionTblName +'
								where field6=  '''+@doctype+'''
								group by RecID
								) temp on temp.RecID = tbl.RecID and tbl.Version = temp.version
					where tbl.DateCreated > @CDC 
				  
					) tbl100' 
			--and tbl.field3 COLLATE Latin1_General_CI_AS not in (select arn COLLATE Latin1_General_CI_AS from SQLLOADS) 
			EXECUTE sp_executesql @SQL, N'@CDC NVARCHAR(max)', @CDC  
		
			if (@NewCDC	<> '' or @NewCDC is not null)
			begin
				update tblCDC
				set tempBillingCDC = @NewCDC	
			end 	;	
			
			-- 20210319- start update pr info to the latest approved by checker 

			-- new billing if sol disbursement submission is completed 
			
			INSERT INTO [dbo].[aaIntDisbursementSubmission]
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
		   
		   )
			select 
				staging.[arn] as [arn]
			  ,null  as [BalanceAdviceLetterApplicableFlag]
			  ,null  as [UrgentFlag]
			  ,null  as [LS_RedemptionDueDateFlag]
			  ,null  as [LS_RedemptionDueDate]
			  ,null  as [LS_ExtendedCompletionDateFlag]
			  ,null  as [LS_CompletionDate]
			  ,null  as [LS_ExtendedCompletionDate]			  
			  /*
			  ,LastApprovedInfo.[PR_DeveloperBillingDueDateFlag]
			  ,LastApprovedInfo.[PR_Stage2AFlag]
			  ,LastApprovedInfo.[PR_Stage2BFlag]
			  ,LastApprovedInfo.[PR_Stage2CFlag]
			  ,LastApprovedInfo.[PR_Stage2DFlag]
			  ,LastApprovedInfo.[PR_Stage2EFlag]
			  ,LastApprovedInfo.[PR_Stage2FFlag]
			  ,LastApprovedInfo.[PR_Stage2GFlag]
			  ,LastApprovedInfo.[PR_Stage2HFlag]
			  ,LastApprovedInfo.[PR_StageOthers]
			  ,LastApprovedInfo.[PR_EarliestBillingDueDate]
			  ,LastApprovedInfo.[PR_TotalBillingAmount]
			  */
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
			  -- 20211231 - remove last approved info 
			  /*
			  ,LastApprovedInfo.[PR_AnyBridgingFinancierFlag]
			  ,LastApprovedInfo.[PR_BridgingFinancier]
			  ,LastApprovedInfo.[PR_BridgingFinancierEmailAddress]
			  ,LastApprovedInfo.[PR_BridgingFinancierRedemptionSum]
			  ,LastApprovedInfo.[PR_RedemptionPaymentAccountNumber]
			  ,LastApprovedInfo.[PR_BeneficiaryBank]
			  ,LastApprovedInfo.[PR_BridgingFinancierRedemptionExpiryDate]
			  ,LastApprovedInfo.[PR_DeveloperName]
			  ,LastApprovedInfo.[PR_DeveloperEmailAddress]
			  ,LastApprovedInfo.[PR_DeveloperPIC]
			  ,LastApprovedInfo.[PR_DeveloperHDA]
			  ,LastApprovedInfo.[PR_DeveloperHDABank]
			  ,LastApprovedInfo.[LF_PayeeName]
			  ,LastApprovedInfo.[LF_BilledAmount]
			  ,LastApprovedInfo.[LF_AccountNumber]
			  ,LastApprovedInfo.[LF_Bank]
			  ,LastApprovedInfo.[LF_PaymentDescription]
			  ,LastApprovedInfo.[LF_PaymentMode]
			  */
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
			  ,null  as [UpdateInfo_Reason] 
			  ,null  as [UpdateInfo_Others]
			  ,null  as [CancelLoan_Remarks]
			  ,null  as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,null  as [SolicitorSubmissionCompleted]
			  ,sqlloads.SolicitorCode  as [SolicitorCode]
			  ,getdate()  as [SolicitorSubmissionDate]
			  ,null  as [SolicitorSubmissionPDFID]
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
			  ,null as [FinalBillingFlag]
			   ,null as [ProjectSubmissionOption]
			   ,null as [ProjectSubmissionCompleted]
			   ,sqlloads.[DeveloperCode] as [DeveloperCode]
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
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 
			from aaIntDisbursement_New_Billing_Staging staging 
			-- 20211231 - remove last approved info 
			/*
			left join 
			(
				select [vw_aaDisbursementHistory].[arn]
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
				--,[BillingRunningID]
				,[RunningIDForCompletedSubmission]
				from [vw_aaDisbursementHistory]
				
				
				inner join 
				(
				select arn, max(UpdatedDate) as LastApprovedDate
				from [vw_aaDisbursementHistory]
				where 
					(submissionfrom = 'bank' and DisbursementMakerDecision = 'Submit')
					or 
					(submissionfrom = 'Solicitor' and SolicitorSubmissionOption <> 'Cancelled')
				group by arn 
				) DisHistory on DisHistory.arn = [vw_aaDisbursementHistory].arn and DisHistory.LastApprovedDate = [vw_aaDisbursementHistory].UpdatedDate
			) LastApprovedInfo on LastApprovedInfo.arn = staging.arn 
			*/
			left join sqlloads on sqlloads.arn = staging.arn 

			-- 20210319- end update pr info to the latest approved by checker 

			/*
			-- (UNDO CHANGE) 20210401- start update pr info to the first approved by checker
			with cte1 (arn, firstRunningIDForCompletedSubmission) as
			(
				select arn,  min(RunningIDForCompletedSubmission) as firstRunningIDForCompletedSubmission
				from aaSolDisbursementSubmission_DisMakerSubmission_History
				group by arn 
			),
			FirstAdviceInfo (
					arn, 
					firstRunningIDForCompletedSubmission
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
				) as 
			(
				select cte1.arn, 
					cte1.firstRunningIDForCompletedSubmission 
					,h.[PR_DeveloperBillingDueDateFlag]
				  ,h.[PR_Stage2AFlag]
				  ,h.[PR_Stage2BFlag]
				  ,h.[PR_Stage2CFlag]
				  ,h.[PR_Stage2DFlag]
				  ,h.[PR_Stage2EFlag]
				  ,h.[PR_Stage2FFlag]
				  ,h.[PR_Stage2GFlag]
				  ,h.[PR_Stage2HFlag]
				  ,h.[PR_StageOthers]
				  ,h.[PR_EarliestBillingDueDate]
				  ,h.[PR_TotalBillingAmount]
				  ,h.[PR_AnyBridgingFinancierFlag]
				  ,h.[PR_BridgingFinancier]
				  ,h.[PR_BridgingFinancierEmailAddress]
				  ,h.[PR_BridgingFinancierRedemptionSum]
				  ,h.[PR_RedemptionPaymentAccountNumber]
				  ,h.[PR_BeneficiaryBank]
				  ,h.[PR_BridgingFinancierRedemptionExpiryDate]
				  ,h.[PR_DeveloperName]
				  ,h.[PR_DeveloperEmailAddress]
				  ,h.[PR_DeveloperPIC]
				  ,h.[PR_DeveloperHDA]
				  ,h.[PR_DeveloperHDABank]
				  ,h.[LF_PayeeName]
				  ,h.[LF_BilledAmount]
				  ,h.[LF_AccountNumber]
				  ,h.[LF_Bank]
				  ,h.[LF_PaymentDescription]
				  ,h.[LF_PaymentMode]
				from cte1
					inner join aaSolDisbursementSubmission_DisMakerSubmission_History h on h.arn = cte1.arn and h.RunningIDForCompletedSubmission= cte1.firstRunningIDForCompletedSubmission
			)	
			insert into aaIntDisbursementSubmission
			select 
				staging.[arn] as [arn]
			  ,null  as [BalanceAdviceLetterApplicableFlag]
			  ,null  as [UrgentFlag]
			  ,null  as [LS_RedemptionDueDateFlag]
			  ,null  as [LS_RedemptionDueDate]
			  ,null  as [LS_ExtendedCompletionDateFlag]
			  ,null  as [LS_CompletionDate]
			  ,null  as [LS_ExtendedCompletionDate]			  
			  ,FirstAdviceInfo.[PR_DeveloperBillingDueDateFlag]
			  ,FirstAdviceInfo.[PR_Stage2AFlag]
			  ,FirstAdviceInfo.[PR_Stage2BFlag]
			  ,FirstAdviceInfo.[PR_Stage2CFlag]
			  ,FirstAdviceInfo.[PR_Stage2DFlag]
			  ,FirstAdviceInfo.[PR_Stage2EFlag]
			  ,FirstAdviceInfo.[PR_Stage2FFlag]
			  ,FirstAdviceInfo.[PR_Stage2GFlag]
			  ,FirstAdviceInfo.[PR_Stage2HFlag]
			  ,FirstAdviceInfo.[PR_StageOthers]
			  ,FirstAdviceInfo.[PR_EarliestBillingDueDate]
			  ,FirstAdviceInfo.[PR_TotalBillingAmount]
			  ,FirstAdviceInfo.[PR_AnyBridgingFinancierFlag]
			  ,FirstAdviceInfo.[PR_BridgingFinancier]
			  ,FirstAdviceInfo.[PR_BridgingFinancierEmailAddress]
			  ,FirstAdviceInfo.[PR_BridgingFinancierRedemptionSum]
			  ,FirstAdviceInfo.[PR_RedemptionPaymentAccountNumber]
			  ,FirstAdviceInfo.[PR_BeneficiaryBank]
			  ,FirstAdviceInfo.[PR_BridgingFinancierRedemptionExpiryDate]
			  ,FirstAdviceInfo.[PR_DeveloperName]
			  ,FirstAdviceInfo.[PR_DeveloperEmailAddress]
			  ,FirstAdviceInfo.[PR_DeveloperPIC]
			  ,FirstAdviceInfo.[PR_DeveloperHDA]
			  ,FirstAdviceInfo.[PR_DeveloperHDABank]
			  ,FirstAdviceInfo.[LF_PayeeName]
			  ,FirstAdviceInfo.[LF_BilledAmount]
			  ,FirstAdviceInfo.[LF_AccountNumber]
			  ,FirstAdviceInfo.[LF_Bank]
			  ,FirstAdviceInfo.[LF_PaymentDescription]
			  ,FirstAdviceInfo.[LF_PaymentMode]
			  ,null  as [UpdateInfo_Reason] 
			  ,null  as [UpdateInfo_Others]
			  ,null  as [CancelLoan_Remarks]
			  ,null  as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,null  as [SolicitorSubmissionCompleted]
			  ,null  as [SolicitorCode]
			  ,getdate()  as [SolicitorSubmissionDate]
			  ,null  as [SolicitorSubmissionPDFID]
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
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 
			from aaIntDisbursement_New_Billing_Staging staging 
				left join FirstAdviceInfo on FirstAdviceInfo.arn = staging.arn 
			-- 20210401- end 
			*/


			declare  @arn nvarchar(max),  @BillingID bigint
			DECLARE cursor_LoadsStaging CURSOR
			FOR SELECT staging.arn ,
					tbl1.BillingRunningID 
				FROM 
					aaIntDisbursement_New_Billing_Staging staging
				INNER JOIN (select arn, max(BillingRunningID) as BillingRunningID from aaIntDisbursementSubmission group by arn) tbl1 on tbl1.arn = staging.arn 

			OPEN cursor_LoadsStaging;

			FETCH NEXT FROM cursor_LoadsStaging INTO 
				@arn, 
				@BillingID				
				;

			WHILE @@FETCH_STATUS = 0
			BEGIN							
				insert into WorkflowHistory_Billing
				values ('Progressive Billing',@arn,'Case Retrieved From EDMS',null,null,getdate(),@BillingID)

				/*
				--start locate last billing dis maker and assign to him/her. 
				declare @LastDisMaker nvarchar(max)

				select top 1 @LastDisMaker= taskowner 
				from [MortgageAppTaskInstance_billing]
				where workflow = 'DisbDUMakerBillingApproval'
					and arn = @arn 
				order by updateddate desc 

				if (isnull(@LastDisMaker,'') <> '')
				begin
	
					insert into MortgageAppTaskInstance_billing
					values ('DisbDUMakerBillingApproval', @arn, @LastDisMaker, getdate(), getdate(), @LastDisMaker, @LastDisMaker, @billingid)

					insert into WorkflowHistory_Billing
					values ('Progressive Billing',@arn,'Case Accepted By Disbursement Maker',@LastDisMaker,null,getdate(), @billingid)
				end 		
				else
				begin
					--start locate last billing dis maker from logs. 
					declare @LastDisMakerFromLog nvarchar(max)

					select top 1 @LastDisMakerFromLog= taskowner 
					from [MortgageAppTaskInstance_Billing_logs]
					where workflow = 'DisbDUMakerBillingApproval'
						and Completed = 1
						and arn = @arn 
					order by updateddate desc

					if (isnull(@LastDisMakerFromLog,'') <> '')
					begin
						insert into MortgageAppTaskInstance_billing
						values ('DisbDUMakerBillingApproval', @arn, @LastDisMakerFromLog, getdate(), getdate(), @LastDisMakerFromLog, @LastDisMakerFromLog, @billingid)

						insert into WorkflowHistory_Billing
						values ('Progressive Billing',@arn,'Case Accepted By Disbursement Maker',@LastDisMakerFromLog,null,getdate(), @billingid)
					end 

					--start locate last billing dis maker from logs. 
				end 
				--end locate last billing dis maker and assign to him/her. 
				*/

								
				FETCH NEXT FROM cursor_LoadsStaging INTO 
					@arn, 
					@BillingID					
			END;

			CLOSE cursor_LoadsStaging;

			DEALLOCATE cursor_LoadsStaging;		


			/*
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 
			*/
			/*
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
				
			where currentsubmission.arn is null
				--and solsubhistory.SolicitorSubmissionCompleted = 1
				and solsubhistory.DisbursementCheckerSubmissionCompleted = 1
			*/
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where (currentsubmission.arn is null 
					or 				
					currentsubmission.DisbursementCheckerSubmissionCompleted = 1
					)
				and solsubhistory.SolicitorSubmissionCompleted = 1					
			*/
			
			/*
			-- new billing if sol disbursement submission is not completed 
			insert into aaIntDisbursementSubmission
			select 
				staging.[arn] as [arn]
			  ,solsubhistory.[BalanceAdviceLetterApplicableFlag] as [BalanceAdviceLetterApplicableFlag]
			  ,solsubhistory.[UrgentFlag] as [UrgentFlag]
			  ,solsubhistory.[LS_RedemptionDueDateFlag] as [LS_RedemptionDueDateFlag]
			  ,solsubhistory.[LS_RedemptionDueDate] as [LS_RedemptionDueDate]
			  ,solsubhistory.[LS_ExtendedCompletionDateFlag] as [LS_ExtendedCompletionDateFlag]
			  ,solsubhistory.[LS_CompletionDate] as [LS_CompletionDate]
			  ,solsubhistory.[LS_ExtendedCompletionDate] as [LS_ExtendedCompletionDate]
			  ,solsubhistory.[PR_DeveloperBillingDueDateFlag] as [PR_DeveloperBillingDueDateFlag]
			  ,solsubhistory.[PR_Stage2AFlag] as [PR_Stage2AFlag]
			  ,solsubhistory.[PR_Stage2BFlag] as [PR_Stage2BFlag]
			  ,solsubhistory.[PR_Stage2CFlag] as [PR_Stage2CFlag]
			  ,solsubhistory.[PR_Stage2DFlag] as [PR_Stage2DFlag]
			  ,solsubhistory.[PR_Stage2EFlag] as [PR_Stage2EFlag]
			  ,solsubhistory.[PR_Stage2FFlag] as [PR_Stage2FFlag]
			  ,solsubhistory.[PR_Stage2GFlag] as [PR_Stage2GFlag]
			  ,solsubhistory.[PR_Stage2HFlag] as [PR_Stage2HFlag]
			  ,solsubhistory.[PR_StageOthers] as [PR_StageOthers]
			  ,solsubhistory.[PR_EarliestBillingDueDate] as [PR_EarliestBillingDueDate]
			  ,solsubhistory.[PR_TotalBillingAmount] as [PR_TotalBillingAmount]
			  ,solsubhistory.[PR_AnyBridgingFinancierFlag] as [PR_AnyBridgingFinancierFlag]
			  ,solsubhistory.[PR_BridgingFinancier] as [PR_BridgingFinancier]
			  ,solsubhistory.[PR_BridgingFinancierEmailAddress] as [PR_BridgingFinancierEmailAddress]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionSum] as [PR_BridgingFinancierRedemptionSum]
			  ,solsubhistory.[PR_RedemptionPaymentAccountNumber] as [PR_RedemptionPaymentAccountNumber]
			  ,solsubhistory.[PR_BeneficiaryBank] as [PR_BeneficiaryBank]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate] as [PR_BridgingFinancierRedemptionExpiryDate]
			  ,solsubhistory.[PR_DeveloperName] as [PR_DeveloperName]
			  ,solsubhistory.[PR_DeveloperEmailAddress] as [PR_DeveloperEmailAddress]
			  ,solsubhistory.[PR_DeveloperPIC] as [PR_DeveloperPIC]
			  ,solsubhistory.[PR_DeveloperHDA] as [PR_DeveloperHDA]
			  ,solsubhistory.[PR_DeveloperHDABank] as [PR_DeveloperHDABank]
			  ,solsubhistory.[LF_PayeeName] as [LF_PayeeName]
			  ,solsubhistory.[LF_BilledAmount] as [LF_BilledAmount]
			  ,solsubhistory.[LF_AccountNumber] as [LF_AccountNumber]
			  ,solsubhistory.[LF_Bank] as [LF_Bank]
			  ,solsubhistory.[LF_PaymentDescription] as [LF_PaymentDescription]
			  ,solsubhistory.[LF_PaymentMode] as [LF_PaymentMode]
			  ,solsubhistory.[UpdateInfo_Reason] as [UpdateInfo_Reason] 
			  ,solsubhistory.[UpdateInfo_Others] as [UpdateInfo_Others]
			  ,solsubhistory.[CancelLoan_Remarks] as [CancelLoan_Remarks]
			  ,solsubhistory.[CancelLoan_File] as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,solsubhistory.[SolicitorSubmissionCompleted] as [SolicitorSubmissionCompleted]
			  ,solsubhistory.[SolicitorCode] as [SolicitorCode]
			  ,solsubhistory.[SolicitorSubmissionDate] as [SolicitorSubmissionDate]
			  ,solsubhistory.[SolicitorSubmissionPDFID] as [SolicitorSubmissionPDFID]
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
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 
			from aaIntDisbursement_New_Billing_Staging staging 
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 	
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where (currentsubmission.arn is null 
					or 				
					currentsubmission.DisbursementCheckerSubmissionCompleted = 1
					)
				and solsubhistory.SolicitorSubmissionCompleted = 1					
			*/
			where currentsubmission.arn is not null
				--and solsubhistory.SolicitorSubmissionCompleted = 1
				and solsubhistory.DisbursementCheckerSubmissionCompleted = 1
			*/

			/*
			-- new billing(pending LA) if sol disbursement submission is not completed 
			insert into aaIntDisbursementSubmission_pendingLA   ([arn]
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
           ,[UpdatedDate] )
			select 
				staging.[arn] as [arn]
			  ,solsubhistory.[BalanceAdviceLetterApplicableFlag] as [BalanceAdviceLetterApplicableFlag]
			  ,solsubhistory.[UrgentFlag] as [UrgentFlag]
			  ,solsubhistory.[LS_RedemptionDueDateFlag] as [LS_RedemptionDueDateFlag]
			  ,solsubhistory.[LS_RedemptionDueDate] as [LS_RedemptionDueDate]
			  ,solsubhistory.[LS_ExtendedCompletionDateFlag] as [LS_ExtendedCompletionDateFlag]
			  ,solsubhistory.[LS_CompletionDate] as [LS_CompletionDate]
			  ,solsubhistory.[LS_ExtendedCompletionDate] as [LS_ExtendedCompletionDate]
			  ,solsubhistory.[PR_DeveloperBillingDueDateFlag] as [PR_DeveloperBillingDueDateFlag]
			  ,solsubhistory.[PR_Stage2AFlag] as [PR_Stage2AFlag]
			  ,solsubhistory.[PR_Stage2BFlag] as [PR_Stage2BFlag]
			  ,solsubhistory.[PR_Stage2CFlag] as [PR_Stage2CFlag]
			  ,solsubhistory.[PR_Stage2DFlag] as [PR_Stage2DFlag]
			  ,solsubhistory.[PR_Stage2EFlag] as [PR_Stage2EFlag]
			  ,solsubhistory.[PR_Stage2FFlag] as [PR_Stage2FFlag]
			  ,solsubhistory.[PR_Stage2GFlag] as [PR_Stage2GFlag]
			  ,solsubhistory.[PR_Stage2HFlag] as [PR_Stage2HFlag]
			  ,solsubhistory.[PR_StageOthers] as [PR_StageOthers]
			  ,solsubhistory.[PR_EarliestBillingDueDate] as [PR_EarliestBillingDueDate]
			  ,solsubhistory.[PR_TotalBillingAmount] as [PR_TotalBillingAmount]
			  ,solsubhistory.[PR_AnyBridgingFinancierFlag] as [PR_AnyBridgingFinancierFlag]
			  ,solsubhistory.[PR_BridgingFinancier] as [PR_BridgingFinancier]
			  ,solsubhistory.[PR_BridgingFinancierEmailAddress] as [PR_BridgingFinancierEmailAddress]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionSum] as [PR_BridgingFinancierRedemptionSum]
			  ,solsubhistory.[PR_RedemptionPaymentAccountNumber] as [PR_RedemptionPaymentAccountNumber]
			  ,solsubhistory.[PR_BeneficiaryBank] as [PR_BeneficiaryBank]
			  ,solsubhistory.[PR_BridgingFinancierRedemptionExpiryDate] as [PR_BridgingFinancierRedemptionExpiryDate]
			  ,solsubhistory.[PR_DeveloperName] as [PR_DeveloperName]
			  ,solsubhistory.[PR_DeveloperEmailAddress] as [PR_DeveloperEmailAddress]
			  ,solsubhistory.[PR_DeveloperPIC] as [PR_DeveloperPIC]
			  ,solsubhistory.[PR_DeveloperHDA] as [PR_DeveloperHDA]
			  ,solsubhistory.[PR_DeveloperHDABank] as [PR_DeveloperHDABank]
			  ,solsubhistory.[LF_PayeeName] as [LF_PayeeName]
			  ,solsubhistory.[LF_BilledAmount] as [LF_BilledAmount]
			  ,solsubhistory.[LF_AccountNumber] as [LF_AccountNumber]
			  ,solsubhistory.[LF_Bank] as [LF_Bank]
			  ,solsubhistory.[LF_PaymentDescription] as [LF_PaymentDescription]
			  ,solsubhistory.[LF_PaymentMode] as [LF_PaymentMode]
			  ,solsubhistory.[UpdateInfo_Reason] as [UpdateInfo_Reason] 
			  ,solsubhistory.[UpdateInfo_Others] as [UpdateInfo_Others]
			  ,solsubhistory.[CancelLoan_Remarks] as [CancelLoan_Remarks]
			  ,solsubhistory.[CancelLoan_File] as [CancelLoan_File]
			  ,'New Billing' as [SolicitorSubmissionOption]
			  ,solsubhistory.[SolicitorSubmissionCompleted] as [SolicitorSubmissionCompleted]
			  ,solsubhistory.[SolicitorCode] as [SolicitorCode]
			  ,solsubhistory.[SolicitorSubmissionDate] as [SolicitorSubmissionDate]
			  ,solsubhistory.[SolicitorSubmissionPDFID] as [SolicitorSubmissionPDFID]
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
			  --,case when tbl_max_billing_id.billingid_max is not null then (tbl_max_billing_id.billingid_max) + 1 else 1 end 			
			from aaIntDisbursement_New_Billing_Staging staging 
			left join aaIntDisbursementSubmission currentsubmission on currentsubmission.arn = staging.arn 				
			left join (select history.*
						from vw_aaSolDisbursementSubmissionIncludeHistory history
						inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
									from vw_aaSolDisbursementSubmissionIncludeHistory
									group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
						) solsubhistory on solsubhistory.arn = staging.arn 		
			/*
			left join (select arn, max(billingid) as billingid_max 
						from aaIntDisbursementSubmission
						group by arn) tbl_max_billing_id on tbl_max_billing_id.arn =staging.arn 
			*/
			/*
			where solsubhistory.arn is null 
				and currentsubmission.arn is null 
			*/
			where solsubhistory.arn is null  
			*/

			update tblCDC
			set newBillingCDC = @NewCDC	
		end 
		
end