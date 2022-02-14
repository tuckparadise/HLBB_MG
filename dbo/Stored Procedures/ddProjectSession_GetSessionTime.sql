CREATE   procedure [dbo].[ddProjectSession_GetSessionTime]
@TimeInSecond bigint = null output 
as
begin
	select @TimeInSecond = ProjectSessionInMinutes
	from ddSettingsExt

	set @TimeInSecond = @TimeInSecond * 60000 
	--set @TimeInSecond = 5000 
end