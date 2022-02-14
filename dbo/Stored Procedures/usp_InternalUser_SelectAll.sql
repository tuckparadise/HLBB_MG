CREATE   procedure [dbo].[usp_InternalUser_SelectAll]
as
begin
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

end