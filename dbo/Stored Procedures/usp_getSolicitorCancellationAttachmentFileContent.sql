CREATE procedure [dbo].[usp_getSolicitorCancellationAttachmentFileContent]
@arn nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= SolicitorCancellationReportAttachment	
	--select * 
	from dbo.SQLSolicitorDPSubmission 
	where arn = @arn
	

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @ImageName= 'Cancellation.pdf'
	select @Image as SolicitorCancellationReportAttachment, @ImageName as SolicitorCancellationReportAttachmentFileName
end