create    procedure [dbo].[ddProjectAnnouncement_LatestAnnouncementReadCheck]
@loginid nvarchar(max) = null ,
@read int = null output 
as
begin

	set @read = 0 

	declare @lastremarkid bigint 

	set @lastremarkid = (select top 1 remarkid from [ddProjectAnnouncement]   where deleteduser is  null 
				and deleteddate is  null order by CreatedDate desc )

	if exists 
	(
		select 1
		from ddProjectAnnouncementLog
		where loginid = @loginid
			and remarkid = @lastremarkid
	)
	begin
		set @read = 1
	end 	

end