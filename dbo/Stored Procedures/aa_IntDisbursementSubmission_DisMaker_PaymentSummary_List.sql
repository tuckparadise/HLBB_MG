CREATE             procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_PaymentSummary_List]
@arn nvarchar(100) = null ,
@billingid nvarchar(100) = null 
as
begin
	
	SELECT 
		accountfrom
		,'Current' as paymentstatus
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
	FROM [dbo].[aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail]
	where 
		--(accountfrom is not null or ltrim(rtrim(accountfrom)) <>'') and  
			arn = @arn 				
	union 
	SELECT 
		[AccountFrom]
		,'Completed' as paymentstatus
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