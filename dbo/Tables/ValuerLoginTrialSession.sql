CREATE TABLE [dbo].[ValuerLoginTrialSession](
	[ValuerCode] [nvarchar](100) NOT NULL,
	[TrialLeft] [int] NOT NULL,
	[LoginTrialDatetime] [datetime] NOT NULL,
	[Expired] [datetime] NOT NULL
) ON [PRIMARY]