CREATE      procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_GetBankList]
as
begin
	
	SELECT [PaymentReference] AS 'Payment Reference'     
  FROM [dbo].[aaSolDisbursementSubmission_PaymentReference]
	where [BankFlag] = 1
	
	  union 
	  select [PaymentReference] as 'Payment Reference' 
	  from aaSolDisbursementSubmission_PaymentReference_FLVM
	  	  union 		  	  
	select 	'Others' as [PaymentReference]
end