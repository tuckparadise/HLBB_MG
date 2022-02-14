CREATE procedure [dbo].[usp_ws_savefailedattachmentdata]
@arn nvarchar(100) = null,
@workflow nvarchar(100) = null,
@filename_original nvarchar(100) = null,
@filename_new nvarchar(100) = null,
@filecontent nvarchar(max) = null,
@filetype nvarchar(max) = null,
@attachmentuploaddate nvarchar(100) = null,
@fe_file_url nvarchar(max) = null,
@fe_fireeye_id nvarchar(100) = null,
@fe_failed_description nvarchar(max) = null,
@fe_failed_code nvarchar(100) = null,
@result nvarchar(100) = null,
@VSCreatedDate nvarchar(100) = null,
@VSUpdatedDate nvarchar(100) = null,
@error nvarchar(max) = null output
as
begin

	insert into VS_attachment_detail
	values (@arn, @workflow, @filename_original, @filename_new, @filecontent, @filetype, @attachmentuploaddate, @fe_file_url, @fe_fireeye_id, @fe_failed_description, @fe_failed_code, @result,  @VSCreatedDate, @VSUpdatedDate, getdate(), getdate())

end