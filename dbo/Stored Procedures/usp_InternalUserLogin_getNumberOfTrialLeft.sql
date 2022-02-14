CREATE   procedure [dbo].[usp_InternalUserLogin_getNumberOfTrialLeft]
@UserName nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	declare @index int 
	if (@UserName like 'K2:%')
	begin						
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')
		
	end 

	if exists 
	(
		select TrialLeft 
		from InternalUserLoginTrialSession
		where UserName = @UserName
	)
	begin
		 
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from InternalUserLoginTrialSession
		where UserName = @UserName
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end