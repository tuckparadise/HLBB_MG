CREATE     procedure [dbo].[usp_MortgageAppTaskInstance_select_VU_ByARN]
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
  where [workflow] in ('DPDUMakerValuerApproval')
	and  arn = @arn
end