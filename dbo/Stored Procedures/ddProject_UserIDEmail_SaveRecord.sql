create   procedure [dbo].[ddProject_UserIDEmail_SaveRecord]
@LoginID nvarchar(max) = null, 
@IsSubUser nvarchar(max) = null
as
begin
	if (@IsSubUser = 1)
	begin
		update ddProjectDeveloperSubUser
		set EmailSent = 1,
			EmailSentDate = getdate()
		where id = @LoginID
	end 
	else
	begin
		update ddProjectDeveloper
		set EmailSent = 1,
			EmailSentDate = getdate()
		where id = @LoginID
	end
	
end