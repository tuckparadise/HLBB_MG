CREATE   procedure [dbo].[usp_InternalUser_Session_GetGeneralSessionInSecond]
@TimeInSecond bigint = null output 
as
begin	
	declare @InternalUserSessionInMinutes int

	select @InternalUserSessionInMinutes = InternalUserSessionInMinutes		
	from settings 

	set @TimeInSecond = @InternalUserSessionInMinutes * 60000 

end