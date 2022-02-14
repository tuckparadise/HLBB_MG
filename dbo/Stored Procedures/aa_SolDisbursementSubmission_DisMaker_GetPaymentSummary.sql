--[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary] 'TAI/RB/2019/Z0009998'

CREATE       procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_GetPaymentSummary]
@arn nvarchar(100) = null 
as
begin
	
	select sqlloads.arn,
		null as purchasedprice ,		
		TotalFinancingAmount,
		isnull(phistory.AmountDisburseTotal,0.00) as AmountDisburseTotal,
		isnull((TotalFinancingAmount - isnull(phistory.AmountDisburseTotal,0.00)),0.00) as balance 
	from sqlloads 
		left join
		(
		select arn,
			sum([AmountDisburse]) as AmountDisburseTotal
		from vw_aaDisbursementPaymentHistory
		where arn = @arn 
		group by arn 
		) phistory on phistory.arn = sqlloads.arn 
	where sqlloads.arn = @arn 
	
end