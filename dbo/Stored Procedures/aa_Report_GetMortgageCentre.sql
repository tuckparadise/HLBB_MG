CREATE   procedure [dbo].[aa_Report_GetMortgageCentre]
as
begin
	select distinct MortgateCenterCode 
	from SQLLOADS
	where isnull(MortgateCenterCode,'') <> ''
end