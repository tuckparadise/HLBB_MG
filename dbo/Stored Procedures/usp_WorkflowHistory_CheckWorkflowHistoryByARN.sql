CREATE   procedure [dbo].[usp_WorkflowHistory_CheckWorkflowHistoryByARN]
@arn nvarchar(max) = null , 
@workflow nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	if (ltrim(rtrim(@arn)) = '' or @arn is null)
	begin
		set @error = 'Please enter CRA'
	end 

	if (@error = '')
	begin
		if not exists 
		(
			select 1
			from WorkflowHistory
			where workflow = @workflow 
				and arn = @arn 
		)
		begin
			set @error = 'No Record(s) found'
		end 		
	end 

	
end