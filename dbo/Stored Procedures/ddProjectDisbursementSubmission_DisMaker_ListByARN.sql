CREATE       procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_ListByARN]
@arn nvarchar(max) = null ,
@billingid bigint =null 
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
  FROM [dbo].ddProjectDisbursementSubmission_DisMaker_MRTA
  where arn = @arn 
	and BillingRunningID = @billingid
end