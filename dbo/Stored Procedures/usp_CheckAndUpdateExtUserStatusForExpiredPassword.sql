CREATE procedure [dbo].[usp_CheckAndUpdateExtUserStatusForExpiredPassword]
as
begin
	update SQLSolicitor
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()

	update SQLValuer 
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()

	update ddProjectDeveloper
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()

	update ddProjectDeveloperSubUser
	set PasswordForceReset = 'Yes'
	where CONVERT(DATETIME, CONVERT(DATE, PasswordExpiryDate)) < getdate()
end