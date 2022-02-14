CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_updatePassword_Final]
@SolicitorCode nvarchar(100),
@EncrypteddefaultPassword nvarchar(max)  = null
as
begin

	declare @expirydayscount int 
	select @expirydayscount = SolicitorLoginPasswordMaxExpiryDays
	from settings

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = SolicitorLoginPasswordMaxExpiryWarningDays
	from settings

	delete from SolicitorLoginTrialSession
	where SolicitorCode = @solicitorcode

	update SQLSolicitor
	set 
		PasswordForceReset = 'Yes',
		PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate()),
		PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())	,
		SolicitorPassword = @EncrypteddefaultPassword	
	where SolicitorCode = @SolicitorCode

	--insert into [SolicitorPasswordHistory]
	--values (@SolicitorCode, @EncrypteddefaultPassword, getdate())
end