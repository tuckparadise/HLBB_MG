CREATE      procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistory]
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
	  FROM [dbo].vw_aaDisbursementPaymentHistory	  
	  where 
		PaymentReference <> 'Legal Fee' 
		and PaymentReference <> 'Valuation Fee'
		and PaymentReference <> 'Legal Fee - Principal Pymt'
		and PaymentReference <> 'Valuation Fee - Principal Pymt'
		and PaymentReference <> 'MDTA/ MRTT'
		and PaymentReference <> 'MDTA/ MRTT - Principal Pymt'
		and arn = @arn 

end