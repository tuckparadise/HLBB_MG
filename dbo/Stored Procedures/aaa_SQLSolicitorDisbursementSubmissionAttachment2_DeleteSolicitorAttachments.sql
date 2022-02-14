CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_DeleteSolicitorAttachments]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update aaSolDisbursementSubmission
	set CancelLoan_File = null 		
	where arn = @arn 

	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

end