CREATE procedure [dbo].[usp_DeleteValuerAttachment]
@arn nvarchar(max) =null,
@output nvarchar(max) = null output
as
begin
	
	set @output = ''

	update SQLValuerDPSubmission
	set ValuerReportAttachment = null 
	where arn = @arn 

end