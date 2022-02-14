CREATE     procedure [dbo].[ddProjectSession_CheckAndAction]
@ProjectCode nvarchar(100),
@ClientSessionID bigint = null, 
@error nvarchar(max) =null output 
as
begin
	declare @currentdatetime datetime 
	set @currentdatetime= getdate()
	
	set @error = ''

	delete from ddProjectLoginTrialSession
	where ProjectCode = @ProjectCode

	if exists 
	(
		select 1
		from ddProjectSession
		where ProjectCode = @ProjectCode
			and clientsessionid = @ClientSessionID
	)
	begin

		declare @ProjectSessionInMinutes int 

		select @ProjectSessionInMinutes = ProjectSessionInMinutes
		from ddSettingsExt 

		-- session data is valid. extend session period to another 20 minutes 
		update ddProjectSession
		set expired = DATEADD(MINUTE, @ProjectSessionInMinutes, @currentdatetime) 
		where ProjectCode = @ProjectCode
	end 
	else
	begin
		set @error = 'Multiple Sessions detected. Please Login to continue'
	end 

end