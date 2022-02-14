CREATE procedure [dbo].[usp_ValuerLoginSessionCheck]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	
	set @error = ''

	declare @currendatettime datetime 
	set @currendatettime = getdate()

	insert into ValuerLoginTrialSession_FailedAttemptLog
	values (@valuercode, @currendatettime, @currendatettime)

	declare @trialminutes int , @trialtimes int

	--select @trialminutes = ValuerLoginTrialsExpiryPeroidInMinutes,
	select	@trialtimes = ValuerLoginTrialsNumberOfLoginAllowed
	from Settings

	if not exists
	(
		select 1
		from ValuerLoginTrialSession
		where ValuerCode = @valuercode
	)
	begin		
		insert into ValuerLoginTrialSession
		--values (@valuercode, @trialtimes -1, getdate(), DATEADD(MINUTE, @trialminutes, getdate()) )
		values (@valuercode, @trialtimes -1, getdate(), getdate() )
	end 
	else
	begin
		declare @timeexpired datetime , @TrialExpired int 

		--select @timeexpired = Expired,
		select	@TrialExpired = TrialLeft
		from ValuerLoginTrialSession
		where ValuerCode = @valuercode

		--select @TrialExpired , @timeexpired, @currendatettime

		if (@TrialExpired >1)
		begin
			--select 'hi2'
			update ValuerLoginTrialSession
			set TrialLeft = TrialLeft - 1
			where ValuerCode = @valuercode				
		end 
		else 
		begin
			--select 'hi'
			set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

			update SQLValuer
			set [status] = 'Inactive'
			where ValuerCode = @valuercode
		end 

		/*
		if (@currendatettime < @timeexpired)
		begin
			if (@TrialExpired >1)
			begin
				--select 'hi2'
				update ValuerLoginTrialSession
				set TrialLeft = TrialLeft - 1
				where ValuerCode = @valuercode				
			end 
			else 
			begin
				--select 'hi'
				set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

				update SQLValuer
				set [status] = 'Inactive'
				where ValuerCode = @valuercode
			end 			
		end 
		else
		begin	
			--select 'hi'
			delete from ValuerLoginTrialSession where valuercode = @valuercode

			insert into ValuerLoginTrialSession
			values (@valuercode, @trialtimes -1, getdate(), DATEADD(MINUTE, @trialminutes, getdate()) )
		end 
		*/
	end 
end