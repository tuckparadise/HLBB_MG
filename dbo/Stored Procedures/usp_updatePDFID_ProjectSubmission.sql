CREATE   procedure [dbo].[usp_updatePDFID_ProjectSubmission]
@draftID bigint = null,
@pdfID bigint = null
as
begin
	
	update ddProjectDisbursementSubmission_draft_Master_Staging
	set PDFID = @pdfID
	where draftID = @draftID 
		
end