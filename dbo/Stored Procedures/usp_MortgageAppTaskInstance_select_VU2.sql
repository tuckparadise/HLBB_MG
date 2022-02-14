CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_select_VU2]
as
begin

	SELECT 
		case when workflow = 'DPDUMakerSolicitorApproval' then 'Document Unit' 
			when  workflow = 'DPDUMakerValuerApproval' then 'Valuation Unit' end as [WorkflowName],
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] in ('DPDUMakerValuerApproval')

end