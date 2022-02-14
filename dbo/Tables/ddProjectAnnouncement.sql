CREATE TABLE [dbo].[ddProjectAnnouncement](
	[RemarkID] [bigint] IDENTITY(1,1) NOT NULL,
	[Announcement] [nvarchar](max) NULL,
	[CreatedUser] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[DeletedUser] [nvarchar](max) NULL,
	[DeletedDate] [datetime] NULL,
	[Attachment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]