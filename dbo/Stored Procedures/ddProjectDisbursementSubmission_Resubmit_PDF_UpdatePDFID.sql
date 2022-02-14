CREATE     procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_UpdatePDFID]
@RejectedRunningID  bigint = null,
@pdfid bigint = null  
as
begin		
	update ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	set ProjectSubmissionPDFID = @pdfid
	where RejectedRunningID = @RejectedRunningID	
end