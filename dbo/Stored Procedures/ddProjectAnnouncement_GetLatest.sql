CREATE   procedure [dbo].[ddProjectAnnouncement_GetLatest]
@loginid nvarchar(max) = null 
as
begin
	
	declare @lastremarkid bigint 

	set @lastremarkid = (select top 1 remarkid from [ddProjectAnnouncement]   where deleteduser is  null 
				and deleteddate is  null order by CreatedDate desc )

	SELECT [RemarkID]
      ,[Announcement]
      , CreatedUser as [AddedUser]
      --,[AddedDate]
	  ,FORMAT (CreatedDate, 'dd/MM/yyyy HH:mm:ss') as AnnouncementDate
	  ,DeletedUser
	  ,DeletedDate
	  , attachment
  FROM [dbo].[ddProjectAnnouncement]
  where 
	remarkid = @lastremarkid
	--deleteduser is  null 
	--and deleteddate is  null 
	--order by CreatedDate desc 

	insert into ddProjectAnnouncementLog
	values (@lastremarkid, @loginid, getdate())
end