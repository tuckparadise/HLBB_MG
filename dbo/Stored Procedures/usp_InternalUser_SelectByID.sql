--drop procedure usp_InternalUser_SelectRecord

CREATE   procedure [dbo].[usp_InternalUser_SelectByID]
@UserName nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	set @Error= ''

	declare @index int 

	if (@UserName like 'K2:%')
	begin		
		set @UserName = Stuff(@UserName, 1, 3, '')
				
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	SELECT [UserName]
      ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[IDLastLockedDatetime]
  FROM [dbo].[InternalUser]
  where username = @UserName

end