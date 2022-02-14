create   procedure [dbo].[aaSolDisbursementSubmission_MRTA_ListByARN]
@arn nvarchar(max) = null 
as
begin
	SELECT [arn]
      ,[runningid]
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
  FROM [dbo].[aaSolDisbursementSubmission_MRTA]
  where arn = @arn 
end