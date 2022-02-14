CREATE   procedure [dbo].[usp_ProjectLogin_ForcePasswordChangeCheck]
@ProjectCode nvarchar(100) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	if exists 
	(
		select 1 from ddProject
		where ProjectCode = @ProjectCode
			and passwordforcereset = 'Yes'
	)
	begin
		set @error = '1'
	end	

end