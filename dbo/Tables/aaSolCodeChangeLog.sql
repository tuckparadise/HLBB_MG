CREATE TABLE [dbo].[aaSolCodeChangeLog](
	[arn] [nvarchar](100) NOT NULL,
	[OldSolCode] [nvarchar](100) NOT NULL,
	[NewSolCode] [nvarchar](100) NOT NULL,
	[FirstAdviceCompleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](100) NOT NULL,
	[UpdatedUser] [nvarchar](100) NOT NULL
) ON [PRIMARY]