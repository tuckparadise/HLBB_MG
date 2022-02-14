CREATE     procedure [dbo].[ddProjectAnnouncement_List2]
as
begin
	SELECT [RemarkID]
      ,[Announcement]
      --,CreatedUser as [AddedUser]
	  ,[InternalUser].UserFullName as [AddedUser]
      --,[AddedDate]
	  ,FORMAT ([ddProjectAnnouncement].CreatedDate, 'dd/MM/yyyy HH:mm:ss') as 'AddedDate'
	  ,DeletedUser
	  ,DeletedDate
	  , Attachment 
  FROM [dbo].[ddProjectAnnouncement]
	inner join [InternalUser] on [InternalUser].username = [ddProjectAnnouncement].CreatedUser
  where deleteduser is  null 
	and deleteddate is  null 
	order by ddProjectAnnouncement.CreatedDate desc
end