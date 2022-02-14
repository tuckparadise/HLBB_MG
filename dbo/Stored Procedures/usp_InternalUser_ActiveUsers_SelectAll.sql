CREATE     procedure [dbo].[usp_InternalUser_ActiveUsers_SelectAll]
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
	 -- ,case when [IDLastLockedDatetime] is not null then 'True' else '' end as [DormantAccount]
	 -- ,case when [IDLastLockedDatetime] is null then 'True' else '' end as [FailedLoginAccount]
	 ,remarks
	from InternalUser
	where status = 'Active'

end