CREATE   procedure [dbo].[usp_DeleteSolicitorDisbusementAttachment]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update aaSolDisbursementSubmission
	set CancelLoan_File = null 
	where arn = @arn 

	update aaSolDisbursementSubmission_staging
	set CancelLoan_File = null 
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment_staging
	where arn = @arn 
end