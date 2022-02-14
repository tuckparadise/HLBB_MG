CREATE       procedure [dbo].[ddProjectAnnouncementSettings_GetSetting]
as
begin

	select LiveAnnouncementFlag
	from ddProjectAnnouncementSettings
end