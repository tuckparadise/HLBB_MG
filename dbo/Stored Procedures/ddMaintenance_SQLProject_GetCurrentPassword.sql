CREATE       procedure [dbo].[ddMaintenance_SQLProject_GetCurrentPassword]
@Code nvarchar(max) = null ,
@CurrentPassword nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	select @CurrentPassword = [Password]
	from ddProject_vw_DeveloperLogin 
	where ID = @Code
end