create   procedure [dbo].[usp_ValuerSession_GetSessionTime]
@TimeInSecond bigint = null output 
as
begin
	select @TimeInSecond = ValuerSessionInMinutes
	from Settings

	set @TimeInSecond = @TimeInSecond * 60000 
	--set @TimeInSecond = 5000 
end