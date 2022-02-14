CREATE procedure [dbo].[usp_getK2PDFFileContent]
@ID int
as
begin

	declare @ImageSource xml
	--declare @ImageSource nvarchar(max)
	declare @Image nvarchar(max)
	declare @ImageName nvarchar(max)

	select @ImageSource= PDF	
	--need to check
	from k2dbserver.k2.dbo.PdfFile 	
	--from kapps2.k2.dbo.PdfFile 
	where id = @id
	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')

	select @Image as PDF, @ImageName as PDFFileName
	--select @ImageSource as PDF
end