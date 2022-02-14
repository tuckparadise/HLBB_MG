create   procedure [dbo].[ddProjectDisbursementSubmission_GetAttachmentDetailFromStaging]
@draftID bigint = null , 
@error nvarchar(max) = null output 
as
begin
	select DraftID, arn, [CancelLoan_File] from ddProjectDisbursementSubmission_staging
	where [CancelLoan_File] is not null 
		and draftid = @draftID
end