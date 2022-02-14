CREATE     procedure [dbo].[usp_InternalUser_Session_ExtendSessionByUserActionAndReturnNewSessionPeriod]
@UserName nvarchar(100) = null,
@TimeInSecond bigint = null output 
as
begin
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')								
	end 

	declare @InternalUserSessionInMinutes int , @InternalUserDormantIDReportPeriodInDays int 
	declare @Expired datetime 

	select @InternalUserSessionInMinutes = InternalUserSessionInMinutes		
	from settings 
		
	set @Expired = DATEADD(MINUTE, @InternalUserSessionInMinutes, getdate())

	update InternalUserSession
	set Expired= @Expired
	where username = @UserName

	set @TimeInSecond = @InternalUserSessionInMinutes * 60000 

end