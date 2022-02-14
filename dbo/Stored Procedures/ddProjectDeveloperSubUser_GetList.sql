CREATE     procedure [dbo].[ddProjectDeveloperSubUser_GetList]
as
begin
	SELECT sub.ID
      ,sub.[Password]
      ,sub.[Status]
      ,sub.[Name]                        
	  ,FORMAT (sub.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]      
	  ,FORMAT (sub.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]
      ,sub.[CreatedUser]
      --,[UpdatedUser]      
	  ,InternalUser.UserFullName as [UpdatedUser]
	  ,FORMAT (sub.LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as ProjectLastLoginDatetime
      ,sub.[PasswordForceReset]      
	  ,FORMAT (sub.[PasswordExpiryDate], 'dd/MM/yyyy') as [PasswordExpiryDate]      
	  ,FORMAT (sub.[PasswordExpiryWarningDate], 'dd/MM/yyyy') as [PasswordExpiryWarningDate]
      --,[IDLastLockedDatetime]
	  ,FORMAT (sub.[IDLastLockedDatetime], 'dd/MM/yyyy HH:mm:ss') as [IDLastLockedDatetime]
      ,sub.[AcknowledgementFlag]
      ,sub.[Email]
	  ,DeveloperCode
	  ,dev.Name as DeveloperName
  FROM [dbo].ddProjectDeveloperSubUser sub
  left join ddProjectDeveloper dev on dev.id = sub.DeveloperCode
  --left join InternalUser on InternalUser.UserName = sub.[UpdatedUser]
  left join InternalUser on InternalUser.UserName = case when sub.UpdatedUser like 'K2:%' then Stuff(sub.UpdatedUser , 1, 3, '') else sub.UpdatedUser  end 
end