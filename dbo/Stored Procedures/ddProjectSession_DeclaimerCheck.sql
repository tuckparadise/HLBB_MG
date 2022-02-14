CREATE     procedure [dbo].[ddProjectSession_DeclaimerCheck]
@ProjectCode nvarchar(100) = null ,
@AcknowledgementFlag bit= null output 
as
begin
	
	if exists 
	(
		select 1
		from ddProjectDeveloperSubUser
		where ID = @ProjectCode
	)
	begin
		set @AcknowledgementFlag = (select isnull(AcknowledgementFlag,0) 
		from ddProjectDeveloperSubUser
		where ID = @ProjectCode	)
	end 
	else
	begin
		set @AcknowledgementFlag = (select isnull(AcknowledgementFlag,0) 
		from [ddProjectDeveloper]
		where ID = @ProjectCode	)
	end 
end