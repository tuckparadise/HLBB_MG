CREATE procedure [dbo].[usp_SolicitorLogin_SaveLastLoginDatetime]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''
	
	update SQLSolicitor
	set SolicitorLastLoginDatetime = getdate()
	where SolicitorCode = @solicitorcode

end