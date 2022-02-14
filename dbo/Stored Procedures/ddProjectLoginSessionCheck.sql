CREATE   procedure [dbo].[ddProjectLoginSessionCheck]
  @ProjectCode nvarchar(100) = null,   
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	declare @currendatettime datetime 
	set @currendatettime = getdate()

	--declare @trialminutes int , 
	declare @trialtimes int

	insert into ddProjectLoginTrialSession_FailedAttemptLog
	values (@ProjectCode, @currendatettime, @currendatettime)

	--select @trialminutes = SolicitorLoginTrialsExpiryPeroidInMinutes,
	select 	@trialtimes = ProjectLoginTrialsNumberOfLoginAllowed
	from ddSettingsExt

	if not exists
	(
		select 1
		from ddProjectLoginTrialSession
		where ProjectCode = @ProjectCode
	)
	begin		
		insert into ddProjectLoginTrialSession		
		values (@ProjectCode, @trialtimes -1, getdate(), getdate() )
	end 
	else
	begin
		--declare @timeexpired datetime , 
		declare @TrialExpired int 

		--select @timeexpired = Expired,
		select	@TrialExpired = TrialLeft
		from ddProjectLoginTrialSession
		where ProjectCode = @ProjectCode

		--select @TrialExpired , @timeexpired, @currendatettime

		if (@TrialExpired >1)
		begin
			--select 'hi2'
			update ddProjectLoginTrialSession
			set TrialLeft = TrialLeft - 1
			where ProjectCode = @ProjectCode				
		end 
		else 
		begin
			--select 'hi'
			set @error = 'Max Login trials exceeded. Your ID is locked. Please contact system administrator to unlock your ID'

			if exists 
			(
				select 1
				from ddProjectDeveloperSubUser
				where ID = @ProjectCode
			)
			begin
				update [ddProjectDeveloperSubUser]
				set [status] = 'Inactive'
				where ID = @ProjectCode
			end 
			else
			begin
				update [ddProjectDeveloper]
				set [status] = 'Inactive'
				where ID = @ProjectCode
			end 
		end 

	end 
  end