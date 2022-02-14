create       procedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementChecker_ByARN]
@arn nvarchar(max) = null 
as
begin

	SELECT 		
		[workflow]
      ,[arn]
      ,[TaskOwner]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[CreatedUser]
      ,[UpdatedUser]
  FROM [dbo].[MortgageAppTaskInstance]
  where [workflow] in ('DisbDUCheckerSolicitorApproval')
	and  arn = @arn
	
end