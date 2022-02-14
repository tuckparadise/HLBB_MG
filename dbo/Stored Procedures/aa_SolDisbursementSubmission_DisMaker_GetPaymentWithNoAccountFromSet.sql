CREATE         procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentWithNoAccountFromSet]
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
		  ,AccountFrom
		  ,[CreatedDate]
		  ,[UpdatedDate]		  
	  FROM [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	  where arn = @arn 
		and (accountfrom is null or ltrim(rtrim(accountfrom)) ='')
end