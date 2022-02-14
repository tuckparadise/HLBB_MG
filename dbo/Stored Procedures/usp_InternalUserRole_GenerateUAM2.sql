CREATE   procedure [dbo].[usp_InternalUserRole_GenerateUAM2]
as
begin	
	select r.UserName,
		UserEmail,
		UserFullName,
		Branch,
		LastLoginDatetime,
		Status,
		CreatedDate,
		UpdatedDate,
		IDLastLockedDatetime,
		tbl1.RoleList,		
		case [IsDUMakerDocumentation] when 0 then null else [IsDUMakerDocumentation] end as HaveDUMakerDocumentationAccess,
		case [IsDUMakerValuation] when 0 then null else [IsDUMakerValuation] end as HaveDUMakerValuationAccess,
		case [IsDisbMaker] when 0 then null else [IsDisbMaker] end as HaveDisbMakerAccess,
		case [IsDisbChecker] when 0 then null else [IsDisbChecker] end as HaveDisbCheckerAccess,
		case [IsRCOMaker] when 0 then null else [IsRCOMaker] end as HaveRCOMakerAccess,
		case [IsRCOChecker] when 0 then null else [IsRCOChecker] end as HaveRCOCheckerAccess,
		case [IsTBOMaker] when 0 then null else [IsTBOMaker] end as HaveTBOMakerAccess,
		case [IsTBOChecker] when 0 then null else [IsTBOChecker] end as HaveTBOCheckerAccess,
		case [IsMortgageAdmin] when 0 then null else [IsMortgageAdmin] end as HaveMortgageAdminAccess,
		case [IsITAdminApplication] when 0 then null else [IsITAdminApplication] end as HaveITAdminApplicationAccess,
		case [IsITAdminSecurity] when 0 then null else [IsITAdminSecurity] end as HaveITAdminSecurityAccess     	
	from InternalUser r
	inner join 
		(select
			username,
			stuff((
				select ',' + r.UserRoleName
				from UserRoleMetric t
					inner join InternalUserRole r on r.UserRoleID = t.UserRoleID
				where t.username = t1.username
				order by r.UserRoleName
				for xml path('')
			),1,1,'') as RoleList
		from UserRoleMetric t1
		group by username) tbl1 on tbl1.username = r.username
	inner join (
		select m.UserName	,
			convert(bit,max(convert(int,r.IsDUMakerDocumentation))) as IsDUMakerDocumentation,
			convert(bit,max(convert(int,r.IsDUMakerValuation))) as IsDUMakerValuation,
			convert(bit,max(convert(int,r.IsDisbMaker))) as IsDisbMaker,
			convert(bit,max(convert(int,r.IsDisbChecker))) as IsDisbChecker,
			convert(bit,max(convert(int,r.IsRCOMaker))) as IsRCOMaker,
			convert(bit,max(convert(int,r.IsRCOChecker))) as IsRCOChecker,
			convert(bit,max(convert(int,r.IsTBOMaker))) as IsTBOMaker,
			convert(bit,max(convert(int,r.IsTBOChecker))) as IsTBOChecker,	
			convert(bit,max(convert(int,r.IsMortgageAdmin))) as IsMortgageAdmin,
			convert(bit,max(convert(int,r.IsITAdminApplication))) as IsITAdminApplication,
			convert(bit,max(convert(int,r.IsITAdminSecurity))) as IsITAdminSecurity
		from InternalUser u
		inner join UserRoleMetric m on m.UserName = u.UserName
		inner join InternalUserRole r on m.UserRoleID = r.UserRoleID
		group by  m.UserName ) tbl2 on tbl2.UserName = r.UserName

end