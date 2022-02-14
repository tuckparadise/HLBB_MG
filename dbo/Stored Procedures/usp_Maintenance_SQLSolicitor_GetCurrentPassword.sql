CREATE   procedure [dbo].[usp_Maintenance_SQLSolicitor_GetCurrentPassword]
@SolicitorCode nvarchar(max) = null ,
@SolicitorCurrentPassword nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	select @SolicitorCurrentPassword = SolicitorPassword
	from sqlsolicitor 
	where SolicitorCode = @SolicitorCode
end