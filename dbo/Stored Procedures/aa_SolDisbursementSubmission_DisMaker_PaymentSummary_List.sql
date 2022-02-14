CREATE           procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_PaymentSummary_List]
@arn nvarchar(100) = null 
as
begin
	
	SELECT 
		AccountFrom
		,'Current' as PaymentStatus
		,[arn]
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
		,[DisMakerEmail]
		,[DisMakerSubmissionDate]
		,[DisCheckerEmail]
		,[DisCheckerApprovedDate]
		,[RCOMakerEmail]
		,[RCOMakerApprovedDate]
		,[RCOCheckerEmail]
		,[RCOCheckerApprovedDate]		
		,0 as RunningIDForCompletedSubmission
	FROM [dbo].[aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	where (accountfrom is not null or ltrim(rtrim(accountfrom)) <>'') 
		and  arn = @arn 		
	union 
	SELECT 
		[AccountFrom]
		,'Completed' as PaymentStatus
		,[arn]
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
		,[DisMakerEmail]
		,[DisMakerSubmissionDate]
		,[DisCheckerEmail]
		,[DisCheckerApprovedDate]
		,[RCOMakerEmail]
		,[RCOMakerApprovedDate]
		,[RCOCheckerEmail]
		,[RCOCheckerApprovedDate]    
		,RunningIDForCompletedSubmission		
	FROM [dbo].vw_aaDisbursementPaymentHistory
	where arn = @arn 
end