CREATE   procedure [dbo].[usp_ProjectLoginSessionCheck]
  @ProjectCode nvarchar(100) = null, 
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	declare @currendatettime datetime 
	set @currendatettime = getdate()

	--declare @trialminutes int , 
	declare @trialtimes int

	insert into ProjectLoginTrialSession_FailedAttemptLog
	values (@ProjectCode, @currendatettime, @currendatettime)

	--select @trialminutes = SolicitorLoginTrialsExpiryPeroidInMinutes,
	select 	@trialtimes = ProjectLoginTrialsNumberOfLoginAllowed
	from ddSettingsExt

	if not exists
	(
		select 1
		from ProjectLoginTrialSession
		where ProjectCode = @ProjectCode
	)
	begin		
		insert into ProjectLoginTrialSession		
		values (@ProjectCode, @trialtimes -1, getdate(), getdate() )
	end 
	else
	begin
		--declare @timeexpired datetime , 
		declare @TrialExpired int 

		--select @timeexpired = Expired,
		select	@TrialExpired = TrialLeft
		from ProjectLoginTrialSession
		where ProjectCode = @ProjectCode

		--select @TrialExpired , @timeexpired, @currendatettime

		if (@TrialExpired >1)
		begin
			--select 'hi2'
			update ProjectLoginTrialSession
			set TrialLeft = TrialLeft - 1
			where ProjectCode = @ProjectCode				
		end 
		else 
		begin
			--select 'hi'
			set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

			update ddProject
			set [status] = 'Inactive'
			where ProjectCode = @ProjectCode
		end 

	end 
  end