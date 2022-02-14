CREATE     procedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetDraft]
@DraftCount bigint = null output,
@DraftID bigint = null output,
@ARN nvarchar(max) = null output,
@error nvarchar(max) = null output
as
begin	
	set @DraftCount = 0
	/*
	select top 1 @DraftID = s.draftid, @ARN = s.arn 
	from ddProjectDisbursementSubmission_draft_Staging s
	inner join ddProjectDisbursementSubmission_draft_Master_Staging m on m.draftid = s.DraftID
	where m.PDFID is not null and m.PDFID <> 0 
	order by s.UpdatedDate asc 
	*/

	
	set @DraftID = (select top 1 draftID
			from ddProjectDisbursementSubmission_draft_Master_Staging  	
			where PDFID is not null and PDFID <> 0 
			order by UpdatedDate asc 
			)
	
	if (@draftID is not null )
	begin		
		set @DraftCount = 1
	end 	
end