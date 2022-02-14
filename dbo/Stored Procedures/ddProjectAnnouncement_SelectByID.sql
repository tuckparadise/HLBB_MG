create     procedure [dbo].[ddProjectAnnouncement_SelectByID]
@id bigint = null 
as
begin

	SELECT [RemarkID]
      ,[Announcement]
      , CreatedUser as [AddedUser]
      --,[AddedDate]
	  --,FORMAT (CreatedDate, 'dd/MM/yyyy HH:mm:ss') as AnnouncementDate
	  --,DeletedUser
	  --,DeletedDate
	  , attachment
  FROM [dbo].[ddProjectAnnouncement]
  where 
	remarkid = @id	

end