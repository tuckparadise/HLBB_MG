CREATE procedure [dbo].[usp_InternalUserRole_SelectUserList_VU2]
as
begin
	select distinct username 
	from UserRoleMetric 		
	where UserRoleID in 
	(select userroleid 
  FROM dbo.[InternalUserRole]
  where IsDUMakerValuation = 1) 
end