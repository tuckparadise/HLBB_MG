CREATE procedure [dbo].[usp_ValuerLoginTrialSession_FailedAttemptLog_RptGen]
as
begin
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
	--select cte1.ValuerCode,cte1.ValuerEmail
		from cte1 
		inner join cte2 on cte2.ValuerCode = cte1.ValuerCode
			and cte2.UpdatedDate = cte1.UpdatedDate	
		group by cte1.ValuerCode
	)
	select a.[ValuerCode] as [ValuerCode]
      ,a.[loginDatetime] as [loginDatetime]
      ,a.[CreatedDate] as [CreatedDate]
	  ,[Status]
      ,[ValuerName]      
      ,[ValuerLastLoginDatetime]
      ,[PasswordForceReset]
      ,[PasswordExpiryDate]
      ,[PasswordExpiryWarningDate]
      ,[IDLastLockedDatetime]
	  ,cte3.ValuerEmail as ValuerEmail
	from ValuerLoginTrialSession_FailedAttemptLog a 
	inner join SQLValuer v on v.ValuerCode = a.ValuerCode
	left join cte3 on cte3.ValuerCode = v.ValuerCode
end