CREATE   procedure [dbo].[ddProjectEmailToDeveloperLog_SaveRecord]
@SurrogateID bigint = null
as
begin	
	update ddProjectEmailToDeveloperLog
	set 
		--EmailSentFlag= case when [EmailReceiver] = '' then 0 else 1 end,
		EmailSentFlag = 1,
		EmailSentDate = getdate()		
	where SurrogateID = @SurrogateID
end