CREATE procedure [dbo].[usp_getSolicitorOthersAttachmentFileContent]
@arn nvarchar(100),
@solicitorcode nvarchar(100),
@fileid int 
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= Attachment	
	--select * 
	from dbo.SQLSolicitorDPSubmissionAttachment2 
	where arn = @arn
		and solicitorcode = @solicitorcode 
		and AttachmentID = @fileid
	
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @ImageName= 'others.pdf'
	select @Image as Attachment, @ImageName as AttachmentFileName
end