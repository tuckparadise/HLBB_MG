CREATE             procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentForCurrentSubmission]
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
	  FROM [dbo].ddProjectDisbursementSubmission_DisMaker_PaymentDetail
	  where arn = @arn 		
		and BillingRunningID = @billingid
end