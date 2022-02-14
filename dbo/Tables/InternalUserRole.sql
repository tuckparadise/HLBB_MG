CREATE TABLE [dbo].[InternalUserRole](
	[UserRoleID] [bigint] NOT NULL,
	[UserRoleName] [nvarchar](100) NULL,
	[UserRoleDescription] [nvarchar](max) NULL,
	[IsDUMakerDocumentation] [bit] NULL,
	[IsDUMakerValuation] [bit] NULL,
	[IsMortgageAdmin] [bit] NULL,
	[IsITAdminApplication] [bit] NULL,
	[IsITAdminSecurity] [bit] NULL,
	[IsDisbMaker] [bit] NULL,
	[IsDisbChecker] [bit] NULL,
	[IsRCOMaker] [bit] NULL,
	[IsRCOChecker] [bit] NULL,
	[IsTBOMaker] [bit] NULL,
	[IsTBOChecker] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[IsValuerEditer] [bit] NULL,
	[IsSolicitorEditer] [bit] NULL,
	[IsDeveloperEditer] [bit] NULL,
	[IsManager] [bit] NULL,
	[IsDeveloperStatusEditor] [bit] NULL,
 CONSTRAINT [PK_UserRole_1] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]