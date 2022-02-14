CREATE procedure [dbo].[usp_SolicitorSession_GetSessionTime]
@TimeInSecond bigint = null output 
as
begin
	select @TimeInSecond = SolicitorSessionInMinutes
	from Settings

	set @TimeInSecond = @TimeInSecond * 60000 
	--set @TimeInSecond = 5000 
end