CREATE procedure [dbo].[usp_getValuerList]
as
begin
	SELECT [ValuerCode]
      ,[ValuerPassword]
      ,[Status]
      ,[ValuerName]
       ,[CreatedDate]
      , [UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
      ,[ValuerLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
	  FROM [dbo].[SQLValuer]
	  /*
	SELECT [ValuerCode]
		  ,[ValuerPassword]
		  ,[Status]
		  ,[ValuerName]
		  ,FORMAT ([CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
		  ,FORMAT ([UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
		  --,[CreatedDate]
		  --,[UpdatedDate]
		  ,[CreatedUser]
		  ,[UpdatedUser]
	  FROM [dbo].[SQLValuer]
	  */
end