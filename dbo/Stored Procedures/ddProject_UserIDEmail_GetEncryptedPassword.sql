create   procedure [dbo].[ddProject_UserIDEmail_GetEncryptedPassword]
@LoginID nvarchar(max) = null,
@IsSubUser nvarchar(max) = null,
@EncryptedPassword nvarchar(max) = null output 
as
begin
	set @EncryptedPassword = (select [password] from ddProject_vw_DeveloperLogin where id = @LoginID and IsSubUser = @IsSubUser )

end