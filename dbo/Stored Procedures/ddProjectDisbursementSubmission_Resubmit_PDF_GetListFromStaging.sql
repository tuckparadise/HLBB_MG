CREATE   procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetListFromStaging]
@RejectedRunningID  bigint = null 
as
begin
	select PrimaryCustomerName, ARN, FinancingAmount, AddressLine1, PR_TotalBillingAmount as BillingAmount, dbo.ufn_getPDFImageName(isnull(Attachment1,'')) as Attachment1, dbo.ufn_getPDFImageName(isnull(Attachment2,'')) as Attachment2,
		DisbursementMakerRejectionReason, DisbursementMakerEmailAddress,  FORMAT (DisbursementMakerSubmissionDate, 'dd/MM/yyyy') as DisbursementMakerSubmissionDate, ExtraField1
	from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging
	where RejectedRunningID = @RejectedRunningID 
end