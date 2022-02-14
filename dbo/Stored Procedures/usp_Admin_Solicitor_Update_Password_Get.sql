CREATE procedure [dbo].[usp_Admin_Solicitor_Update_Password_Get]
@SolicitorCode nvarchar(max)
as
begin

	select [Solicitorpassword] from sqlSolicitor
	where Solicitorcode = @SolicitorCode
	
end