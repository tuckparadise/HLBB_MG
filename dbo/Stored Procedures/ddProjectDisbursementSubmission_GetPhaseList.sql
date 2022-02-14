CREATE     procedure [dbo].[ddProjectDisbursementSubmission_GetPhaseList]
@DeveloperCode nvarchar(max) = null,
@ProjectCode nvarchar(max) = null
as
begin
	SELECT PhaseCode , PhaseName, PhaseCode + '- ' + PhaseName as Phase	  
  FROM ddProjectPhase
  where DeveloperCode = @DeveloperCode
	--and ProjectCode = @ProjectCode
end