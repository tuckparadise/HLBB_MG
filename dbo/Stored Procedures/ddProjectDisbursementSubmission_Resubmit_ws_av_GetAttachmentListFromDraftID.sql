CREATE       procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetAttachmentListFromDraftID]
@RunningID bigint = null ,
@error nvarchar(max) = null output
as
begin	
	
	select RejectedRunningID,  ARN, 1 as AttachmentID, Attachment1 as Attachment, dbo.ufn_getPDFImageName(isnull(Attachment1,'')) as AttachmentFileName, dbo.ufn_getPDFImageNameFileType(isnull(Attachment1,'')) as AttachmentFileType, dbo.ufn_getPDFImage(isnull(Attachment1,'')) as AttachmentFileContent
	from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where Attachment1 is not null 
		and RejectedRunningID = @RunningID		
	
	union 
	select RejectedRunningID,  ARN, 2 as AttachmentID, Attachment2 as Attachment, dbo.ufn_getPDFImageName(isnull(Attachment2,'')) as AttachmentFileName, dbo.ufn_getPDFImageNameFileType(isnull(Attachment2,'')) as AttachmentFileType, dbo.ufn_getPDFImage(isnull(Attachment2,'')) as AttachmentFileContent	
	from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where Attachment2 is not null 
		and RejectedRunningID = @RunningID
end