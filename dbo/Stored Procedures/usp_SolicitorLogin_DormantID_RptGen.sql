CREATE   procedure [dbo].[usp_SolicitorLogin_DormantID_RptGen]
@error nvarchar(max) = null output 
as
begin
	declare @dormantIDday int 	;
	declare @lastactivedate datetime ;
	select @dormantIDday = SolicitorDormantIDReportPeriodInDays
	from Settings;
	set @lastactivedate = DATEADD(DAY, - @dormantIDday, getdate());
	
	with cte1([SolicitorCode], solicitoremail, UpdatedDate ) as (
	select [SolicitorCode], solicitoremail, UpdatedDate 
	from sqlloads 
	where solicitoremail is not null or solicitoremail <> ''
	),
	cte2 (SolicitorCode, UpdatedDate) as 
	(
		select SolicitorCode, max(UpdatedDate) as UpdatedDate
		from cte1 
		group by [SolicitorCode]		
	),
	cte3 (SolicitorCode,SolicitorEmail) as (
	select cte1.SolicitorCode,max(cte1.SolicitorEmail)
	--select cte1.SolicitorCode,cte1.SolicitorEmail
		from cte1 
		inner join cte2 on cte2.SolicitorCode = cte1.SolicitorCode
			and cte2.UpdatedDate = cte1.UpdatedDate		
		group by cte1.SolicitorCode
	)
	select s.solicitorcode as solicitorcode, 
		SolicitorLastLoginDatetime as SolicitorLastLoginDatetime, 
		IDLastLockedDatetime as IDLastLockedDatetime
		  ,[Status]
      ,[SolicitorName]           
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]     
	  ,cte3.SolicitorEmail as SolicitorEmail
	from SQLSolicitor s
	left join cte3 on cte3.SolicitorCode = s.SolicitorCode
	where CONVERT(DATETIME, CONVERT(DATE, DATEADD(DAY, @dormantIDday, SolicitorLastLoginDatetime))) < getdate() 
		and s.Status = 'Inactive'
	--where SolicitorLastLoginDatetime < @lastactivedate
end