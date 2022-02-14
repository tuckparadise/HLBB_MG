CREATE procedure [dbo].[usp_SQLSolicitorDPSubmissionEXEDoc_delete]
@solicitoremail nvarchar(100),
@arn nvarchar(100) 
as
begin

	
	delete from dbo.SQLSolicitorDPSubmissionExeDocs
	where arn = @arn 
		and solicitorcode = @solicitoremail
	

end