CREATE           procedure [dbo].[aa_SolDisbursementSubmission_DisMaker_DeletePaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@RunningIDForCurrentSubmission nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''

	if exists 
	(
		select 1
		from aaSolDisbursementSubmission
		where DisbursementMakerSubmissionCompleted = 1
			and arn = @arn 
	)
	begin
		set @Error = 'The record is submitted. You are not allowed to add/delete further payment until bank approve/reject the current submission'
	end 

	if (@Error ='')
	begin
		delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission
	end 
	

end