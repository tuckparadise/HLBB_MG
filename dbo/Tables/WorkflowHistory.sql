CREATE TABLE [dbo].[WorkflowHistory](
	[Workflow] [nvarchar](100) NULL,
	[ARN] [nvarchar](100) NULL,
	[Status] [nvarchar](max) NULL,
	[WorkflowOwner] [nvarchar](max) NULL,
	[AssignedBy] [nvarchar](max) NULL,
	[CreatedDatetime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]