CREATE TABLE [dbo].[SQLDUMakerDP_AttorneyCentre](
	[AttorneyCentreID] [bigint] IDENTITY(1,1) NOT NULL,
	[AttorneyCentre] [nvarchar](100) NULL,
	[status] [nvarchar](100) NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[UpdatedUser] [nvarchar](max) NULL,
 CONSTRAINT [PK_SQLDUMakerDP_AttorneyCentre] PRIMARY KEY CLUSTERED 
(
	[AttorneyCentreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]