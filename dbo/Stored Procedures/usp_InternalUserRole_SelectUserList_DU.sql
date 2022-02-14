CREATE procedure [dbo].[usp_InternalUserRole_SelectUserList_DU]
as
begin
	select distinct username 
	from UserRoleMetric 		
	where UserRoleID in 
	(select userroleid 
  FROM [dbo].[InternalUserRole]
  where IsDUMakerDocumentation = 1) 
end