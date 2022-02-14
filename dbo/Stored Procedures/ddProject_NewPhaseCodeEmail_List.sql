create     procedure [dbo].[ddProject_NewPhaseCodeEmail_List]
as
begin	
	SELECT top 1 [SurrogateID]
      ,[DeveloperCode]
      ,[ProjectCode]
      ,[PhaseCode]
      ,[NewLIDate]
      ,[ARN]
      ,[EmailHeader]
      ,[EmailContent]
      ,[EmailSender]
      ,[EmailReceiver]
      ,[EmailSentFlag]
      ,[EmailSentDate]
      ,[CreatedUser]
      ,[CreatedDate]
      ,[DeletedUser]
      ,[DeletedDate]
  FROM [dbo].[ddProjectNewPhaseCodeEmailToAdminLog]	
	where isnull([EmailSentFlag],0) = 0 
	order by [CreatedDate]
end