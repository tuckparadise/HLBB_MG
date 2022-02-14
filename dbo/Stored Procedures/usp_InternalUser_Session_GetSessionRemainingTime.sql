CREATE   procedure [dbo].[usp_InternalUser_Session_GetSessionRemainingTime]
@UserName nvarchar(100) = null,
@TimeInSecond bigint = null output 
as
begin
	
	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')					

	end 

	set @TimeInSecond = 0

	declare @SessionExpiryDatetime datetime 

	select @SessionExpiryDatetime = Expired	
	from InternalUserSession
	where username = @UserName	

	set @TimeInSecond = DATEDIFF ( second , getdate() , @SessionExpiryDatetime )  	
	set @TimeInSecond = @TimeInSecond * 1000 

end