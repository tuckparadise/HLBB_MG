CREATE   procedure [dbo].[ddProjectEmailToDeveloperLog_Report_List]
as
begin
	SELECT l.[SurrogateID]
      ,l.[DeveloperCode]
      ,l.[ProjectCode]
      ,l.[PhaseCode]
      --,[DocumentationApprovedDate]
	  ,FORMAT ([DocumentationApprovedDate], 'dd/MM/yyyy HH:mm:ss') as [DocumentationApprovedDate]
      ,[EmailARN]
      ,[EmailHeader]
      ,[EmailContent]
      ,[EmailSender]
      ,[EmailReceiver]
      ,case when isnull([EmailSentFlag],0) = 0 then 'No' else 'Yes' end as [EmailSent]	  
      --,[EmailSentDate]
	  ,FORMAT (l.[EmailSentDate], 'dd/MM/yyyy HH:mm:ss') as [EmailSentDate]
      ,l.[CreatedUser]
      ,l.[CreatedDate]
      ,[DeletedUser]
      ,[DeletedDate]
	  ,phase.PhaseName
	  ,project.ProjectName
	  ,dev.[Name] as [DeveloperName]
  FROM [dbo].[ddProjectEmailToDeveloperLog] l
  left join ddProjectPhase phase on phase.PhaseCode = l.PhaseCode and phase.ProjectCode = l.ProjectCode and phase.DeveloperCode = l.DeveloperCode
  left join ddProjectDeveloperProjectMapping project on project.ProjectCode = l.ProjectCode and project.DeveloperCode = l.DeveloperCode
  left join ddProjectDeveloper dev on dev.id = l.DeveloperCode  
  where isnull(l.developercode,'') <> ''
			and isnull(l.PhaseCode,'') <> ''
			and isnull(l.ProjectCode,'') <> ''
			and isnull(l.runcount,0) = 1
  --where isnull([EmailSentFlag],0) = 1

end