CREATE TABLE [dbo].[SQLSolicitor_DocumentAdminFeeCreditedToOption](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Options] [nvarchar](max) NULL,
 CONSTRAINT [PK_SQLSolicitor_DocumentAdminFeeCreditedToOption] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]