CREATE     procedure [dbo].[usp_MortgageAppTaskInstance_select_Disbursement]
@role nvarchar(max) = null 
as
begin

	declare @workflow nvarchar(max)

	if (@role = '1Disbursement Maker') set @workflow = 'DisbDUMakerSolicitorApproval'
	if (@role = '2Disbursement Checker') set @workflow = 'DisbDUCheckerSolicitorApproval'
	if (@role = '3RCO Maker') set @workflow = 'DisbRCOMakerSolicitorApproval'
	if (@role = '4RCO Checker') set @workflow = 'DisbRCOCheckerSolicitorApproval'

	SELECT 
		'Disbursement' as [WorkflowName],
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] = @workflow
  

end