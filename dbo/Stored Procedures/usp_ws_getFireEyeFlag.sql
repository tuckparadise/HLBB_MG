CREATE procedure [dbo].[usp_ws_getFireEyeFlag]
as
begin
		select fireeye_flag
		from settings 
end