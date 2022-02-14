CREATE       procedure [dbo].[ddProject_InactiveDeveloperLoginID_GetList]
as
begin
		
	SELECT [ID]
      ,[Password]
      ,[Status]
      ,[Name]
      --,[CreatedDate]
	  ,FORMAT (CreatedDate, 'dd/MM/yyyy') as CreatedDate
      --,[UpdatedDate]
	  ,FORMAT (UpdatedDate, 'dd/MM/yyyy') as UpdatedDate
      ,[CreatedUser]
      ,[UpdatedUser]
      --,[LastLoginDatetime]
	  ,FORMAT (LastLoginDatetime, 'dd/MM/yyyy') as LastLoginDatetime
      ,[PasswordForceReset]
      --,[PasswordExpiryDate]
	  ,FORMAT (PasswordExpiryDate, 'dd/MM/yyyy') as PasswordExpiryDate
      --,[PasswordExpiryWarningDate]
	  ,FORMAT (PasswordExpiryWarningDate, 'dd/MM/yyyy') as PasswordExpiryWarningDate
      --,[IDLastLockedDatetime]
	  ,FORMAT (IDLastLockedDatetime, 'dd/MM/yyyy') as IDLastLockedDatetime
      ,[AcknowledgementFlag]
      ,[Email]
	  ,[DeveloperCode] 
	  --,AcknowledgementDate
	  ,FORMAT (AcknowledgementDate, 'dd/MM/yyyy') as AcknowledgementDate
	  , [IsSubUser]
	from ddProject_vw_DeveloperLogin
	where [status] = 'Inactive'

end