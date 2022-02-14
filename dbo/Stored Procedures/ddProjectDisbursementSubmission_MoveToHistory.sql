CREATE         procedure [dbo].[ddProjectDisbursementSubmission_MoveToHistory]
@draftID bigint = null, 
@error nvarchar(max) = null output 
as
begin

	update [ddProjectDisbursementSubmission_draft_staging]
	set Attachment1 = null, 
		Attachment2 = null
	where [DraftID] = @DraftID

	insert into ddProjectDisbursementSubmission_draft_Master_History
	select *
	FROM [dbo].ddProjectDisbursementSubmission_draft_Master_Staging 
	where [DraftID] = @DraftID 

	insert into ddProjectDisbursementSubmission_draft_History
	select *
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] 
	where [DraftID] = @DraftID 

	delete 
	FROM [dbo].ddProjectDisbursementSubmission_draft_Master_Staging 
	where [DraftID] = @DraftID 

	delete
	FROM [dbo].[ddProjectDisbursementSubmission_draft_staging] 
	where [DraftID] = @DraftID 	

end