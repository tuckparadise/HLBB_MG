CREATE   procedure [dbo].[ddProjectAnnouncement_List]
as
begin
	SELECT [RemarkID]
      ,[Announcement]
      ,CreatedUser as [AddedUser]
      --,[AddedDate]
	  ,FORMAT (CreatedDate, 'dd/MM/yyyy HH:mm:ss') as 'AddedDate'
	  ,DeletedUser
	  ,DeletedDate
	  , Attachment 
  FROM [dbo].[ddProjectAnnouncement]
  where deleteduser is  null 
	and deleteddate is  null 
	order by ddProjectAnnouncement.CreatedDate desc
end