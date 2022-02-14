CREATE       procedure [dbo].[ddProject_PasswordReset_GetList]
as
begin
	
	
	WITH ddProject_PasswordReset_Log_LastResetPasswordInfo (ID, LastResetPasswordDatetime) as 
	(
		select ID, max(ResetPasswordDatetime) as LastResetPasswordDatetime
		from ddProject_PasswordReset_Log	
		group by ID 
	)	,
	ddProject_PasswordReset_Log_LastResetPasswordInfo2 (ID, ResetPasswordUser, LastResetPasswordDatetime) as 
	(
		select a.ID, ResetPasswordUser,  a.ResetPasswordDatetime as LastResetPasswordDatetime
		from ddProject_PasswordReset_Log a 	
		inner join ddProject_PasswordReset_Log_LastResetPasswordInfo b on a.ID = b.id and a.ResetPasswordDatetime = b.LastResetPasswordDatetime
	)
	SELECT ddProject_vw_DeveloperLogin.[ID]
      ,[Password]
      ,ddProject_vw_DeveloperLogin.[Status]
      ,[Name]      
	  ,FORMAT (ddProject_vw_DeveloperLogin.CreatedDate, 'dd/MM/yyyy HH:mm:ss') as CreatedDate      
	  ,FORMAT (ddProject_vw_DeveloperLogin.UpdatedDate, 'dd/MM/yyyy HH:mm:ss') as UpdatedDate
      ,[CreatedUser]
      ,[UpdatedUser]      
	  ,FORMAT (ddProject_vw_DeveloperLogin.LastLoginDatetime, 'dd/MM/yyyy HH:mm:ss') as LastLoginDatetime
      ,[PasswordForceReset]      
	  ,FORMAT (PasswordExpiryDate, 'dd/MM/yyyy') as PasswordExpiryDate      
	  ,FORMAT (PasswordExpiryWarningDate, 'dd/MM/yyyy') as PasswordExpiryWarningDate      
	  ,FORMAT (ddProject_vw_DeveloperLogin.IDLastLockedDatetime, 'dd/MM/yyyy HH:mm:ss') as IDLastLockedDatetime
      ,[AcknowledgementFlag]
      ,[Email]
	  ,ddProject_vw_DeveloperLogin.[DeveloperCode] as [DeveloperCode] 	  
	  ,FORMAT (AcknowledgementDate, 'dd/MM/yyyy HH:mm:ss') as AcknowledgementDate
	  , [IsSubUser]
	  , InternalUser.UserFullName as [LastResetPasswordAdmin]	  
	  ,FORMAT (ddProject_PasswordReset_Log_LastResetPasswordInfo2.LastResetPasswordDatetime, 'dd/MM/yyyy HH:mm:ss') as LastResetPasswordDatetime
	from ddProject_vw_DeveloperLogin	
	left join ddProject_PasswordReset_Log_LastResetPasswordInfo2 on ddProject_PasswordReset_Log_LastResetPasswordInfo2.id = ddProject_vw_DeveloperLogin.ID
	left join InternalUser on InternalUser.UserName = ddProject_PasswordReset_Log_LastResetPasswordInfo2.ResetPasswordUser
end