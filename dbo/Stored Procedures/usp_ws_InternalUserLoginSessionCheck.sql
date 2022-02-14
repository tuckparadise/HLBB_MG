--[usp_ws_InternalUserLoginSessionCheck] 'workgroup\k2admin'

CREATE     procedure [dbo].[usp_ws_InternalUserLoginSessionCheck]
@UserName nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	
	set @error = ''

	declare @currendatettime datetime 
	set @currendatettime = getdate()
	declare @index int 

	set @UserName = ltrim(rtrim(@UserName))

	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 
	/*
	else 
	begin
		if (@UserName like '%\%') 
		begin			
			select @index = CHARINDEX('\', @UserName)

			set @UserName = Stuff(@UserName, 1,@index, '')
		end 
	end 
	*/
	
	--select @username

	if (@username like '%\%')
	begin		

		SELECT @UserName = SUBSTRING(@UserName, CASE CHARINDEX('\', @UserName)
        WHEN 0
            THEN LEN(@UserName) + 1
        ELSE CHARINDEX('\', @UserName) + 1
        END, 1000)
	end

	declare @UsernameWithDomainFromDB nvarchar(max)	

	SELECT @UsernameWithDomainFromDB = username 	
	from InternalUser
	where SUBSTRING(username, CASE CHARINDEX('\', username)
            WHEN 0
                THEN LEN(username) + 1
            ELSE CHARINDEX('\', username) + 1
            END, 1000) = @username 	
	
	/*
	if exists
	(
		select 1
		from InternalUser
		where username = @username 
	)
	*/
	if (@UsernameWithDomainFromDB <> '')
	begin
		insert into InternalUserLoginTrialSession_FailedAttemptLog
		values (@UsernameWithDomainFromDB, @currendatettime, @currendatettime)

		declare @trialminutes int , @trialtimes int

		select @trialminutes = InternalUserLoginTrialsExpiryPeroidInMinutes,
			@trialtimes = InternalUserLoginTrialsNumberOfLoginAllowed
		from Settings

		if not exists
		(
			select 1
			from InternalUserLoginTrialSession
			where UserName = @UsernameWithDomainFromDB
		)
		begin		
			insert into InternalUserLoginTrialSession
			values (@UsernameWithDomainFromDB, @trialtimes -1, getdate(), '1900-01-01' )
		end 
		else
		begin
			--declare @timeexpired datetime , 
			declare @TrialExpired int 

			select 
				@TrialExpired = TrialLeft
			from InternalUserLoginTrialSession
			where UserName = @UsernameWithDomainFromDB

			--select @TrialExpired , @timeexpired, @currendatettime

			--if (@currendatettime < @timeexpired)
			--begin
				if (@TrialExpired >1)
				begin
					--select 'hi2'
					update InternalUserLoginTrialSession
					set TrialLeft = TrialLeft - 1,
						LoginTrialDatetime = getdate()
					where UserName = @UsernameWithDomainFromDB				
				end 
				else 
				begin
					--select 'hi'
					set @error = 'Max Login trials exceeded. Your account is locked. Please contact system administrator to unlock your account'

					update InternalUser
					set [status] = 'Inactive'
					where UserName = @UsernameWithDomainFromDB
				end 	
			/*		
			end 
			else
			begin	
				--select 'hi'
				delete from InternalUserLoginTrialSession where UserName = @UserName

				insert into InternalUserLoginTrialSession
				values (@UserName, @trialtimes -1, getdate(), DATEADD(MINUTE, @trialminutes, getdate()) )
			
			end 
			*/
		end 
	end 

	
end