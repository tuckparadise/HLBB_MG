CREATE TABLE [dbo].[aaSolDisbursementSubmission_BankInfo](
	[Bank] [nvarchar](200) NOT NULL,
	[RentasFlag] [bit] NOT NULL,
	[IBGFlag] [bit] NOT NULL,
	[HLBFlag] [bit] NOT NULL,
	[createddate] [datetime] NULL,
	[updateddate] [datetime] NULL,
	[createduser] [nvarchar](max) NULL,
	[updateduser] [nvarchar](max) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_aa_DisbursementSubmission_BankInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]