CREATE     procedure [dbo].[usp_InternalUserRole_SelectAllWithAccess]
as
begin

	truncate table InternalUserRole_AccessList

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
	declare @c_UserRoleID nvarchar(max) 

	DECLARE cursor_name CURSOR FOR select distinct UserRoleID from InternalUserRole 

	OPEN cursor_name;

	FETCH NEXT FROM cursor_name INTO @c_UserRoleID;

	WHILE @@FETCH_STATUS = 0  
	BEGIN		
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
			from InternalUserRole 
			where IsDUMakerDocumentation = 1				
				and UserRoleID = @c_UserRoleID
		)
		begin
			set @A1 = 1
			set @A2 = 1			
		end 
	
		-- VU Maker 
		if exists
		(
			select 1			
			from InternalUserRole 
			where IsDUMakerValuation = 1				
				and UserRoleID = @c_UserRoleID			
		)
		begin
			set @A1 = 1
			set @A3 = 1			
		end 
	
		-- IsDisbMaker / IsDisbChecker / IsRCOMaker / IsRCOChecker / IsTBOMaker / IsTBOChecker
		if exists
		(
			select 1			
			from InternalUserRole 
			where (IsDisbMaker = 1 or IsDisbChecker = 1 or IsRCOMaker = 1 or IsRCOChecker = 1 or IsTBOMaker = 1 or IsTBOChecker = 1)
				and UserRoleID = @c_UserRoleID
		)
		begin
			set @A1 = 1		
		end 
	
		-- IsMortgageAdmin
		if exists
		(
			select 1			
			from InternalUserRole 
			where IsMortgageAdmin = 1
				and UserRoleID = @c_UserRoleID			
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
			from InternalUserRole 
			where IsITAdminApplication = 1
				and UserRoleID = @c_UserRoleID			
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
			from InternalUserRole 
			where IsITAdminSecurity = 1
				and UserRoleID = @c_UserRoleID					
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
		
		INSERT INTO [dbo].[InternalUserRole_AccessList]
           ([UserRoleID]
           ,[UserRoleName]
           ,[UserRoleDescription]
           ,[AccessList]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[CreatedUser]
           ,[UpdatedUser])
		 select [UserRoleID]
			   ,[UserRoleName]
			   ,[UserRoleDescription]
			   ,@accesslist
			   ,getdate()
			   ,getdate()
			   ,[CreatedUser]
			   ,[UpdatedUser]
		 from InternalUserRole
		 where [UserRoleID] = @c_UserRoleID
	 
		FETCH NEXT FROM cursor_name into @c_UserRoleID;  
	END

	CLOSE cursor_name

	DEALLOCATE cursor_name

	SELECT [UserRoleID]
		  ,[UserRoleName]
		  ,[UserRoleDescription]
		  ,[AccessList]
		  ,[CreatedDate]
		  ,[UpdatedDate]
		  ,[CreatedUser]
		  ,[UpdatedUser]
	FROM [dbo].[InternalUserRole_AccessList]
end