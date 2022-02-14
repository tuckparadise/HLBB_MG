CREATE   procedure [dbo].[usp_LOADS_select_UAT]
@ARN nvarchar(max) = null 
as
begin
	select *
	from SQLLOADS
	where arn = @arn 
end