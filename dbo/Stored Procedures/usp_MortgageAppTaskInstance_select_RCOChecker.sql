create     procedure [dbo].[usp_MortgageAppTaskInstance_select_RCOChecker]
as
begin

	SELECT 
		case when workflow = 'DisbDUMakerSolicitorApproval' then 'Disbursement By Solicitor- Disbursement Maker' 
			when  workflow = 'DisbDUCheckerSolicitorApproval' then 'Disbursement By Solicitor- Disbursement Checker' 
			when  workflow = 'DisbRCOMakerSolicitorApproval' then 'Disbursement By Solicitor- RCO Maker' 
			when  workflow = 'DisbRCOCheckerSolicitorApproval' then 'Disbursement By Solicitor- RCO Checker' 
			end as [WorkflowName],
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] in ('DisbRCOCheckerSolicitorApproval')

end