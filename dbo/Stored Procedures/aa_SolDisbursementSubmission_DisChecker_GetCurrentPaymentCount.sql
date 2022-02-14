CREATE         procedure [dbo].[aa_SolDisbursementSubmission_DisChecker_GetCurrentPaymentCount]
@arn nvarchar(100) = null 
as
begin
	select count(*) as PaymentCount
	from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
	where arn = @arn 

end