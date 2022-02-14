CREATE               procedure [dbo].[usp_ws_select_SolicitorDocumentationSubmissionPFDFFormData]
@pdfid nvarchar(max) = null
as
begin
	declare 
		@k2file nvarchar(max)

	select @k2file = PDF from K2DBSERVER.K2.dbo.PdfFile
	where ID = @pdfid
	
	declare @checksum binary(32), 
		@attachmentfilename  nvarchar(max) = null ,
		@attachmentcontent  nvarchar(max) = null ,
		@attachmentfiletype  nvarchar(max) = null

	set @attachmentfilename = dbo.ufn_getPDFImageName((CONVERT(XML, @k2file)))
	set @attachmentcontent = dbo.[ufn_getPDFImage]((CONVERT(XML, @k2file)))
	set @attachmentfiletype = dbo.[ufn_getPDFImageNameFileType]((CONVERT(XML, @k2file)))

	--set @checksum = HASHBYTES('SHA2_256', @attachmentcontent) 
	set @checksum = NULL

	select @attachmentcontent as ItemContent,
		@attachmentfilename as ItemFileName,
		@attachmentfiletype as ItemFileType	,
		@checksum as ItemFilechecksum
	
end