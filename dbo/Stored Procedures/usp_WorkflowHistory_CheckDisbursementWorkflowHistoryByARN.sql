CREATE     procedure [dbo].[usp_WorkflowHistory_CheckDisbursementWorkflowHistoryByARN]
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
			SELECT [Workflow]
			  ,[ARN]
			  ,[Status]
			  ,[WorkflowOwner]
			  ,[AssignedBy]
			  ,[CreatedDatetime]
			  ,null as BillingRunningID
			from WorkflowHistory
			where workflow = 'Disbursement By Solicitor' 
				and arn = @arn 			
	 
			 union 

			 SELECT [Workflow]
			  ,[ARN]
			  ,[Status]
			  ,[WorkflowOwner]
			  ,[AssignedBy]
			  ,[CreatedDatetime]
			  ,BillingRunningID
			from [WorkflowHistory_Billing]
			where workflow = 'Progressive Billing' 
				and arn = @arn 		

			union 

			SELECT [Workflow]
			  ,[ARN]
			  ,[Status]
			  ,[WorkflowOwner]
			  ,[AssignedBy]
			  ,[CreatedDatetime]
			  ,BillingRunningID
			from [WorkflowHistory_ProjectBilling]
			where 
				--workflow = 'Progressive Billing' 
				arn = @arn 		
		)
		begin
			set @error = 'No Record(s) found'
		end 		
	end 

	
end