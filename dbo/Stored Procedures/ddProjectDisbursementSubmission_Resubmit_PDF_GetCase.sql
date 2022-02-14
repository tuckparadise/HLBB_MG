CREATE     procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetCase]
@CaseExists int = null output,
@RejectedRunningID bigint = null output
as
begin	
	set @CaseExists = 0

	set @RejectedRunningID = (select top 1 RejectedRunningID
			from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging  	
			where ProjectSubmissionPDFID is null 
			order by UpdatedDate asc 
			)

	if (@RejectedRunningID is not null )
	begin
		update ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
		set ProjectSubmissionPDFID = 0
		where RejectedRunningID  = @RejectedRunningID

		set @CaseExists = 1
	end 	
end