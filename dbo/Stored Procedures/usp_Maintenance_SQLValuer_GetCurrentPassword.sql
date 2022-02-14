CREATE   procedure [dbo].[usp_Maintenance_SQLValuer_GetCurrentPassword]
@ValuerCode nvarchar(max) = null ,
@ValuerCurrentPassword nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	select @ValuerCurrentPassword = ValuerPassword
	from sqlvaluer 
	where valuerCode = @ValuerCode
end