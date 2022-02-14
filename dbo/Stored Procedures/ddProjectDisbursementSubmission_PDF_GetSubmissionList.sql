CREATE   procedure [dbo].[ddProjectDisbursementSubmission_PDF_GetSubmissionList]
@draftID bigint = null 
as
begin
	select PrimaryCustomerName, ARN, FinancingAmount, AddressLine1, BillingAmount, dbo.ufn_getPDFImageName(isnull(Attachment1,'')) as Attachment1, dbo.ufn_getPDFImageName(isnull(Attachment2,'')) as Attachment2
	from ddProjectDisbursementSubmission_draft_Staging
	where draftid = @draftID
end