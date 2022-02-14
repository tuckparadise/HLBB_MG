CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionAttachment_delete]
@solicitoremail nvarchar(100),
@arn nvarchar(100) 
as
begin

	delete from dbo.SQLSolicitorDPSubmissionAttachment2
	where arn = @arn 
		and solicitorcode = @solicitoremail

end