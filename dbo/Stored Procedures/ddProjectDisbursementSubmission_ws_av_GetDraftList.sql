create   procedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraftList]
as
begin
	select draftID
	from ddProjectDisbursementSubmission_draft_Master_Staging  	
	where PDFID is not null and PDFID <> 0 
	order by UpdatedDate asc 			
end