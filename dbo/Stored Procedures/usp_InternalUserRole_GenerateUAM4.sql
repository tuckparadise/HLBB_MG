CREATE     procedure [dbo].[usp_InternalUserRole_GenerateUAM4]
as
begin	

	/*
	Legend:
	- A1: Case Inquiry (Complete)
	- A2: Document Unit
	- A3: Valuation Unit
	- A4: Update LOADS data
	- A5: Parameter Maintenance
	- A6: Manual Form Generator
	- B1: Security Report
	- C1: Dynamic Query Execution
	- D1: Application Settings
	- E1: User Management 
	- E2: Security Feature Settings 
	*/

	truncate table [UAMReport]

	declare @c_username nvarchar(max) 

	declare @A1 bit 
	declare @A2 bit 
	declare @A3 bit 
	declare @A4 bit 
	declare @A5 bit 
	declare @A6 bit 
	declare @B1 bit 
	declare @C1 bit 
	declare @D1 bit 
	declare @E1 bit 
	declare @E2 bit 
	declare @accesslist nvarchar(max)	

	DECLARE cursor_name CURSOR FOR select distinct username from UserRoleMetric 

	OPEN cursor_name;

	FETCH NEXT FROM cursor_name INTO @c_username;

	WHILE @@FETCH_STATUS = 0  
	BEGIN
		--select 'hi' + @c_username
		set @A1 = 0
		set @A2 = 0
		set @A3 = 0
		set @A4 = 0
		set @A5 = 0
		set @A6 = 0
		set @B1 = 0
		set @C1 = 0
		set @D1 = 0
		set @E1 = 0
		set @E2 = 0

		-- DU Maker 
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where IsDUMakerDocumentation = 1
				and username = @c_username
		)
		begin
			set @A1 = 1
			set @A2 = 1			
		end 
	
		-- VU Maker 
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where IsDUMakerValuation = 1
				and username = @c_username
		)
		begin
			set @A1 = 1
			set @A3 = 1			
		end 
	
		-- IsDisbMaker / IsDisbChecker / IsRCOMaker / IsRCOChecker / IsTBOMaker / IsTBOChecker
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where (IsDisbMaker = 1 or IsDisbChecker = 1 or IsRCOMaker = 1 or IsRCOChecker = 1 or IsTBOMaker = 1 or IsTBOChecker = 1)
				and username = @c_username
		)
		begin
			set @A1 = 1		
		end 
	
		-- IsMortgageAdmin
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where IsMortgageAdmin = 1
				and username = @c_username
		)
		begin
			set @A1 = 1		
			set @A2 = 1
			set @A3 = 1
			set @A4 = 1
			set @A5 = 1
			set @A6 = 1	
			set @B1 = 1		
			set @C1 = 1
		end 
	
		-- IsITAdminApplication
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where IsITAdminApplication = 1
				and username = @c_username
		)
		begin
			set @B1 = 1		
			set @C1 = 1
			set @D1 = 1		
		end 
	
		-- IsITAdminSecurity
		if exists
		(
			select 1
			from UserRoleMetric m
				inner join InternalUserRole r on r.UserRoleID = m.UserRoleID
			where IsITAdminSecurity = 1
				and username = @c_username
		)
		begin
			set @B1 = 1		
			set @E1 = 1
			set @E2 = 1		
		end 
	
		set @accesslist = ''
	
		if (@A1 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A1'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A1'
			end 		
		end 
	
		if (@A2 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A2'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A2'
			end 		
		end 
	
		if (@A3 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A3'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A3'
			end 		
		end 
	
		if (@A4 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A4'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A4'
			end 		
		end 
	
		if (@A5 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A5'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A5'
			end 		
		end 
	
		if (@A6 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'A6'
			end 
			else
			begin
				set @accesslist = @accesslist + ';A6'
			end 		
		end 
	
		if (@B1 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'B1'
			end 
			else
			begin
				set @accesslist = @accesslist + ';B1'
			end 		
		end 
	
		if (@C1 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'C1'
			end 
			else
			begin
				set @accesslist = @accesslist + ';C1'
			end 		
		end 
	
		if (@D1 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'D1'
			end 
			else
			begin
				set @accesslist = @accesslist + ';D1'
			end 		
		end 
	
		if (@E1 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'E1'
			end 
			else
			begin
				set @accesslist = @accesslist + ';E1'
			end 		
		end 
	
		if (@E2 = 1)
		begin
			if (@accesslist = '')
			begin
				set @accesslist = 'E2'
			end 
			else
			begin
				set @accesslist = @accesslist + ';E2'
			end 		
		end 
		
		
		INSERT INTO [dbo].[UAMReport]
			   ([UserName]
			   ,[UserEmail]
			   ,[UserFullName]
			   ,[Branch]
			   ,[LastLoginDatetime]
			   ,[Status]
			   ,[CreatedDate]
			   ,[UpdatedDate]
			   ,[IDLastLockedDatetime]
			   ,[AccessList])
		 select UserName,
			UserEmail,
			UserFullName,
			Branch,
			LastLoginDatetime,
			Status,
			getdate(),
			getdate(),
			IDLastLockedDatetime,
			@accesslist
		 from InternalUser
		 where UserName = @c_username
	 
		FETCH NEXT FROM cursor_name into @c_username;  
	END

	CLOSE cursor_name

	DEALLOCATE cursor_name

	
	SELECT u.[UserName] as [UserName]
		  ,[UserEmail]
		  ,[UserFullName]
		  ,[Branch]
		  ,[LastLoginDatetime]
		  ,[Status]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[IDLastLockedDatetime]
		  ,[AccessList]
		  ,tbl1.RoleList
	  FROM [dbo].[UAMReport] u
	  inner join 
		(select
			username,
			stuff((
				select ',' + r.UserRoleName
				from UserRoleMetric t
					inner join InternalUserRole r on r.UserRoleID = t.UserRoleID
				where t.username = t1.username
				order by r.UserRoleName
				for xml path('')
			),1,1,'') as RoleList
		from UserRoleMetric t1
		group by username) tbl1 on tbl1.username = u.username

end