CREATE   FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers2] (
      @arn nvarchar(100)
)
RETURNS TABLE
AS
RETURN
    
		select  SUBSTRING( 
		( 
			 --SELECT ',' + PR_StageOthers AS 'data()'
			 SELECT ',' + isnull(PR_StageOthers,'') AS 'data()'
				 FROM vw_aaDisbursementHistory 		 
				  WHERE vw_aaDisbursementHistory.arn = @arn
				 FOR XML PATH('') 
		), 2 , 9999) as col1