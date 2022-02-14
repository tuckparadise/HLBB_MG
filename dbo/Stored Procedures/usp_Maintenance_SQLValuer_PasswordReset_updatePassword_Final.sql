CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_updatePassword_Final]
@ValuerCode nvarchar(100),
@EncrypteddefaultPassword nvarchar(max)  = null
as
begin
	declare @expirydayscount int 
	select @expirydayscount = ValuerLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ValuerLoginPasswordMaxExpiryWarningDays
	from settings

	delete from ValuerLoginTrialSession
	where ValuerCode = @valuercode 

	update SQLValuer
	set ValuerPassword = @EncrypteddefaultPassword,
		passwordforcereset = 'Yes',
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())		
	where ValuerCode = @ValuerCode

	/*
	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into [ValuerPasswordHistory]
	values (@ValuerCode, @EncrypteddefaultPassword, getdate(), @encryptionkkey)
	*/
end