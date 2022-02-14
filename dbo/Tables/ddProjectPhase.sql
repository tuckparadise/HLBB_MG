CREATE TABLE [dbo].[ddProjectPhase](
	[PhaseCode] [nvarchar](100) NULL,
	[PhaseName] [nvarchar](max) NULL,
	[ProjectCode] [nvarchar](100) NULL,
	[DeveloperCode] [nvarchar](100) NULL,
	[PhaseEmail] [nvarchar](max) NULL,
	[SADAFlag] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
	[SurrogateID] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]