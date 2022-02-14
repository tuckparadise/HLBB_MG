CREATE   procedure [dbo].[ddProjectSession_Delete]
@ProjectCode nvarchar(100),
@error nvarchar(max) =null output 
as
begin

	insert into ddProjectLogoutLog
	values (@ProjectCode, getdate(), getdate())

	delete from ddProjectSession
	where ProjectCode = @ProjectCode

end