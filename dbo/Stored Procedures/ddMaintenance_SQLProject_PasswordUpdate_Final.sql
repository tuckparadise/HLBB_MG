CREATE     procedure [dbo].[ddMaintenance_SQLProject_PasswordUpdate_Final]
@Code nvarchar(100),
@EncryptedNewPassword nvarchar(max) = null
as
begin
	
	declare @expirydayscount int 
	select @expirydayscount = ProjectLoginPasswordMaxExpiryDays
	from ddSettingsExt

	declare @expirywarningdayscount int 
	select @expirywarningdayscount = ProjectLoginPasswordMaxExpiryWarningDays
	from ddSettingsExt

	declare @IsSubUser bit 

	set @IsSubUser = (select [IsSubUser] from ddProject_vw_DeveloperLogin where ID = @Code)

	if (@IsSubUser = 1)
	begin
		update ddProjectDeveloperSubUser 
		set 			
			Password = @EncryptedNewPassword ,
			passwordforcereset = 'No',
			PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
			PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())
		where ID = @Code
	end 
	else
	begin
		update ddProjectDeveloper 
		set 			
			Password = @EncryptedNewPassword ,
			passwordforcereset = 'No',
			PasswordExpiryDate = DATEADD(DAY, @expirydayscount, getdate())	,
			PasswordExpiryWarningDate = DATEADD(DAY, @expirywarningdayscount, getdate())
		where ID = @Code
	end 
	
	 
	declare @encryptionkkey nvarchar(100)

	select @encryptionkkey = EncryptionKey
	from Settings

	insert into ddProjectPasswordHistory
	values (@Code, @EncryptedNewPassword, getdate(), @encryptionkkey)
end