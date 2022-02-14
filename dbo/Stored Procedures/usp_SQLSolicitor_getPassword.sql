CREATE procedure [dbo].[usp_SQLSolicitor_getPassword]
@SolicitorCode nvarchar(100) = null,
@SolicitorPassword nvarchar(max)  = null output,
@EncryptionKey nvarchar(max)  = null output
as
begin
	select @SolicitorPassword = SolicitorPassword
	from SQLSolicitor
	where SolicitorCode = @SolicitorCode

	select @EncryptionKey = [EncryptionKey]
	from [Settings]
	
end