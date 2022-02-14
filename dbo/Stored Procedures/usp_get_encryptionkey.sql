CREATE procedure [dbo].[usp_get_encryptionkey]
as
begin
	select EncryptionKey 
	from settings

end