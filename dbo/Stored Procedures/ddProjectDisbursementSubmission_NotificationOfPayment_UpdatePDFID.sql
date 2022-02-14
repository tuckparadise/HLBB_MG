create   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_UpdatePDFID]
@RunningID bigint = null ,
@PDFID bigint = null 
as
begin
	update ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
	set pdfid = @PDFID
	where RunningID = @RunningID
end