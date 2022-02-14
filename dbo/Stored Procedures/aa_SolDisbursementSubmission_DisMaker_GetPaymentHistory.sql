CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentHistory]
@arn nvarchar(100) = null 
as
begin
	
	SELECT [SubmissionFrom], 
		[arn]
		  ,RunningIDForCurrentSubmission
		  ,[FacilityAccountNumber]
		  ,[PaymentMode]
		  ,[PayeeID]
		  ,[PayeeName]
		  ,[BeneficiaryBank]
		  ,[BeneficiaryBankAccountNumber]
		  ,[AmountDisburse]
		  --,[PaymentReference]
		  ,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
		  ,[PaymentDescription]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,RunningIDForCompletedSubmission	  
		  ,AccountFrom
		  ,[DisMakerEmail]
		  ,[DisMakerSubmissionDate]
		  ,[DisCheckerEmail]
		  --,[DisCheckerApprovedDate]
		  , FORMAT (DisCheckerApprovedDate, 'dd/MM/yyyy') as DisCheckerApprovedDate
		  ,[RCOMakerEmail]
		  ,[RCOMakerApprovedDate]
		  ,[RCOCheckerEmail]
		  ,[RCOCheckerApprovedDate]
		  ,BillingRunningID
		  ,BillingStage
	  FROM [dbo].vw_aaDisbursementPaymentHistory	  
	  where 
		--PaymentReference <> 'Legal Fee' 
		--and PaymentReference <> 'Valuation Fee'
		--and 
		arn = @arn 
		order by DisCheckerApprovedDate desc
end