CREATE   procedure [dbo].[usp_WorkflowHistory_GetDisbursementWorkflowHistoryByARN]
@arn nvarchar(max) = null , 
@workflow nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	
	
	SELECT [Workflow]
      ,[ARN]
      ,WorkflowHistory.[Status]
      --,[WorkflowOwner]
	  --,InternalUser_owner.UserFullName as WorkflowOwner
	   ,case isnull(InternalUser_owner.UserFullName,'') when '' then WorkflowOwner else InternalUser_owner.UserFullName end as WorkflowOwner
      --,[AssignedBy]
	  ,InternalUser_AssignedBy.UserFullName as AssignedBy
      ,[CreatedDatetime]
	  ,null as BillingRunningID
	from WorkflowHistory
	left join InternalUser InternalUser_owner on InternalUser_owner.UserName = WorkflowHistory.[WorkflowOwner]
	left join InternalUser InternalUser_AssignedBy on InternalUser_AssignedBy.UserName = WorkflowHistory.[AssignedBy]
	where workflow in ('Disbursement By Solicitor','Disbursement By Solicitor- Disbursement Maker','Disbursement By Solicitor- Disbursement Checker','Disbursement By Solicitor- RCO Maker','Disbursement By Solicitor- RCO Checker' )
		and arn = @arn 			
	 
	 union 

	 SELECT [Workflow]
      ,[ARN]
      ,[WorkflowHistory_Billing].[Status]
       --,[WorkflowOwner]	  
	  ,case isnull(InternalUser_owner.UserFullName,'') when '' then WorkflowOwner else InternalUser_owner.UserFullName end as WorkflowOwner
      --,[AssignedBy]
	  ,InternalUser_AssignedBy.UserFullName as AssignedBy
      ,[CreatedDatetime]
	  ,BillingRunningID
	from [WorkflowHistory_Billing]
	left join InternalUser InternalUser_owner on InternalUser_owner.UserName = [WorkflowHistory_Billing].[WorkflowOwner]
	left join InternalUser InternalUser_AssignedBy on InternalUser_AssignedBy.UserName = [WorkflowHistory_Billing].[AssignedBy]
	where workflow in ('Progressive Billing' ,'Progressive Billing- Disbursement Maker','Progressive Billing- Disbursement Checker','Progressive Billing- RCO Maker','Progressive Billing- RCO Checker')
		and arn = @arn 		

	union 

	SELECT [Workflow]
		,[ARN]
		,[WorkflowHistory_ProjectBilling].[Status]
		 --,[WorkflowOwner]
	  ,case isnull(InternalUser_owner.UserFullName,'') when '' then WorkflowOwner else InternalUser_owner.UserFullName end as WorkflowOwner
      --,[AssignedBy]
	  ,InternalUser_AssignedBy.UserFullName as AssignedBy
		,[CreatedDatetime]
		,BillingRunningID
	from [WorkflowHistory_ProjectBilling]
	left join InternalUser InternalUser_owner on InternalUser_owner.UserName = [WorkflowHistory_ProjectBilling].[WorkflowOwner]
	left join InternalUser InternalUser_AssignedBy on InternalUser_AssignedBy.UserName = [WorkflowHistory_ProjectBilling].[AssignedBy]
	where 
		--workflow = 'Progressive Billing' 
		arn = @arn 			
end