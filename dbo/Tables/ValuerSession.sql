CREATE TABLE [dbo].[ValuerSession](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[LogonDatetime] [datetime] NOT NULL,
	[Expired] [datetime] NOT NULL,
	[ClientSessionID] [bigint] NOT NULL,
 CONSTRAINT [PK_ValuerSession] PRIMARY KEY CLUSTERED 
(
	[ValuerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]