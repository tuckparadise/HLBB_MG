CREATE TABLE [dbo].[aaSolDisbursementSubmission_PaymentReference](
	[PaymentReference] [nvarchar](200) NOT NULL,
	[SolicitorFlag] [bit] NOT NULL,
	[BankFlag] [bit] NOT NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[createduser] [nvarchar](max) NULL,
	[updateduser] [nvarchar](max) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]