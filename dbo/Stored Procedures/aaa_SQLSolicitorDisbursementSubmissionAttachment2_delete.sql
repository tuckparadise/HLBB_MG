CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_delete]
@solicitoremail nvarchar(100) = null,
@arn nvarchar(100) = null
as
begin

	delete from dbo.aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 
		and solicitorcode = @solicitoremail

end