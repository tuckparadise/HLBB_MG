--[aa_GetDisbMakerButtonVisibilityByUser]
--[aa_GetDisbCheckerButtonVisibilityByUser]
--[aa_GetRCOCheckerButtonVisibilityByUser]
--[aa_GetRCOMakerButtonVisibilityByUser]

CREATE       procedure [dbo].[aa_GetDisbursementButtonVisibilityByUser]
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
	
	--IsRCOChecker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsRCOChecker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsRCOMaker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsRCOMaker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDisbChecker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDisbChecker = 1
	)
	begin
		set @output = 'Yes'
	end 

	--IsDisbMaker
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsDisbMaker = 1
	)
	begin
		set @output = 'Yes'
	end 
end