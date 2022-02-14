create   procedure [dbo].[ddProject_UserIDEmail_List]
as
begin	
	SELECT [ID]
      ,[Password]
      ,[Status]
      ,[Name]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
      ,[LastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
      ,[AcknowledgementFlag]
      ,[Email]
      ,[DeveloperCode]
      ,[AcknowledgementUploaded]
      ,[AcknowledgementDateUploaded]
      ,[AcknowledgementDate]
      ,[IsSubUser]
      ,[EmailSent]
      ,[EmailSentDate]	  
	from ddProject_vw_DeveloperLogin 
	where [status] = 'Active'
end