create   procedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_SaveRecord]
@LoginID nvarchar(max) ,
@IsSubUser bit 
as
begin
	
	if (@IsSubUser = 1)
	begin
		update ddProjectDeveloperSubUser
		set AcknowledgementUploaded = 1,
			AcknowledgementDateUploaded = getdate()
		where id = @LoginID
		
	end 
	else
	begin
		update ddProjectDeveloper
		set AcknowledgementUploaded = 1,
			AcknowledgementDateUploaded = getdate()
		where id = @LoginID
	end 

end