CREATE                             VIEW [dbo].[vw_aaDisbursementPaymentHistory] AS


SELECT 'Bank' as [SubmissionFrom], 
	pd.[arn]
      ,RunningIDForCurrentSubmission
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,pd.[CreatedDate]
      ,pd.[UpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
	  ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
	  ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,pd.RunningIDForCompletedSubmission
	  ,[AccountFrom]	  
	  ,pd.BillingRunningID
	   , stuff(		
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage9 = 1 then '9' else null end),     '') + 
		--COALESCE(', ' +  RTRIM( m.[PR_StageOthers] ),     '') 
		COALESCE(', ' +  RTRIM( case when ltrim(rtrim(m.PR_StageOthers)) = '' then null else  m.PR_StageOthers end ),     '') 
		, 1, 2, '') as BillingStage 
	  from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail_history pd
	  inner join aaIntDisbursementSubmission_History m on m.arn = pd.arn and m.BillingRunningID = pd.BillingRunningID
union 
SELECT 
	'Solicitor' as [SubmissionFrom], 
	pd.[arn]
      ,RunningIDForCurrentSubmission
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,pd.[CreatedDate]
      ,pd.[UpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
	  ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
	  ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,pd.RunningIDForCompletedSubmission
	  ,[AccountFrom]	  
	  ,pd.RunningIDForCompletedSubmissionMainTable  as BillingRunningID
	  , stuff(		
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage9 = 1 then '9' else null end),     '') + 
		--COALESCE(', ' +  RTRIM( m.[PR_StageOthers] ),     '') 
		COALESCE(', ' +  RTRIM( case when ltrim(rtrim(m.PR_StageOthers)) = '' then null else  m.PR_StageOthers end ),     '') 
		, 1, 2, '') as BillingStage 
from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_history pd
	  inner join aaSolDisbursementSubmission_DisMakerSubmission_History m on m.arn = pd.arn and m.RunningIDForCompletedSubmission = pd.RunningIDForCompletedSubmissionMainTable
union 
SELECT 
	'Developer' as [SubmissionFrom], 
	pd.[arn]
      ,RunningIDForCurrentSubmission
      ,[FacilityAccountNumber]
      ,[PaymentMode]
      ,[PayeeID]
      ,[PayeeName]
      ,[BeneficiaryBank]
      ,[BeneficiaryBankAccountNumber]
      ,[AmountDisburse]
      ,[PaymentReference]
      ,[PaymentDescription]
      ,pd.[CreatedDate]
      ,pd.[UpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
	  ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
	  ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,pd.RunningIDForCompletedSubmission
	  ,[AccountFrom]	  
	  ,pd.BillingRunningID
	   , stuff(		
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2AFlag] = 1 then '2/2a' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2BFlag] = 1 then '2b' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2CFlag] = 1 then '2c' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2DFlag] = 1 then '2d' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2EFlag] = 1 then '2e' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2FFlag] = 1 then '2f' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2GFlag] = 1 then '2g' else null end),     '') +
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2HFlag] = 1 then '2h' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2IFlag] = 1 then '2i' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2JFlag] = 1 then '2j' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.[PR_Stage2KFlag] = 1 then '2k' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage3 = 1 then '3' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage4 = 1 then '4' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage5 = 1 then '5' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage6 = 1 then '6' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage7 = 1 then '7' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage8 = 1 then '8' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when m.PR_Stage9 = 1 then '9' else null end),     '') + 
		COALESCE(', ' +  RTRIM( case when ltrim(rtrim(m.PR_StageOthers)) = '' then null else  m.PR_StageOthers end ),     '') 
		--COALESCE(', ' +  RTRIM( m.[PR_StageOthers] ),     '') 
		, 1, 2, '') as BillingStage 
from ddProjectDisbursementSubmission_DisMaker_PaymentDetail_history pd
inner join ddProjectDisbursementSubmission_DisMakerHistory m on m.arn = pd.arn and m.BillingRunningID = pd.BillingRunningID