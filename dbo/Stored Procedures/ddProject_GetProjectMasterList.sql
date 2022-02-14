CREATE   procedure [dbo].[ddProject_GetProjectMasterList]
as
begin
	SELECT ID
      ,[Password]
      ,ddProjectDeveloper.[Status]
      ,[Name]                        
	  ,FORMAT (ddProjectDeveloper.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]      
	  ,FORMAT (ddProjectDeveloper.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
      ,[CreatedUser]
      --,[UpdatedUser]      
	  ,InternalUser.UserFullName as [UpdatedUser]
	  ,FORMAT (ddProjectDeveloper.LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as ProjectLastLoginDatetime
      ,[PasswordForceReset]      
	  ,FORMAT ([PasswordExpiryDate], 'dd/MM/yyyy') as [PasswordExpiryDate]      
	  ,FORMAT ([PasswordExpiryWarningDate], 'dd/MM/yyyy') as [PasswordExpiryWarningDate]
      --,[IDLastLockedDatetime]
	  ,FORMAT (ddProjectDeveloper.[IDLastLockedDatetime], 'dd/MM/yyyy HH:mm:ss') as [IDLastLockedDatetime]
      ,[AcknowledgementFlag]
      ,[Email]
  FROM [dbo].ddProjectDeveloper
 -- left join InternalUser on InternalUser.UserName = ddProjectDeveloper.[UpdatedUser]
  left join InternalUser on InternalUser.UserName = case when ddProjectDeveloper.UpdatedUser like 'K2:%' then Stuff(ddProjectDeveloper.UpdatedUser , 1, 3, '') else ddProjectDeveloper.UpdatedUser  end 

end