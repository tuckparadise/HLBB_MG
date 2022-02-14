CREATE   FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers]
(
  @arn varchar(100)
)
RETURNS NVARCHAR(MAX)
AS 
BEGIN
/*
  DECLARE @str NVARCHAR(MAX);
 
  SELECT @str = COALESCE(@str + ', ', '') + PR_StageOthers
  --SELECT @str = COALESCE(isnull(@str,'') + ', ', '') + PR_StageOthers
  --SELECT @str = COALESCE(@str + ', ', '') + isnull(PR_StageOthers,'')
    FROM vw_aaDisbursementHistory
	WHERE arn = @arn
		--and  isnull(PR_StageOthers,'') <> ''
		and PR_StageOthers is not null
	ORDER BY arn;
 */
 /*
 Declare @str Varchar(MAX); 

Select @str = COALESCE(@str + ', ' + isnull(PR_StageOthers,''), isnull(PR_StageOthers,'')) 
        From vw_aaDisbursementHistory
		WHERE arn = @arn
		;
		*/

		 Declare @str nVarchar(MAX);

		with cte (arn, billingothers)
		as
		(
			select arn, PR_StageOthers
			from  vw_aaDisbursementHistory 
		 WHERE vw_aaDisbursementHistory.arn = @arn
		)
		select @str = SUBSTRING( 
( 
     SELECT ',' + cte.billingothers AS 'data()'
         FROM cte 		 
		 FOR XML PATH('') 
), 2 , 9999) 





	
  RETURN (@str);
END