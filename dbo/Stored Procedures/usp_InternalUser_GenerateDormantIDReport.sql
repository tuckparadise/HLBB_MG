CREATE   procedure [dbo].[usp_InternalUser_GenerateDormantIDReport]
as
begin
	declare @dormantIDday int 
	--declare @currentdate datetime 
	--declare @lastactivedate datetime 
	--set @currentdate = getdate()

	select @dormantIDday = InternalUserDormantIDReportPeriodInDays	
	from Settings

	--set @lastactivedate = DATEADD(DAY, - @dormantIDday, getdate())

	select r.UserName,
		UserEmail,
		UserFullName,
		Branch,
		--isnull(LastLoginDatetime,'1900-01-01 00:00:00') as LastLoginDatetime,
		LastLoginDatetime,
		[Status],
		--isnull(CreatedDate,'1900-01-01 00:00:00') as CreatedDate,
		CreatedDate,
		--isnull(UpdatedDate,'1900-01-01 00:00:00') as UpdatedDate,
		UpdatedDate,		
		--isnull(IDLastLockedDatetime,'1900-01-01 00:00:00') as IDLastLockedDatetime,
		IDLastLockedDatetime,
		tbl1.RoleList,		
		[IsDUMakerDocumentation] as HaveDUMakerDocumentationAccess
      ,[IsDUMakerValuation]  as HaveDUMakerValuationAccess           
      ,[IsDisbMaker]  as HaveDisbMakerAccess
      ,[IsDisbChecker] as HaveDisbCheckerAccess
      ,[IsRCOMaker]  as HaveRCOMakerAccess
      ,[IsRCOChecker]  as HaveRCOCheckerAccess
      ,[IsTBOMaker]  as HaveTBOMakerAccess
      ,[IsTBOChecker]  as HaveTBOCheckerAccess
	  ,[IsMortgageAdmin]  as HaveMortgageAdminAccess
	   ,[IsITAdminApplication]  as HaveITAdminApplicationAccess
      ,[IsITAdminSecurity]  as HaveITAdminSecurityAccess
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
		where [status] = 'Inactive'
			--and LastLoginDatetime < @lastactivedate
			and CONVERT(DATETIME, CONVERT(DATE, DATEADD(DAY, @dormantIDday, LastLoginDatetime))) < getdate() 
		group by  m.UserName ) tbl2 on tbl2.UserName = r.UserName

end