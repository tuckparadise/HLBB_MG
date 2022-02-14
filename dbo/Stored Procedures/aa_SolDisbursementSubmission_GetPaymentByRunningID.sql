CREATE       procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentByRunningID]
@arn nvarchar(100) = null ,
@RunningIDForCurrentSubmission nvarchar(100) = null
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
		and RunningIDForCurrentSubmission= @RunningIDForCurrentSubmission

end