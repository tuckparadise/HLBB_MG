CREATE procedure [dbo].[usp_SQLDUMakerDPSubmission_SolicitorInput_SubmissionAttachment_select]
@ARN varchar(100)
as
begin

	SELECT [ARN]
      ,[SolicitorCode]
      ,[AttachmentID]
      ,[Attachment]
      ,[CreatedDate]
      ,[AttachmentName]
	from [SQLSolicitorDPSubmissionAttachment]
	where arn = @arn

end