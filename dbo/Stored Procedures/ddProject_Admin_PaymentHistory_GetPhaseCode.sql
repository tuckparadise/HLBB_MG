create   procedure [dbo].[ddProject_Admin_PaymentHistory_GetPhaseCode]
@DeveloperCode nvarchar(max) = null,
@ProjectCode nvarchar(max) = null
as
begin	
	select distinct PhaseCode, PhaseName, PhaseCode + '-' + PhaseName as [Phase]
			from ddProjectPhase	
			where DeveloperCode = @DeveloperCode
				and ProjectCode = @ProjectCode			
end