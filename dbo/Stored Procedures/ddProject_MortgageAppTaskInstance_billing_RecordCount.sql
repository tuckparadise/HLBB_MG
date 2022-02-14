create   procedure [dbo].[ddProject_MortgageAppTaskInstance_billing_RecordCount]
@SubmissionFrom nvarchar(max) = null ,
@Role nvarchar(max) = null ,
@RecordCount bigint = null output 
as
begin

	declare @workflow nvarchar(max)

	if (@role = '1Disbursement Maker') set @workflow = 'DisbDUMakerBillingApproval'
	if (@role = '2Disbursement Checker') set @workflow = 'DisbDUCheckerBillingApproval'
	if (@role = '3RCO Maker') set @workflow = 'DisbRCOMakerBillingApproval'
	if (@role = '4RCO Checker') set @workflow = 'DisbRCOCheckerBillingApproval'


	if (@SubmissionFrom  = 'EDMS')
	begin
		set @RecordCount = ( select count(*) 
							from MortgageAppTaskInstance_billing
							where workflow = @workflow
							)
	end 
	if (@SubmissionFrom  = 'Developer')
	begin
		set @RecordCount = ( select count(*) 
							from ddProject_MortgageAppTaskInstance
							where workflow = @workflow
							)
	end 
end