CREATE TABLE [dbo].[InternalUserRole_UAM5](
	[UserRoleID] [bigint] NOT NULL,
	[UserRoleName] [nvarchar](100) NULL,
	[Case Inquiry (Complete)] [varchar](4) NOT NULL,
	[Document Unit] [varchar](4) NOT NULL,
	[Valuation Unit] [varchar](4) NOT NULL,
	[Update LOADS data] [varchar](4) NOT NULL,
	[Parameter Maintenance] [varchar](4) NOT NULL,
	[Manual Form Generator] [varchar](4) NOT NULL,
	[Security Report] [varchar](4) NOT NULL,
	[Dynamic Query Execution] [varchar](4) NOT NULL,
	[Application Settings] [varchar](4) NOT NULL,
	[User Management] [varchar](4) NOT NULL,
	[Activate Inactive Users] [varchar](4) NOT NULL,
	[Security Feature Setting] [varchar](4) NOT NULL
) ON [PRIMARY]