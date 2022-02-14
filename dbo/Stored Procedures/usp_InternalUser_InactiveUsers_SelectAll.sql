CREATE   procedure [dbo].[usp_InternalUser_InactiveUsers_SelectAll]
as
begin
	select [UserName]
      ,[UserEmail]
      ,[UserFullName]
      ,[Branch]
      ,[LastLoginDatetime]
      ,[Status]
      ,[CreatedDate]
      ,[UpdatedDate]
      ,[IDLastLockedDatetime]
	  ,case when [IDLastLockedDatetime] is not null then 'True' else '' end as [DormantAccount]
	  ,case when [IDLastLockedDatetime] is null and [IDLastLockedByAdminDatetime] is null then 'True' else '' end as [FailedLoginAccount]
	  ,case when IDLastLockedByAdminDatetime is not null then 'True' else '' end as [ManualDeactivation]
	  ,remarks 
	from InternalUser
	where status = 'Inactive'

end