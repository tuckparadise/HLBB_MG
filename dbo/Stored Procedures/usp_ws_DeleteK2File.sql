--[usp_deleterecords] '',''

CREATE   procedure [dbo].[usp_ws_DeleteK2File]
@pdfid bigint= null,
@error nvarchar(max) = null output
as
begin
	delete from K2DBSERVER.K2.dbo.PdfFile
	where id = @pdfid
	
end