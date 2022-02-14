CREATE   procedure [dbo].[usp_InternalUserRole_GenerateUAM]
as
begin	
	select r.UserRoleName,
		case IsDUMakerDocumentation when 0 then null else IsDUMakerDocumentation end as DUMakerDocumentationAccess,
		case IsDUMakerValuation when 0 then null else IsDUMakerValuation end as DUMakerValuationAccess,
		case IsDisbMaker when 0 then null else IsDisbMaker end as DisbMakerAccess,
		case IsDisbChecker when 0 then null else IsDisbChecker end as DisbCheckerAccess,
		case IsRCOMaker when 0 then null else IsRCOMaker end as RCOMakerAccess,
		case IsRCOChecker when 0 then null else IsRCOChecker end as RCOCheckerAccess,
		case IsTBOMaker when 0 then null else IsTBOMaker end as TBOMakerAccess,
		case IsTBOChecker when 0 then null else IsTBOChecker end as TBOCheckerAccess,
		case IsMortgageAdmin when 0 then null else IsMortgageAdmin end as MortgageAdminAccess,
		case IsITAdminApplication when 0 then null else IsITAdminApplication end as ITAdminApplicationAccess,
		case IsITAdminSecurity when 0 then null else IsITAdminSecurity end as ITAdminSecurityAccess,		 		
		tbl1.UserList
	from InternalUserRole r
	inner join (select
					UserRoleID,
					stuff((
						select ',' + t.username
						from UserRoleMetric t
						where t.UserRoleID = t1.UserRoleID
						order by t.username
						for xml path('')
					),1,1,'') as UserList
				from UserRoleMetric t1
				group by UserRoleID) tbl1 on tbl1.UserRoleID = r.UserRoleID

end