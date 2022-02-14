CREATE         procedure [dbo].[ddProjectDeveloperProjectMapping_DeleteDraftByDeveloperCode]
@DeveloperCode nvarchar(max) = null ,
@ChangedUser nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	if (@ChangedUser like 'K2:%')
	begin		
		set @ChangedUser = Stuff(@ChangedUser, 1, 3, '')		
	end 

	delete from ddProjectDeveloperProjectMapping_Draft
	where developercode = @developercode 
		and CreatedUser = @ChangedUser

end