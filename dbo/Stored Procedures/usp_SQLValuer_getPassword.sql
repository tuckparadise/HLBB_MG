CREATE procedure [dbo].[usp_SQLValuer_getPassword]
@ValuerCode nvarchar(100) = null,
@ValuerPassword nvarchar(max)  = null output,
@EncryptionKey nvarchar(max)  = null output
as
begin
	select @ValuerPassword = ValuerPassword
	from SQLValuer
	where ValuerCode = @ValuerCode

	select @EncryptionKey = [EncryptionKey]
	from [Settings]
end