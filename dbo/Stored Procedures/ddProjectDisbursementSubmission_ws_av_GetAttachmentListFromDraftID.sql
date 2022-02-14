CREATE     procedure [dbo].[ddProjectDisbursementSubmission_ws_av_GetAttachmentListFromDraftID]
@DraftID bigint = null ,
@arn nvarchar(max) = null,
@error nvarchar(max) = null output
as
begin	
	
	select DraftID,  ARN, 1 as AttachmentID, Attachment1 as Attachment, dbo.ufn_getPDFImageName(isnull(Attachment1,'')) as AttachmentFileName, dbo.ufn_getPDFImageNameFileType(isnull(Attachment1,'')) as AttachmentFileType, dbo.ufn_getPDFImage(isnull(Attachment1,'')) as AttachmentFileContent
	from ddProjectDisbursementSubmission_draft_Staging
	where Attachment1 is not null 
		and draftId = @DraftID		
		and arn = @arn 

	union 
	select DraftID,  ARN, 2 as AttachmentID, Attachment2 as Attachment, dbo.ufn_getPDFImageName(isnull(Attachment2,'')) as AttachmentFileName, dbo.ufn_getPDFImageNameFileType(isnull(Attachment2,'')) as AttachmentFileType, dbo.ufn_getPDFImage(isnull(Attachment2,'')) as AttachmentFileContent	
	from ddProjectDisbursementSubmission_draft_Staging
	where Attachment2 is not null 
		and draftId = @DraftID
		and arn = @arn 
end