CREATE   procedure [dbo].[usp_ws_check_SolicitorSubmissionStillInStaging]
@arn nvarchar(100) = null ,
@error nvarchar(100) = null output
as
begin
	set @error = ''
	/*
	if exists 
	(
		select 1
		from SQLSolicitorDPSubmission_Staging
		where arn = @arn 
	)
	begin
		set @error = '1'
	end 
	*/
end