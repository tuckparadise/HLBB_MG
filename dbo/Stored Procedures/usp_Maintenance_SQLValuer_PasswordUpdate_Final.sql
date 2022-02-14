CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordUpdate_Final]
@ValuerCode nvarchar(100),
@ValuerEncryptedNewPassword nvarchar(max) = null
as
begin
	
	declare @expirydayscount int 
	select @expirydayscount = ValuerLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ValuerLoginPasswordMaxExpiryWarningDays
	from settings

	update sqlValuer 
	set 			
		ValuerPassword = @ValuerEncryptedNewPassword ,
		passwordforcereset = 'No',
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())
	where ValuerCode = @ValuerCode
	 
	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into [ValuerPasswordHistory]
	values (@ValuerCode, @ValuerEncryptedNewPassword, getdate(), @encryptionkkey)
end