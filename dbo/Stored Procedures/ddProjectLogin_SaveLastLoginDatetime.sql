CREATE   procedure [dbo].[ddProjectLogin_SaveLastLoginDatetime]
@ProjectCode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	if exists 
	(
		select 1
		from ddProjectDeveloperSubUser
		where ID = @ProjectCode
	)
	begin
		update ddProjectDeveloperSubUser
		set LastLoginDatetime = getdate()
		where ID = @ProjectCode
	end 
	else 
	begin
		update [ddProjectDeveloper]
		set LastLoginDatetime = getdate()
		where ID = @ProjectCode
	end 
end