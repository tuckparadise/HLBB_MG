create   procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetDevCodeFromRejectedTable]
@RejectedBillingID bigint = null ,
@DeveloperCode nvarchar(max) = null output,
@ProjectCode nvarchar(max) = null output,
@PhaseCode nvarchar(max) = null output,
@Phase nvarchar(max) = null output,
@Project nvarchar(max) = null output
as
begin
	set @DeveloperCode = (select DeveloperCode from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where RejectedRunningID = @RejectedBillingID
	)

	set @ProjectCode = (select ProjectCode from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where RejectedRunningID = @RejectedBillingID
	)

	set @PhaseCode = (select PhaseCode from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where RejectedRunningID = @RejectedBillingID
	)

	set @Phase = (select ph.PhaseCode + phasename from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging s inner join ddprojectphase ph on ph.phasecode = s.PhaseCode
	where RejectedRunningID = @RejectedBillingID
	)

	set @Project = (select ph.ProjectCode + projectname from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging s inner join ddProjectDeveloperProjectMapping ph on ph.projectcode = s.ProjectCode
	where RejectedRunningID = @RejectedBillingID
	)
end