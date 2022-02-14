CREATE procedure [dbo].[usp_SolicitorLogin_ForcePasswordChangeCheck]
@scode nvarchar(100) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	if exists 
	(
		select 1 from sqlsolicitor
		where solicitorcode = @scode
			and passwordforcereset = 'Yes'
	)
	begin
		set @error = '1'
	end	

end