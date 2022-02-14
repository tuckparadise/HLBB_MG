CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null 
as
begin
	
	SELECT [arn]
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
		  ,AccountFrom
	  FROM [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	  where arn = @arn 

end