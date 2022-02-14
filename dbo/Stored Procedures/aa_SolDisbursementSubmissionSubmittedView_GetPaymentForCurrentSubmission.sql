CREATE         procedure [dbo].[aa_SolDisbursementSubmissionSubmittedView_GetPaymentForCurrentSubmission]
@arn nvarchar(100) = null 
as
begin		
	select case when sb.arn is null then mp.[arn] else sb.arn end as arn 
		,case when sb.RunningIDForCurrentSubmission is null then mp.RunningIDForCurrentSubmission else sb.RunningIDForCurrentSubmission end as RunningIDForCurrentSubmission 
		,case when sb.[FacilityAccountNumber] is null then mp.[FacilityAccountNumber] else sb.[FacilityAccountNumber] end as [FacilityAccountNumber] 
		,case when sb.[PaymentMode]  is null then mp.[PaymentMode] else sb.[PaymentMode] end as [PaymentMode] 
		,case when sb.[PayeeID] is null then mp.[PayeeID] else sb.[PayeeID] end as [PayeeID] 
		,case when sb.[PayeeName] is null then mp.[PayeeName] else sb.[PayeeName] end as [PayeeName] 
		,case when sb.[BeneficiaryBank]  is null then mp.[BeneficiaryBank] else sb.[BeneficiaryBank] end as [BeneficiaryBank] 
		,case when sb.[BeneficiaryBankAccountNumber]  is null then mp.[BeneficiaryBankAccountNumber] else sb.[BeneficiaryBankAccountNumber] end as [BeneficiaryBankAccountNumber] 
		,case when sb.[AmountDisburse]  is null then mp.[AmountDisburse] else sb.[AmountDisburse] end as [AmountDisburse] 
		,case when sb.[PaymentReference]  is null then mp.[PaymentReference] else sb.[PaymentReference] end as [PaymentReference] 
		,case when sb.[PaymentDescription]  is null then mp.[PaymentDescription] else sb.[PaymentDescription] end as [PaymentDescription] 
		,case when sb.[CreatedDate]  is null then mp.[CreatedDate] else sb.[CreatedDate] end as [CreatedDate] 
		,case when sb.[UpdatedDate]  is null then mp.[UpdatedDate] else sb.[UpdatedDate] end as [UpdatedDate] 
	from vw_aaSolDisbursementSubmission main
		left join aaSolDisbursementSubmissionSubmittedView_PaymentDetail sb on sb.arn = main.arn 
		left join aaSolDisbursementSubmission_PaymentDetail mp on mp.arn = main.arn 
	where main.arn = @arn 
	
end