CREATE       procedure [dbo].[aa_updatePDFID_billing]
@arn nvarchar(100),
@billingid bigint,
@pdfID bigint,
@WorkflowOperation nvarchar(1000)
as
begin	
	if (@WorkflowOperation = 'DisbDUCheckerBillingApproval')
	begin
		update aaIntDisbursementSubmission
		set DisbursementCheckerPDFID = @pdfID
		where arn = @arn 			
			and BillingRunningID = @billingid
	end 
	if (@WorkflowOperation = 'DisbDUMakerBillingApproval')
	begin
		update aaIntDisbursementSubmission
		set DisbursementMakerSubmissionPDFID = @pdfID
		where arn = @arn 		
			and BillingRunningID = @billingid
	end 

	if (@WorkflowOperation = 'DisbRCOMakerBillingApproval')
	begin
		update aaIntDisbursementSubmission
		set RCOMakerPDFID = @pdfID
		where arn = @arn 	
			and BillingRunningID = @billingid
	end 
	if (@WorkflowOperation = 'DisbRCOCheckerBillingApproval')
	begin
		update aaIntDisbursementSubmission
		set RCOCheckerPDFID = @pdfID
		where arn = @arn 	
			and BillingRunningID = @billingid
	end 
end