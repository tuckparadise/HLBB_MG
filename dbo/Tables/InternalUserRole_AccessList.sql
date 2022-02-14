CREATE TABLE [dbo].[InternalUserRole_AccessList](
	[UserRoleID] [bigint] NOT NULL,
	[UserRoleName] [nvarchar](100) NULL,
	[UserRoleDescription] [nvarchar](max) NULL,
	[AccessList] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_InternalUserRole_AccessList] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]