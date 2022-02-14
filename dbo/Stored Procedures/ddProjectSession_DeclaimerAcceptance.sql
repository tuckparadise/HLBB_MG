CREATE     procedure [dbo].[ddProjectSession_DeclaimerAcceptance]
@ProjectCode nvarchar(100)
as
begin
	
	if exists 
	(
		select 1
		from ddProjectDeveloperSubUser
		where ID = @ProjectCode
	)
	begin
		update ddProjectDeveloperSubUser
		set AcknowledgementFlag = 1,
			AcknowledgementDate = getdate()
		where ID = @ProjectCode
	end 
	else
	begin
		update [ddProjectDeveloper]
		set AcknowledgementFlag = 1,
			AcknowledgementDate = getdate()
		where ID = @ProjectCode
	end 

	

end