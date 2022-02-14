CREATE     procedure [dbo].[ddProject_Email_AuditTrail_Select]
  @DeveloperCode nvarchar(max) = null ,
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null 
  as
  begin
	select * from 
	(
		select FORMAT (inserteddatetime, 'dd/MM/yyyy HH:mm:ss') as [Date],
			ConcatenatedFieldsName as [Field],
			ConcatenatedOriginalValue as [OldValue],
			ConcatenatedNewValue as [NewValue],
			--Operator as [ChangedUser],
			InternalUser.UserFullName as [ChangedUser],
			ddProjectPhase.developercode,
			ddProjectPhase.projectcode,
			ddProjectPhase.phasecode ,
			inserteddatetime,
			ddProjectPhase.PhaseName			
		from ddProjectEmailAuditTrail
		left join ddProjectPhase on ddProjectPhase.PhaseCode = ddProjectEmailAuditTrail.PhaseCode
								and ddProjectPhase.ProjectCode = ddProjectEmailAuditTrail.ProjectCode
								and ddProjectPhase.DeveloperCode = ddProjectEmailAuditTrail.DeveloperCode
		left join InternalUser on InternalUser.UserName = ddProjectEmailAuditTrail.Operator
		where ddProjectPhase.PhaseCode = @PhaseCode 	
			and isnull(ConcatenatedOriginalValue,'') <> isnull(ConcatenatedNewValue,'')
	) tbl 
	order by inserteddatetime desc 
  end