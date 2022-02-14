CREATE procedure [dbo].[usp_Admin_Valuer_Update_Password_Get]
@ValuerCode nvarchar(max)
as
begin

	select [valuerpassword] from sqlvaluer 
	where valuercode = @ValuerCode
	
end