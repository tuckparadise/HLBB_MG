CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionExeDocs_select]
@ARN varchar(100)
as
begin

SELECT [ARN]
      ,[SolicitorCode]
      ,[ExeDocNameID]
      ,[ExeDocNameDesc]
      ,[CreatedDate]
	from SQLSolicitorDPSubmissionExeDocs
	where arn = @arn

end