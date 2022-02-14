CREATE procedure [dbo].[usp_ValuerLogin_ForcePasswordChangeCheck]
@vcode nvarchar(100) = null,
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	if exists 
	(
		select 1 from sqlvaluer
		where valuercode = @vcode
			and passwordforcereset = 'Yes'
	)
	begin
		set @error = '1'
	end	

end