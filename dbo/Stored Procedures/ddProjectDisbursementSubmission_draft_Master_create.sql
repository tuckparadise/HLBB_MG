CREATE       procedure [dbo].[ddProjectDisbursementSubmission_draft_Master_create]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@error nvarchar(max) = null output ,
@DraftID nvarchar(max) = null output 
as
begin
	set @ProjectCode = (select projectcode from ddProjectPhase where DeveloperCode = @DeveloperCode and PhaseCode = @PhaseCode)

	insert into ddProjectDisbursementSubmission_draft_Master (DeveloperCode, ProjectCode, PhaseCode, DeveloperLoginID, CreatedDate, UpdatedDate) 
	values (@DeveloperCode, @ProjectCode, @PhaseCode, @DeveloperLoginID, getdate(), getdate())
	
	set @DraftID = (SELECT SCOPE_IDENTITY() AS NewID )

	insert into ddProjectDisbursementSubmission_draft (draftID, PrimaryCustomerName, ARN, FinancingAmount, AddressLine1, developercode, projectcode, phasecode,  DeveloperLoginID, CreatedDate, UpdatedDate)
	SELECT @DraftID
      ,sqlloads.ApplicantName
      ,t.[ARN]
      ,sqlloads.LoanAmount
      ,sqlloads.AddressLine1    
      ,@DeveloperCode
      ,@ProjectCode
      ,@PhaseCode
      ,@DeveloperLoginID
      ,getdate()
      ,getdate()     
  FROM [dbo].[ddProjectDisbursementSubmission_draft_PermenentTempTable] t 
	inner join sqlloads on sqlloads.arn = t.arn 
	where t.DeveloperCode = @DeveloperCode
		--AND t.ProjectCode = @ProjectCode
		AND t.PhaseCode = @PhaseCode
		AND t.developerLoginID = @DeveloperLoginID
end