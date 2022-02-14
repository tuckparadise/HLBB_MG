CREATE   procedure [dbo].[DisbursementSubmission_GetFacilityAccountList]
@arn nvarchar(max) = null
as
begin

select  ROW_NUMBER() OVER(ORDER BY getdate() ASC) AS RowNumber, AccountValue from (
	select 
  AccountValue
from [aaFacilityAccountMaintenance]
unpivot
(
  AccountValue
  for indicatorname in ([Account1], [Account2], [Account3], [Account4])
) unpiv
where 
	arn = @arn) tbl1
	where isnull(AccountValue,'')<>''

end