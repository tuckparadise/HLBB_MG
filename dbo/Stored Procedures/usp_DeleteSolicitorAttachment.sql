CREATE procedure [dbo].[usp_DeleteSolicitorAttachment]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update SQLSolicitorDPSubmission
	set SolicitorCancellationReportAttachment = null ,
		SolicitorRefReportAttachment = null
	where arn = @arn 

	update SQLSolicitorDPSubmission_staging
	set SolicitorCancellationReportAttachment = null ,
		SolicitorRefReportAttachment = null
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2_staging 
	where arn = @arn 
end