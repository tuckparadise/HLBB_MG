CREATE       procedure [dbo].[ddProjectDeveloperProjectMapping_Add]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@ProjectName nvarchar(max) = null ,
@ChangedUser nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	if (@ChangedUser like 'K2:%')
	begin		
		set @ChangedUser = Stuff(@ChangedUser, 1, 3, '')		
	end 

	if (isnull(ltrim(rtrim(@ProjectCode)),'') <> '')
	begin
		/*
		delete from ddProjectDeveloperProjectMapping_Draft
		where developercode = @DeveloperCode 
			and projectcode = @ProjectCode 
			--and ProjectName = @ProjectName 
			and CreatedUser = @ChangedUser
		*/
		
		insert into ddProjectDeveloperProjectMapping_Draft
		values (@ProjectCode, @ProjectName, @DeveloperCode, getdate(), getdate(), @ChangedUser, @ChangedUser)
	end 
	

	/*
	if not exists 
	(
		select 1
		from ddProjectDeveloperProjectMapping
		where developercode = @developercode and projectcode = @ProjectCode
	)
	begin
		insert into ddProjectDeveloperProjectMapping
		values (@ProjectCode, @ProjectName, @DeveloperCode, getdate(), getdate(), @ChangedUser, @ChangedUser)
	end 
	*/
end