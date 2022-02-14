CREATE TABLE [dbo].[LOADS_API_LOG](
	[ARN] [nvarchar](100) NULL,
	[STATUSCODE] [nvarchar](100) NULL,
	[STATUSDESC] [nvarchar](100) NULL,
	[InsertedDatatime] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOADS_API_LOG] ADD  CONSTRAINT [DF_LOADS_API_LOG_InsertedDatatime]  DEFAULT (getdate()) FOR [InsertedDatatime]