CREATE procedure [dbo].[usp_SolicitorLoginSessionCheck]
  @solicitorcode nvarchar(100) = null, 
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	declare @currendatettime datetime 
	set @currendatettime = getdate()

	--declare @trialminutes int , 
	declare @trialtimes int

	insert into SolicitorLoginTrialSession_FailedAttemptLog
	values (@solicitorcode, @currendatettime, @currendatettime)

	--select @trialminutes = SolicitorLoginTrialsExpiryPeroidInMinutes,
	select 	@trialtimes = SolicitorLoginTrialsNumberOfLoginAllowed
	from Settings

	if not exists
	(
		select 1
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode
	)
	begin		
		insert into SolicitorLoginTrialSession
		--values (@solicitorcode, @trialtimes -1, getdate(), DATEADD(MINUTE, @trialminutes, getdate()) )
		values (@solicitorcode, @trialtimes -1, getdate(), getdate() )
	end 
	else
	begin
		--declare @timeexpired datetime , 
		declare @TrialExpired int 

		--select @timeexpired = Expired,
		select	@TrialExpired = TrialLeft
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode

		--select @TrialExpired , @timeexpired, @currendatettime

		if (@TrialExpired >1)
		begin
			--select 'hi2'
			update SolicitorLoginTrialSession
			set TrialLeft = TrialLeft - 1
			where SolicitorCode = @solicitorcode				
		end 
		else 
		begin
			--select 'hi'
			set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

			update SQLSolicitor
			set [status] = 'Inactive'
			where SolicitorCode = @solicitorcode
		end 

		/*
		if (@currendatettime < @timeexpired)
		begin
			if (@TrialExpired >1)
			begin
				--select 'hi2'
				update SolicitorLoginTrialSession
				set TrialLeft = TrialLeft - 1
				where SolicitorCode = @solicitorcode				
			end 
			else 
			begin
				--select 'hi'
				set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

				update SQLSolicitor
				set [status] = 'Inactive'
				where SolicitorCode = @solicitorcode
			end 			
		end 
		else
		begin	
			--select 'hi'
			delete from SolicitorLoginTrialSession where solicitorcode = @solicitorcode

			insert into SolicitorLoginTrialSession
			values (@solicitorcode, @trialtimes -1, getdate(), DATEADD(MINUTE, @trialminutes, getdate()) )
		end 
		*/
	end 
  end