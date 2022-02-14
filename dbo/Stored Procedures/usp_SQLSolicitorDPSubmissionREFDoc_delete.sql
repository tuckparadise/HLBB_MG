CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionREFDoc_delete]
@solicitoremail nvarchar(100),
@arn nvarchar(100) 
as
begin

	delete from dbo.SQLSolicitorDPSubmissionRefDocs
	where arn = @arn 
		and solicitorcode = @solicitoremail

end