CREATE procedure [dbo].[usp_ValuerLogin_SaveLastLoginDatetime]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	update SQLValuer
	set ValuerLastLoginDatetime = getdate()
	where ValuerCode = @valuercode

end