CREATE     procedure [dbo].[aa_GetDynamicQueryExecutionButtonVisibilityByUser]
@UserName nvarchar(max) = null,
@output nvarchar(max) = null output
as
begin
	set @output = 'No'
	
	declare @authorized bit 
	set @authorized = 1
	declare @index int 

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
		else
		begin
			set @UserName = @UserName
		end
	end 
	*/
	/*
	--IsMortgageAdmin
	if exists 
	(
		select *
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where 
			IsMortgageAdmin = 1 and m.UserName = @UserName 
	)
	begin
		set @output = 'Yes'
	end 
	*/
	--IsITAdminApplication
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsITAdminApplication = 1
	)
	begin
		set @output = 'Yes'
	end 

end