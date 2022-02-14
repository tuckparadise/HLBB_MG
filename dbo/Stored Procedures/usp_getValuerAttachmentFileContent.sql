CREATE procedure [dbo].[usp_getValuerAttachmentFileContent]
@arn nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= ValuerReportAttachment	
	--select * 
	from dbo.SQLValuerDPSubmission 
	where arn = @arn
	

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	--set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	--set @ImageName= 'valuer'
	set @ImageName= 'valuer.pdf'
	select @Image as ValuerReportAttachment, @ImageName as ValuerReportAttachmentFileName
end