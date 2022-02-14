create   procedure [dbo].[tbd_getk2pdffile]
as
begin
	select top 1 pdf from K2DBServer.K2.dbo.PdfFile
end