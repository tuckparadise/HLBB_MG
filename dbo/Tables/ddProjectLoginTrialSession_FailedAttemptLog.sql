CREATE TABLE [dbo].[ddProjectLoginTrialSession_FailedAttemptLog](
	[ProjectCode] [nvarchar](100) NOT NULL,
	[loginDatetime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]