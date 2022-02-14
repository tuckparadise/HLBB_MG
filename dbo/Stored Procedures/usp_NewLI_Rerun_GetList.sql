create   procedure [dbo].[usp_NewLI_Rerun_GetList]
as
begin
	declare @cdc datetime 
	set @cdc = (select newLICDC from tblCDC)

	select distinct tblversion.Field3 as arn 
	FROM [EDMSDBSERVER].[HLBB_DMS].[dbo].TblVersion4 tblversion 
	left join SQLLOADS on SQLLOADS.arn collate SQL_Latin1_General_CP1_CI_AS  = tblversion.Field3 collate SQL_Latin1_General_CP1_CI_AS
	where year(DateCreated) > 2020
		and field6=  'CRA01 Lttr of Instruction'
		and SQLLOADS.arn is null 
		and DateCreated <= @cdc
end