CREATE   procedure [dbo].[ddProjectDisbursementSubmission_draft_Master_Clear]
@DeveloperLoginID nvarchar(max) = null ,
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null 
as
begin

	delete from ddProjectDisbursementSubmission_draft_Master
	where DeveloperLoginID = @DeveloperLoginID
		--and developercode = @developercode 
		--and ProjectCode = @ProjectCode 
		--and PhaseCode = @PhaseCode 
		
	delete from ddProjectDisbursementSubmission_draft
	where DeveloperLoginID = @DeveloperLoginID
		--and developercode = @developercode 
		--and ProjectCode = @ProjectCode 
		--and PhaseCode = @PhaseCode 

	delete from ddProjectDisbursementSubmission_draft_PermenentTempTable
	where DeveloperLoginID = @DeveloperLoginID
		--and developercode = @developercode 
		--and ProjectCode = @ProjectCode 
		--and PhaseCode = @PhaseCode 

	
end