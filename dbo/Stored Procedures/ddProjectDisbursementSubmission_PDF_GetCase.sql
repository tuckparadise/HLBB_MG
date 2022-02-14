CREATE   procedure [dbo].[ddProjectDisbursementSubmission_PDF_GetCase]
@CaseExists int = null output,
@draftID bigint = null output
as
begin	
	set @CaseExists = 0

	set @draftID = (select top 1 draftID
			from ddProjectDisbursementSubmission_draft_Master_Staging  	
			where PDFID is null 
			order by UpdatedDate asc 
			)

	if (@draftID is not null )
	begin
		update ddProjectDisbursementSubmission_draft_Master_Staging
		set PDFID = 0
		where draftID  = @draftID 

		set @CaseExists = 1
	end 	
end