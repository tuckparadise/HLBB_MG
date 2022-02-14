CREATE   FUNCTION [dbo].[tfn_CoalesceConcat_PR_StageOthers3] (
      @arn nvarchar(100)
)
RETURNS @T table(Col1 nvarchar(max))
AS
begin	
    Declare @str nVarchar(MAX);
	select @str= SUBSTRING( 
	( 
			SELECT ',' + PR_StageOthers AS 'data()'
			--SELECT ',' + isnull(PR_StageOthers,'') AS 'data()'
				FROM vw_aaDisbursementHistory 		 
				WHERE vw_aaDisbursementHistory.arn = @arn
				FOR XML PATH('') 
	), 2 , 9999) 
	insert into @T(Col1) values (@str)
	return
end