create       procedure [dbo].[tbd_aa_SolDisbursementSubmission_DisMaker_GetPaymentHistoty]
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
		  ,[PaymentReference]
		  ,[PaymentDescription]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,RunningIDForCompletedSubmission	  
		  ,AccountFrom
	  FROM [dbo].vw_aaDisbursementPaymentHistory	  
	  where 
		--PaymentReference <> 'Legal Fee' 
		--and PaymentReference <> 'Valuation Fee'
		--and 
		arn = @arn 

end