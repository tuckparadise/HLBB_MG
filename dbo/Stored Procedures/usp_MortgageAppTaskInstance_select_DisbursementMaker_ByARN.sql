create       procedure [dbo].[usp_MortgageAppTaskInstance_select_DisbursementMaker_ByARN]
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
  where [workflow] in ('DisbDUMakerSolicitorApproval')
	and  arn = @arn
	
end