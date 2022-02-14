CREATE       view [dbo].[ddProject_vw_DeveloperLogin]
as

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
	  ,[ID] as [DeveloperCode] 
	  ,AcknowledgementUploaded 
	  ,AcknowledgementDateUploaded
	  ,AcknowledgementDate
	  --,FORMAT (AcknowledgementDate, 'dd/MM/yyyy') as AcknowledgementDate
	  ,0 as [IsSubUser]
	  ,case when EmailSent = 1 then 'Yes' else 'No' end as EmailSent
	  ,FORMAT (EmailSentDate, 'dd/MM/yyyy HH:mm:ss') as EmailSentDate
  FROM [dbo].[ddProjectDeveloper]
  union 
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
	  ,AcknowledgementUploaded 
	  ,AcknowledgementDateUploaded
	  ,AcknowledgementDate
	  --,FORMAT (AcknowledgementDate, 'dd/MM/yyyy') as AcknowledgementDate
	  ,1 as [IsSubUser]
	  ,case when EmailSent = 1 then 'Yes' else 'No' end as EmailSent	  
	  ,FORMAT (EmailSentDate, 'dd/MM/yyyy HH:mm:ss') as EmailSentDate
  FROM [dbo].[ddProjectDeveloperSubUser]