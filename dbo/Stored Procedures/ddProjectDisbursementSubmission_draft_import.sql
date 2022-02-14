CREATE     procedure [dbo].[ddProjectDisbursementSubmission_draft_import]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@arn nvarchar(max) = null, 
@error nvarchar(max) = null output 
as
begin
	
	insert into ddProjectDisbursementSubmission_draft_PermenentTempTable (developercode, projectcode, phasecode, arn, DeveloperLoginID, createddate,updateddate)
	values (@DeveloperCode,@ProjectCode,@PhaseCode, @arn, @DeveloperLoginID, getdate(),getdate())

end