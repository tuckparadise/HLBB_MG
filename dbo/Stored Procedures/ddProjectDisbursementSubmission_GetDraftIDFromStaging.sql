create   procedure [dbo].[ddProjectDisbursementSubmission_GetDraftIDFromStaging]
@billingid bigint = null ,
@draftID bigint = null output 
as
begin
	set @draftID = (select draftID from ddProjectDisbursementSubmission_staging where BillingRunningID = @billingid)

end