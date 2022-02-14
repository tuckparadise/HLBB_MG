CREATE   procedure [dbo].[ddProject_getPassword]
@ProjectCode nvarchar(100) = null,
@ProjectPassword nvarchar(max)  = null output,
@EncryptionKey nvarchar(max)  = null output
as
begin
	select @ProjectPassword = [Password]
	from ddProject_vw_DeveloperLogin
	where ID = @ProjectCode

	select @EncryptionKey = [EncryptionKey]
	from [Settings]
	
end