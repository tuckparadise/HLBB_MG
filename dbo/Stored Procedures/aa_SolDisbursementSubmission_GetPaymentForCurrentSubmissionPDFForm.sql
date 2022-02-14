CREATE         procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentForCurrentSubmissionPDFForm]
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
		  ,[PaymentReference]
		  ,[PaymentDescription]
		  ,[CreatedDate]
		  ,[UpdatedDate]		  
	  FROM [dbo].[aaSolDisbursementSubmission_PaymentDetail]
	  where arn = @arn 

end