CREATE         procedure [dbo].[aa_SolDisbursementSubmission_DisCheckerRejected_GetPaymentForCurrentSubmission]
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
		  ,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
		  ,[PaymentDescription]
		  ,[CreatedDate]
		  ,[UpdatedDate]		 
		  ,AccountFrom
	  FROM [dbo].aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
	  where arn = @arn 

end