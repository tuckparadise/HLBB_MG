CREATE TABLE [dbo].[InternalUserLoginTrialSession_FailedAttemptLog](
	[UserName] [nvarchar](100) NOT NULL,
	[loginDatetime] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]