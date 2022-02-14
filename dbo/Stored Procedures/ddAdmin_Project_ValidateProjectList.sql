CREATE       procedure [dbo].[ddAdmin_Project_ValidateProjectList]
@ID nvarchar(max) = null,
@LoginUserEmail nvarchar(max) = null, 	
@Error nvarchar(max) = null output 
as
begin

	set @Error = ''
		
	if (@Error = '')
	begin
		declare @ProjectCodeCount int 
		set @ProjectCodeCount  = ( select count(*) from ddProjectDeveloperProjectMapping_Draft WHERE developercode = @id )

		if (@ProjectCodeCount = 0)
		begin
			SET @Error = @Error + 'Please Add At Least 1 Project<br>'
		end 
	end 
	
	if (@Error = '')
	begin
		if exists
		(
			select projectcode, count(*)
			from ddProjectDeveloperProjectMapping_Draft
			WHERE developercode = @id
			group by projectcode
			having count(*) >1

		)
		begin
			SET @Error = @Error + 'Duplicate Project Code<br>'
		end 
	end 
	
	if (@Error = '')
	begin
		if exists
		(
			select 1
			from ddProjectDeveloperProjectMapping_Draft
			WHERE developercode = @id
				and (isnull(ProjectCode,'') = '' or isnull(ProjectName,'') = '')
				

		)
		begin
			SET @Error = @Error + 'Project Code And Project Name Cannot be Blank<br>'
		end 
	end 

	if (@Error = '')
	begin
		declare @curProjectCode nvarchar(max)

		DECLARE db_cursor CURSOR FOR 
		SELECT ProjectCode 
		FROM ddProjectDeveloperProjectMapping
		WHERE DeveloperCode = @ID

		OPEN db_cursor  
		FETCH NEXT FROM db_cursor INTO @curProjectCode 

		WHILE @@FETCH_STATUS = 0  
		BEGIN  
			
			declare @ProjectCodeInDraft bit  
			declare @ProjectCodeInPhaseCode bit  

			set @ProjectCodeInDraft = 0			
			set @ProjectCodeInPhaseCode = 0

			if exists 
			(
				select 1
				FROM ddProjectDeveloperProjectMapping_Draft
				WHERE DeveloperCode = @ID 
					and ProjectCode = @curProjectCode
			)
			begin
				set @ProjectCodeInDraft = 1
			end 

			if exists 
			(
				select 1
				FROM ddProjectPhase
				WHERE DeveloperCode = @ID 
					and ProjectCode = @curProjectCode
			)
			begin
				set @ProjectCodeInPhaseCode = 1
			end 

			if (@ProjectCodeInDraft = 0 and @ProjectCodeInPhaseCode = 1)
			begin 
				SET @Error = @Error + 'Project Code:' + @curProjectCode + ' Is In Use In Phase Parameter<br>'
			end 
			
			declare @ProjectCodeInSQLLOADS bit  
				
			set @ProjectCodeInSQLLOADS = 0

			if exists 
			(
				select 1
				FROM SQLLOADS
				WHERE DeveloperCode = @ID 
					and ProjectCode = @curProjectCode
			)
			begin
				set @ProjectCodeInSQLLOADS = 1
			end 

			if (@ProjectCodeInDraft = 0 and @ProjectCodeInSQLLOADS = 1)
			begin 
				SET @Error = @Error + 'Project Code:' + @curProjectCode + ' Is In Use<br>'
			end 

			FETCH NEXT FROM db_cursor INTO @curProjectCode 
		END 

		CLOSE db_cursor  
		DEALLOCATE db_cursor 
	end 
end