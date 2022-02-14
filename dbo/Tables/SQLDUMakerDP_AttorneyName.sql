CREATE TABLE [dbo].[SQLDUMakerDP_AttorneyName](
	[AttorneyNameID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttorneyName] [nvarchar](100) NULL,
	[AttorneyCentreID] [bigint] NOT NULL,
	[status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedUser] [nvarchar](100) NULL,
	[UpdatedUser] [nvarchar](100) NULL,
 CONSTRAINT [PK_SQLDUMakerDP_AttorneyName] PRIMARY KEY CLUSTERED 
(
	[AttorneyNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]