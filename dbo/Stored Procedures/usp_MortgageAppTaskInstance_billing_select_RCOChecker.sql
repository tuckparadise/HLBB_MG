create     procedure [dbo].[usp_MortgageAppTaskInstance_billing_select_RCOChecker]
as
begin

	SELECT 
		case when workflow = 'DisbDUMakerBillingApproval' then 'Progressive Billing- Disbursement Maker' 
			when  workflow = 'DisbDUCheckerBillingApproval' then 'Progressive Billing- Disbursement Checker' 
			when  workflow = 'DisbRCOMakerBillingApproval' then 'Progressive Billing- RCO Maker' 
			when  workflow = 'DisbRCOCheckerBillingApproval' then 'Progressive Billing- RCO Checker' 
			end as [WorkflowName],
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
	  ,BillingRunningID
  FROM [dbo].[MortgageAppTaskInstance_billing]
  where [workflow] in ('DisbRCOCheckerBillingApproval')

end