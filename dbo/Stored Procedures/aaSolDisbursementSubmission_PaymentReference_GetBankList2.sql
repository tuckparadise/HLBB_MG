CREATE        procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList2]
as
begin
	
	SELECT [PaymentReference] 
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	where [BankFlag] = 1
	   union 
	  select [PaymentReference] 
	  from aaSolDisbursementSubmission_PaymentReference_FLVM 
	  	  union 
	select 	'Others' as [PaymentReference]	
end