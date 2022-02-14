/****** Script for SelectTopNRows command from SSMS  ******/


CREATE procedure [dbo].[usp_getSolicitorList]
as
begin
	SELECT [SolicitorCode]
      ,[SolicitorPassword]
      ,[Status]
      ,[SolicitorName]
      ,[CreatedDate]
      , [UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
      ,[SolicitorLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]	
  FROM [dbo].[SQLSolicitor]
end