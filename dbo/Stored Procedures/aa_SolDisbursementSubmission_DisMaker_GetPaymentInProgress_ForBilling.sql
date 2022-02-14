CREATE         procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentInProgress_ForBilling]
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
      --,[PaymentReference]
	  ,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
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