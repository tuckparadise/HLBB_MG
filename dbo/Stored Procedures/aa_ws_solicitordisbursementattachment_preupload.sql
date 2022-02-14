CREATE       procedure [dbo].[aa_ws_solicitordisbursementattachment_preupload]
@arn nvarchar(100) = null ,
@k2attachment nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if ( ltrim(rtrim(@k2attachment)) = '' or 
		@k2attachment = '<file><name>scnull</name><content>scnull</content></file>' or 
		@k2attachment is null )
	begin
		set @error = 'empty attachment'
	end 

	if (@error='')
	begin
		--declare @checksum binary(32)
		declare @checksum bigint
		declare @attachmentfilename  nvarchar(max) = null ,
		@attachmentcontent  nvarchar(max) = null ,
		@attachmentfiletype  nvarchar(max) = null

		set @attachmentfilename = dbo.ufn_getPDFImageName((CONVERT(XML, @k2attachment)))
		set @attachmentcontent = dbo.[ufn_getPDFImage]((CONVERT(XML, @k2attachment)))
		set @attachmentfiletype = dbo.[ufn_getPDFImageNameFileType]((CONVERT(XML, @k2attachment)))

		--set @checksum = HASHBYTES('SHA2_256', @attachmentcontent) 	
		
		set @checksum =Checksum(@attachmentcontent) 		
		
		if not exists
		(
			select 1
			from attachment_staging
			where arn = @arn 
				and workflow = 'DisbursementSolicitorSubmission'
				and SHA2_256 = @checksum
		)
		begin
			insert into attachment_staging
			values (@arn, 'DisbursementSolicitorSubmission', @attachmentfilename, @attachmentcontent, @attachmentfiletype, getdate(), getdate(),getdate(), @checksum)
		end 
		else
		begin
			set @error = 'File existed'
		end 
	end 
	

	
end