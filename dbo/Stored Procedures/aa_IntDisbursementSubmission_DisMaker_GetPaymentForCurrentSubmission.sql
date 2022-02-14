CREATE           procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null ,
@billingid bigint = null 
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
		  ,[AccountFrom]	
		  ,BillingRunningID
	  FROM [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	  where arn = @arn 		
		and BillingRunningID = @billingid
end