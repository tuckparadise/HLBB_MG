CREATE   procedure [dbo].[ddMaintenance_SQLDeveloper_PasswordReset_updatePassword_Final]
@ID nvarchar(100)= null,
@EncrypteddefaultPassword nvarchar(max)  = null
as
begin
	declare @expirydayscount int 
	select @expirydayscount = projectLoginPasswordMaxExpiryDays
	from ddSettingsExt

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ProjectLoginPasswordMaxExpiryWarningDays
	from ddSettingsExt

	delete from ddProjectLoginTrialSession
	where ProjectCode = @ID 

	
	declare @IsSubUser bit 

	set @IsSubUser = (select [IsSubUser] from ddProject_vw_DeveloperLogin where ID = @ID)

	if (@IsSubUser = 1)
	begin
		update ddProjectDeveloperSubUser
		set Password = @EncrypteddefaultPassword,
			passwordforcereset = 'Yes',
			PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
			PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())		
		where ID = @ID
	end 
	else
	begin
		update ddProjectDeveloper
		set Password = @EncrypteddefaultPassword,
			passwordforcereset = 'Yes',
			PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
			PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())		
		where ID = @ID
	end 

	
end