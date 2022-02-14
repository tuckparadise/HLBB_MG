create   procedure [dbo].[ddProjectAnnouncement_GetLatestAttachment]
@id bigint = null
as
begin

	select attachment from [ddProjectAnnouncement]
	where [RemarkID] = @id
end