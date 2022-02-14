CREATE TABLE [dbo].[MortgageAppTaskInstance](
	[workflow] [nvarchar](100) NOT NULL,
	[arn] [nvarchar](100) NOT NULL,
	[TaskOwner] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedUser] [nvarchar](100) NOT NULL,
	[UpdatedUser] [nvarchar](100) NULL
) ON [PRIMARY]