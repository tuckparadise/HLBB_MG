CREATE   procedure [dbo].[aaa_SQLSolicitorDisbursementSubmissionAttachment2_SelectAll]
@arn nvarchar(max) = null
as
begin

	SELECT [ARN]
      ,[SolicitorCode]
      ,[AttachmentID]
      ,[Attachment]
      ,[CreatedDate]
      ,[AttachmentName]
	from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

end