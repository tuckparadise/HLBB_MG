CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentByRunningID]
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
	  --,case when [PaymentReference] = 'Others' then 'Others-' + [FacilityAccountNumber] else  [PaymentReference] end as [PaymentReference]
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
	  , case when [PaymentReference] in (select PaymentReference from aaSolDisbursementSubmission_PaymentReference_FLVM) then 1 else 0 end as [FLVMFlag]
	  FROM [dbo].aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
	  where arn = @arn 
		and RunningIDForCurrentSubmission= @RunningIDForCurrentSubmission

end