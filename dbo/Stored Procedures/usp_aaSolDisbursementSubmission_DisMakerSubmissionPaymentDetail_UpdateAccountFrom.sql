--select * from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail

CREATE   procedure [dbo].[usp_aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail_UpdateAccountFrom]
@arn nvarchar(max) =null,
@RunningIDForCurrentSubmission nvarchar(max) =null,
@AccountFrom nvarchar(max) =null,
@error nvarchar(max) =null output 
as
begin
	set @error = ''

	update aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
	set AccountFrom= @AccountFrom
	where arn = @arn 
		and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission
end