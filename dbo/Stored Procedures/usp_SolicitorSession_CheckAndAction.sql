CREATE   procedure [dbo].[usp_SolicitorSession_CheckAndAction]
@SolicitorCode nvarchar(100),
@ClientSessionID bigint = null, 
@error nvarchar(max) =null output 
as
begin
	declare @currentdatetime datetime 
	set @currentdatetime= getdate()
	
	set @error = ''

	delete from SolicitorLoginTrialSession
	where SolicitorCode = @solicitorcode

	if exists 
	(
		select 1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode
			and clientsessionid = @ClientSessionID
	)
	begin

		declare @SolicitorSessionInMinutes int 

		select @SolicitorSessionInMinutes = SolicitorSessionInMinutes
		from settings 

		-- session data is valid. extend session period to another 20 minutes 
		update SolicitorSession
		set expired = DATEADD(MINUTE, @SolicitorSessionInMinutes, @currentdatetime) 
		where SolicitorCode = @SolicitorCode
	end 
	else
	begin
		set @error = 'Multiple Sessions detected. Please Login to continue'
	end 

	/*
	if not exists 
	(
		select 1 as col1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode					
	)
	begin
		-- redirect to login page if session data not available  
		set @error = 'Session expired. Please Login'
	end 
	else
	begin
		if exists 
		(			
			select 1 as	col1
			from SolicitorSession
			where SolicitorCode = @SolicitorCode
				and expired < @currentdatetime
		)
		begin			
			-- delete session data and redirect to login page if session data is expired 
			delete from SolicitorSession where SolicitorCode = @SolicitorCode

			set @error = 'Session expired. Please Login'
		end 
		else
		begin
			if exists 
			(
				select 1
				from SolicitorSession
				where SolicitorCode = @SolicitorCode
					and clientsessionid = @ClientSessionID
			)
			begin

				declare @SolicitorSessionInMinutes int 

				select @SolicitorSessionInMinutes = SolicitorSessionInMinutes
				from settings 

				-- session data is valid. extend session period to another 20 minutes 
				update SolicitorSession
				set expired = DATEADD(MINUTE, @SolicitorSessionInMinutes, @currentdatetime) 
				where SolicitorCode = @SolicitorCode
			end 
			else
			begin
				set @error = 'Multiple Sessions detected. Please Login to continue'
			end 
			
		end 
	end 
	*/
end