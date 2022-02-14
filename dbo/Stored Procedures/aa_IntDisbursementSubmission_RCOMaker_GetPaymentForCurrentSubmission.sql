CREATE           procedure [dbo].[aa_IntDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]
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
	  FROM [dbo].aaIntDisbursementSubmission_RCOMakerSubmissionPaymentDetail
	where arn = @arn 
		and BillingRunningID= @billingid
	
end