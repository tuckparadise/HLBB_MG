CREATE   procedure [dbo].[usp_InternalUser_GetRemarks]
@UserName nvarchar(max) = null
as
begin
	select Remarks
	from InternalUser
	where UserName = @UserName
end