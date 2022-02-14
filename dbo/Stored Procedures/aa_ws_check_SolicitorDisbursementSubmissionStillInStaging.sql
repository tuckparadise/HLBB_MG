CREATE   procedure [dbo].[aa_ws_check_SolicitorDisbursementSubmissionStillInStaging]
@arn nvarchar(100) = null ,
@error nvarchar(100) = null output
as
begin
	set @error = ''
	/*
	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_staging
		where arn = @arn 
	)
	begin
		set @error = '1'
	end 
	*/
end