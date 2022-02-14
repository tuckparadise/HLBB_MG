CREATE           procedure [dbo].[aa_SolDisbursementSubmission_RCOMaker_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null 
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
	  FROM [dbo].[aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail]
	where arn = @arn 
	
end