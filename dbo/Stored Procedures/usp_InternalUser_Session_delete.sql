CREATE procedure [dbo].[usp_InternalUser_Session_delete]
@UserName nvarchar(100) = null, 
@output nvarchar(max) = null
as
begin

	declare @index int 
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 

	delete from InternalUserSession
	where UserName = @UserName
end