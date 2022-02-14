CREATE       procedure [dbo].[aa_SolDisbursementSubmission_GetPaymentHistoryByRunningID]
@arn nvarchar(100) = null ,
@runningid nvarchar(100) = null
as
begin
	
	SELECT 
		[SubmissionFrom], 
		[arn]
		  ,RunningIDForCurrentSubmission
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
		  ,[AccountFrom]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,RunningIDForCompletedSubmission		  
	  FROM [dbo].vw_aaDisbursementPaymentHistory
	  where arn = @arn 
		and RunningIDForCompletedSubmission= @runningid

end