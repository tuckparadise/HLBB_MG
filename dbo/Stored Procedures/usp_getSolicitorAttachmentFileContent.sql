CREATE procedure [dbo].[usp_getSolicitorAttachmentFileContent]
@arn nvarchar(100)
as
begin

	declare @ImageSource xml
	--declare @ImageSource  nvarchar(max)
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= SolicitorRefReportAttachment	
	--select * 
	from dbo.SQLSolicitorDPSubmission 
	where arn = @arn
	
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @ImageName= 'Ref.pdf'
	select @Image as SolicitorRefReportAttachment, @ImageName as SolicitorRefReportAttachmentFileName
end