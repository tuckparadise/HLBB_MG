create   procedure [dbo].[ddProject_LOADSUpdatePhaseCode_Select]
as
begin
	select arn from SQLLOADS
	where arn in ('arn1','arn2')
end