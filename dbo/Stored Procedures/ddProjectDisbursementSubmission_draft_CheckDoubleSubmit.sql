create   procedure [dbo].[ddProjectDisbursementSubmission_draft_CheckDoubleSubmit]
@draftID bigint = null, 
@DoubleSubmitFlag int = null output 
as
begin
	set @DoubleSubmitFlag = 0 

	if not exists 
	(
		select 1
		from ddProjectDisbursementSubmission_draft_Master
		where DraftID = @draftID
	)
	begin
		set @DoubleSubmitFlag = 1
	end 
	
end