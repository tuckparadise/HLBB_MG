CREATE   procedure [dbo].[usp_InternalUserRole_SelectUserList_Disbursement]
@role nvarchar(max) = null 
as
begin
	declare @rolequery nvarchar(max)

	if (@role = '1Disbursement Maker') set @rolequery = 'IsDisbMaker'
	if (@role = '2Disbursement Checker') set @rolequery = 'IsDisbChecker'
	if (@role = '3RCO Maker') set @rolequery = 'IsRCOMaker'
	if (@role = '4RCO Checker') set @rolequery = 'IsRCOChecker'

	declare @dynamicsql nvarchar(max)

	set @dynamicsql = 
	'select distinct username 
	from UserRoleMetric 		
	where UserRoleID in 
	(select userroleid 
  FROM [dbo].[InternalUserRole]
  where '+ @rolequery +' = 1) '

  exec(@dynamicsql)

end