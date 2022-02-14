CREATE       procedure [dbo].[ddProjectDeveloperProjectMapping_Delete]
@ProjectCode nvarchar(max) = null ,
@ChangedUser nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	if (@ChangedUser like 'K2:%')
	begin		
		set @ChangedUser = Stuff(@ChangedUser, 1, 3, '')		
	end 

	delete from ddProjectDeveloperProjectMapping
	where ProjectCode = @ProjectCode		
	
end