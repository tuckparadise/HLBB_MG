CREATE     procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog_list]
as
begin	
	
	
	select DevCode as DeveloperCode,
		l.ProjectCode,
		l.PhaseCode,
		FORMAT (l.UpdatedDate, 'dd/MM/yyyy HH:mm:ss') as EmailSentDate,		 
		DevEmail as PhaseEmail,		
		FORMAT (DisCheckerApprovedDate, 'dd/MM/yyyy') as DisCheckerApprovedDate,
			phase.PhaseName
	  ,project.ProjectName
	  ,dev.[Name] as [DeveloperName]
	  ,case when l.EmailSent = 1 then 'Yes' else 'No' end as [EmailSent]
	from ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog	l	
	left join ddProjectPhase phase on phase.PhaseCode = l.PhaseCode and phase.ProjectCode = l.ProjectCode and phase.DeveloperCode = l.DevCode
	left join ddProjectDeveloperProjectMapping project on project.ProjectCode = l.ProjectCode and project.DeveloperCode = l.DevCode
	left join ddProjectDeveloper dev on dev.id = l.DevCode  

end