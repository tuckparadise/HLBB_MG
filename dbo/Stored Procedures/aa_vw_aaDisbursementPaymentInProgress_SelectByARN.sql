CREATE   procedure [dbo].[aa_vw_aaDisbursementPaymentInProgress_SelectByARN]
@arn nvarchar(100) = null
as
begin
	SELECT [SubmissionFrom]
      ,[arn]
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
  FROM [dbo].[vw_aaDisbursementPaymentInProgress]
  where arn = @arn 
	and [SubmissionFrom] = 'Bank'
end