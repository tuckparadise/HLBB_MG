CREATE             procedure [dbo].[ddProjectDisbursementSubmission_RCOmaker_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null ,
@billingid bigint = null 
as
begin		
	SELECT [arn]
		  ,[RunningIDForCurrentSubmission]
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
		  ,[DisMakerEmail]
		  ,[DisMakerSubmissionDate]
		  ,[DisCheckerEmail]
		  ,[DisCheckerApprovedDate]
		  ,[RCOMakerEmail]
		  ,[RCOMakerApprovedDate]
		  ,[RCOCheckerEmail]
		  ,[RCOCheckerApprovedDate]
		  ,[AccountFrom]
		  ,BillingRunningID
	  FROM [dbo].ddProjectDisbursementSubmission_RCOMaker_PaymentDetail
	where arn = @arn 
		and BillingRunningID= @billingid
	
end