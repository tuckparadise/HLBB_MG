--[usp_deleterecords] '',''

CREATE procedure [dbo].[usp_ws_deleterecords]
@arn nvarchar(100) = null,
@workflow nvarchar(100) = null,
@error nvarchar(max) = null output
as
begin
	set @error = ''
	delete from attachment_staging 
	where arn = @arn 
		and workflow = @workflow 

	
	
end