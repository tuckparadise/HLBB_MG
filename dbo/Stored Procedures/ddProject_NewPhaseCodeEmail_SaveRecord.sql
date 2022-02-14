CREATE     procedure [dbo].[ddProject_NewPhaseCodeEmail_SaveRecord]
@ID nvarchar(max) = null
as
begin
	
	update [ddProjectNewPhaseCodeEmailToAdminLog]
	set [EmailSentFlag] = 1,
		[EmailSentDate] = getdate()
	where SurrogateID = @ID
	
	
end