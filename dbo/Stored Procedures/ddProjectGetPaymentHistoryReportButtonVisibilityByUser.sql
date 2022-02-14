create             procedure [dbo].[ddProjectGetPaymentHistoryReportButtonVisibilityByUser]
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
						
	end 
	
	--IsMortgageAdmin
	if exists 
	(
		select 1
		from UserRoleMetric m 
			inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
		where m.UserName = @UserName and IsMortgageAdmin = 1
	)
	begin
		set @output = 'Yes'
	end 

	--Maker
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
	
	--checker
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

	--rco maker
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
end