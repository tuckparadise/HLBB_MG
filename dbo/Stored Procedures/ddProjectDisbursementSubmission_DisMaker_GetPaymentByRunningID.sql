CREATE               procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_GetPaymentByRunningID]
@arn nvarchar(100) = null ,
@billingid bigint = null ,
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
		  ,[AccountFrom]
		  ,[CreatedDate]
		  ,[UpdatedDate]		  		  
		  , case when [PaymentReference] in (select PaymentReference from aaSolDisbursementSubmission_PaymentReference_FLVM) then 1 else 0 end as [FLVMFlag]
	  FROM [dbo].ddProjectDisbursementSubmission_DisMaker_PaymentDetail
	  where arn = @arn 
		and RunningIDForCurrentSubmission= @RunningIDForCurrentSubmission		
		and BillingRunningID = @billingid

end