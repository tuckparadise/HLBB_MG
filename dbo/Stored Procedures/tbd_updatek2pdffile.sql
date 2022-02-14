create   procedure [dbo].[tbd_updatek2pdffile]
@pdf nvarchar(max) = null 
as
begin
	update K2DBServer.K2.dbo.PdfFile 
	set pdf = @pdf
	where id = 800 

end