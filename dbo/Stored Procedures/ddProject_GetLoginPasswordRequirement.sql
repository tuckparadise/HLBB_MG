create   procedure [dbo].[ddProject_GetLoginPasswordRequirement]
@passwordRequirement nvarchar(max) = null output 
as
begin
	declare @minlength int 
	select @minlength = ProjectPasswordMinCharacters
	from ddSettingsExt 

	set @passwordRequirement = 'New Password must have at least ' + ltrim(rtrim(str(@minlength)))+ ' characters; 1 number; 1 special character; 1 upper case and 1 lower case'
	
end