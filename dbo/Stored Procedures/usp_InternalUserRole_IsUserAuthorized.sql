CREATE   procedure [dbo].[usp_InternalUserRole_IsUserAuthorized]
@UserName nvarchar(max) = null, 
@DUMakerDocumentation bit = null, 
@DUMakerValuation bit = null, 
@MortgageAdmin bit = null, 
@ITAdminApplication bit = null, 
@ITAdminSecurity bit = null, 
@DisbMaker bit = null, 
@DisbChecker bit = null, 
@RCOMaker bit = null, 
@RCOChecker bit = null, 
@TBOMaker bit = null, 
@TBOChecker bit = null, 
@IsManager bit = null, 
@IsSolicitorEditor bit = null, 
@IsValuerEditor bit = null, 
@IsDeveloperEditor bit = null, 
@IsDeveloperStatusEditor bit = null ,
@Error nvarchar(max) = null output  
as
begin
	set @Error = ''
	
	declare @authorized bit 
	set @authorized = 0
	declare @index int 

	DECLARE @user nvarchar(128);
	SET @user = dbo.GetContextUser();

	if (@user like 'K2:%')
	begin		
		set @user = Stuff(@user, 1, 3, '')
				
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
	if exists
	(
		select 1
		from InternalUser
		where UserName = @user
			and [Status] = 'Inactive'
	)
	begin
		set @Error = 'Your Account is Inactive. Contact System Administrator to reactivate your account'
	end 

	if (@Error = '')
	begin
		if  (@DUMakerDocumentation = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDUMakerDocumentation = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@DUMakerValuation = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDUMakerValuation = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@MortgageAdmin = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsMortgageAdmin = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@ITAdminApplication = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsITAdminApplication = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@ITAdminSecurity = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsITAdminSecurity = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@DisbMaker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDisbMaker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@DisbChecker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDisbChecker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@RCOMaker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsRCOMaker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@RCOChecker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsRCOChecker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@TBOMaker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsTBOMaker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		if  (@TBOChecker = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsTBOChecker = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		-- manager 
		if  (@IsManager = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsManager = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		-- 20210409- solicitor editor 
		if  (@IsSolicitorEditor = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsSolicitorEditer = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		-- 20210409- valuer editor 
		if  (@IsValuerEditor = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsValuerEditer = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		-- 20210409- developer editor 
		if  (@IsDeveloperEditor = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDeveloperEditer = 1
			)
			begin
				set @authorized = 1
			end 
		end 

		-- 20210802- developer status editor 
		if  (@IsDeveloperStatusEditor = 1)
		begin
			if exists 
			(
				select 1
				from UserRoleMetric m 
					inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
				where m.UserName = @user and IsDeveloperStatusEditor = 1
			)
			begin
				set @authorized = 1
			end 
		end 
	end 

	if (@Error = '')
	begin
		if (@authorized = 0)
		begin
			set @Error = 'You do not have access to this page' 
		end 
	end 
	
	
end