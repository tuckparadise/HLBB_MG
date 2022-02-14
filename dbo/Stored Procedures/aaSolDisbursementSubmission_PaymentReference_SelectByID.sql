create   procedure [dbo].[aaSolDisbursementSubmission_PaymentReference_SelectByID]
@id bigint = null 
as
begin
	select * 
	from aaSolDisbursementSubmission_PaymentReference
	where id =@id 
end