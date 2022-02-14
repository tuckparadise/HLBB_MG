CREATE   procedure [dbo].[usp_InternalUser_Session_check_and_create]
@UserName nvarchar(100) = null,
@LogonDatetime datetime = null, 
@Expired datetime = null, 
@ClientIPAddress nvarchar(100) = null, 
@output nvarchar(max) = null output 
as
begin
		
	set @output = ''

	set @LogonDatetime = getdate()
	
	declare @InternalUserSessionInMinutes int , @InternalUserDormantIDReportPeriodInDays int 

	select @InternalUserSessionInMinutes = InternalUserSessionInMinutes,
		@InternalUserDormantIDReportPeriodInDays = InternalUserDormantIDReportPeriodInDays
	from settings 
		
	set @Expired = DATEADD(MINUTE, @InternalUserSessionInMinutes, @LogonDatetime)

	declare @index int 
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 

	update InternalUser
	set LastLoginDatetime= @LogonDatetime
	where username = @UserName

	
	insert into InternalUserLoginLog
	values (@username, @LogonDatetime, getdate())
	

	delete from InternalUserLoginTrialSession
	where username = @username

	/*
	declare @DormantDatetime datetime 
	set @DormantDatetime = DATEADD(DAY, @InternalUserDormantIDReportPeriodInDays, @LogonDatetime)
	
	
	begin tran 
	if exists 
	(
		select 1
		from InternalUserLoginTrail
		where username = @UserName
	)
	begin
		update InternalUserLoginTrail
		set LastLogonDatetime = @LogonDatetime,
			DormantDatetime = @DormantDatetime
		where username = @UserName
	end 
	else
	begin
		insert into InternalUserLoginTrail
		values (@UserName, @LogonDatetime, @DormantDatetime)
	end 
	commit 
	*/

	if (@ClientIPAddress like '%.%.%.%')
	begin
		if exists
		(
			select 1
			from InternalUserSession
			where username = @UserName			
		)
		begin

			declare @LastIP nvarchar(max)  , @LastLoginDatetime datetime 
			select @LastIP = ClientIPAddress , @LastLoginDatetime = LogonDatetime
			from InternalUserSession
			where username = @UserName	

			if exists 
			(
				select 1
				from InternalUserSession
				where username = @UserName	
					and expired < @LogonDatetime
			)
			begin
				-- session expired, recreate session 
				delete InternalUserSession
				where username = @UserName

				insert into InternalUserSession (UserName, LogonDatetime, Expired, ClientIPAddress)
				values (@UserName, @LogonDatetime, @Expired, @ClientIPAddress)
			end 
			else
			begin
				if not exists 
				(
					select 1
					from InternalUserSession
					where username = @UserName	
						--and expired < @LogonDatetime	
						and clientipaddress = @clientipaddress
				)
				begin
					-- session existed on another terminal, reject session 
					declare @currentsessionexpirydatetime datetime 
					select @currentsessionexpirydatetime = expired
					from InternalUserSession
					where username = @UserName	

					declare @timedifferent int 
					select @timedifferent=  DATEDIFF(minute, @LogonDatetime, @currentsessionexpirydatetime);

					if (@timedifferent = 0 )
					begin
						set @timedifferent = 1
					end 

					set @output = 'Seperate Session detected on another terminal. Log out the other terminal or wait for another ' + cast(@timedifferent as nvarchar(max)) + ' minutes and login again.<br>'
					set @output = @output + 'IP Address for current terminal: ' + @clientipaddress + '<br>'					
					set @output = @output + 'IP Address for the other terminal: ' + @LastIP + '<br>'
				end 
				else
				begin
					-- existing session within expired time and using same terminal, extend the session 
					update InternalUserSession
					set LogonDatetime = @LogonDatetime,
						expired = @Expired
					where username = @UserName
				end 
			
			end 		
		end 
		else
		begin		
			-- initial login, create session
			insert into InternalUserSession (UserName, LogonDatetime, Expired, ClientIPAddress)
			values (@UserName, @LogonDatetime, @Expired, @ClientIPAddress)
		end 
	end 

	

end