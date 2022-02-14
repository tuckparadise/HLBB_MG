CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordUpdate_Final]
@SolicitorCode nvarchar(100),
@SolicitorEncryptedNewPassword nvarchar(max) = null
as
begin
	
	declare @expirydayscount int 
	select @expirydayscount = SolicitorLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = SolicitorLoginPasswordMaxExpiryWarningDays
	from settings

	update sqlSolicitor 
	set 			
		SolicitorPassword = @SolicitorEncryptedNewPassword ,
		passwordforcereset = 'No'		,
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())		,
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())
	where SolicitorCode = @SolicitorCode

	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into [SolicitorPasswordHistory]
	values (@SolicitorCode, @SolicitorEncryptedNewPassword, getdate(), @encryptionkkey)
	 
end