CREATE   procedure [dbo].[usp_ValuerLogin_DormantID_RptGen]
@error nvarchar(max) = null output 
as
begin
	declare @dormantIDday int 	;
	declare @lastactivedate datetime ;
	
	select @dormantIDday = ValuerDormantIDReportPeriodInDays
	from Settings;

	set @lastactivedate = DATEADD(DAY, - @dormantIDday, getdate());

	with cte1(ValuerCode, ValuerEmail, UpdatedDate ) as (
	select ValuerCode, ValuerEmail, UpdatedDate 
	from sqlloads 
	where ValuerEmail is not null or ValuerEmail <> ''
	),
	cte2 (ValuerCode, UpdatedDate) as 
	(
		select ValuerCode, max(UpdatedDate) as UpdatedDate
		from cte1 
		group by ValuerCode		
	),
	cte3 (ValuerCode,ValuerEmail) as (
		select cte1.ValuerCode,max(cte1.ValuerEmail)
		from cte1 
		inner join cte2 on cte2.ValuerCode = cte1.ValuerCode
			and cte2.UpdatedDate = cte1.UpdatedDate		
		group by cte1.ValuerCode
	)	
	select v.valuercode  as valuercode , 
		ValuerLastLoginDatetime as ValuerLastLoginDatetime, 
		IDLastLockedDatetime as IDLastLockedDatetime,
		 [Status]
      ,[ValuerName]            
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]     
	  ,cte3.ValuerEmail as ValuerEmail
	from SQLValuer v
	left join cte3 on cte3.ValuerCode = v.ValuerCode
	--where ValuerLastLoginDatetime < @lastactivedate
	where CONVERT(DATETIME, CONVERT(DATE, DATEADD(DAY, @dormantIDday, ValuerLastLoginDatetime))) < getdate() 
		and v.Status = 'Inactive'
end