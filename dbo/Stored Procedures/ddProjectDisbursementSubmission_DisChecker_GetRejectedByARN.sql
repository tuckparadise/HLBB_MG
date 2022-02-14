/*
select DisbursementMakerEmailAddress,ProjectSubmissionOption,* from ddProjectDisbursementSubmission_DisCheckerRejected
where arn = 'TDD/MG/2021/Z0100039'

update ddProjectDisbursementSubmission_DisCheckerRejected
set DisbursementMakerEmailAddress = 'workgroup\jasonangot'

select ProjectSubmissionOption,* from ddProjectDisbursementSubmission_DisCheckerRejected
go
*/

CREATE               procedure [dbo].[ddProjectDisbursementSubmission_DisChecker_GetRejectedByARN]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin
	
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
		  --,[PR_DeveloperName]
		  --,[PR_DeveloperEmailAddress]
		  ,[PR_DeveloperPIC]
		  ,[PR_DeveloperHDA]
		  ,[PR_DeveloperHDABank]
		  --,[PR_PurchasedPrice]
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
		  --,[DisbursementMakerEmailAddress]
		  ,InternalUser_maker.UserFullName as DisbursementMakerEmailAddress
		  ,[DisbursementMakerDecision]
		  ,[DisbursementMakerSubmissionCompleted]
		  ,[DisbursementMakerRejectionReason]
		  ,[DisbursementMakerSubmissionDate]
		  ,[DisbursementMakerSubmissionPDFID]
		  --,[DisbursementCheckerEmailAddress]
		  ,InternalUser_checker.UserFullName as DisbursementCheckerEmailAddress
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
		  ,intsub.[CreatedDate]
		  ,intsub.[UpdatedDate]
		    , intsub.ProjectSubmissionOption			
	  ,intsub.DeveloperCode
	  ,intsub.ProjectCode
	  ,intsub.PhaseCode
	  ,intsub.DeveloperLoginID
	  ,intsub.ProjectSubmissionDate
	  ,intsub.PR_Stage2IFlag
	  ,intsub.PR_Stage2JFlag
	  ,intsub.PR_Stage2KFlag
	  ,intsub.PR_Stage3
	  ,intsub.PR_Stage4
	  ,intsub.PR_Stage5
	  ,intsub.PR_Stage6
	  ,intsub.PR_Stage7
	  ,intsub.PR_Stage8
	  ,intsub.PR_Stage9
	  ,intsub.SadaFlag
	  ,intsub.ConfirmationOfArchitectFlag
	  ,intsub.ConfirmationOfArchitectRemark
	  ,intsub.FinalBillingFlag
	  ,phase.SADAFlag as DefaultSADAFlag	
	   ,Developer.[Name] as PR_DeveloperName
	  ,phase.PhaseEmail as PhaseEmail
	  ,Developer.Email as PR_DeveloperEmailAddress
		  ,[BillingRunningID]
		    ,intsub.SPADate
		  ,intsub.SPAConstructionPeriodInMonths
		  ,intsub.ExtendedConstructionPeriodInMonths
		  ,case phase.SADAFlag when 1 then 'Yes' else 'No' end as DefaultSADAFlagText 
	  FROM [dbo].ddProjectDisbursementSubmission_DisCheckerRejected intsub
	  left join ddProjectPhase phase on phase.PhaseCode = intsub.phasecode and phase.DeveloperCode = intsub.developercode and phase.projectcode = intsub.projectcode 				
		left join ddProjectDeveloper Developer on  Developer.ID = intsub.developercode 
		--inner join [dbo].[aaIntDisbursementSubmission] intsub on intsub.arn = sqlloads.arn 		
		--left join SQLSolicitorDPSubmission doc on doc.arn = intsub.arn 		
		/*
		left join (select history.*
					from vw_aaSolDisbursementSubmissionIncludeHistory history
					inner join (select arn, max(RunningIDForCompletedSubmission) as MaxRunningIDForCompletedSubmission
								from vw_aaSolDisbursementSubmissionIncludeHistory
								group by arn ) tbl1 on tbl1.arn = history.arn and history.RunningIDForCompletedSubmission = tbl1.MaxRunningIDForCompletedSubmission
					) solsubhistory on solsubhistory.arn = IntSub.arn 
					*/
		--left join aaIntDisbursementSubmission_RCOMakerRejected rejected on rejected.arn = intsub.arn and rejected.BillingRunningID = intsub.BillingRunningID
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = IntSub.DisbursementCheckerEmailAddress
		left join InternalUser InternalUser_maker on InternalUser_maker.UserName = IntSub.DisbursementMakerEmailAddress
	where 
		intsub.arn =@arn 		
		and intsub.BillingRunningID= @billingid 
end