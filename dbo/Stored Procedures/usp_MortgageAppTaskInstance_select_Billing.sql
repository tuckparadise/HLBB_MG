CREATE       procedure [dbo].[usp_MortgageAppTaskInstance_select_Billing]
@role nvarchar(max) = null ,
@SubmissionFrom nvarchar(max) = null 
as
begin

	declare @workflow nvarchar(max)

	if (@role = '1Disbursement Maker') set @workflow = 'DisbDUMakerBillingApproval'
	if (@role = '2Disbursement Checker') set @workflow = 'DisbDUCheckerBillingApproval'
	if (@role = '3RCO Maker') set @workflow = 'DisbRCOMakerBillingApproval'
	if (@role = '4RCO Checker') set @workflow = 'DisbRCOCheckerBillingApproval'
		   	   		 	    		
	SELECT 	distinct [arn] as arn 
	FROM [dbo].ddProject_vw_MortgageAppTaskInstance
	where [workflow] = @workflow	
	and SubmissionFrom = @SubmissionFrom

end