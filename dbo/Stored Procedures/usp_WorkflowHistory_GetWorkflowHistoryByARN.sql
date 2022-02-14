CREATE procedure [dbo].[usp_WorkflowHistory_GetWorkflowHistoryByARN]
@arn nvarchar(max) = null , 
@workflow nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	
	
	SELECT [Workflow]
      ,[ARN]
      ,[Status]
      ,[WorkflowOwner]
      ,[AssignedBy]
      ,[CreatedDatetime]
	from WorkflowHistory
	where workflow = @workflow 
		and arn = @arn 			
	 

	
end