CREATE   procedure [dbo].[usp_Admin_Valuer_PasswordReset_GenerateEmail]
@ValuerCode nvarchar(max),
@password nvarchar(max) = null, 	
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin
	declare @ValuerLoginURL nvarchar(max)				
		
	select @senderemail = [SenderEmail]
	from settings		
	
	select @ValuerLoginURL = [url]	
	from [URL_Setting]
	where [type]= 'ValuerLogin'

	IF OBJECT_ID('tempdb..#SQLValuer_GetEmail') IS NOT NULL
    DROP TABLE #SQLValuer_GetEmail

	select top 100 Valuercode, ValuerEmail,updateddate 
	into #SQLValuer_GetEmail
	from sqlloads 
	where Valuercode = @ValuerCode
	order by updateddate desc

	select top 1 @receiveremail = ValuerEmail 
	from #SQLValuer_GetEmail 
	where ValuerEmail is not null 
		or ltrim(rtrim(ValuerEmail)) <> '' 
	order by updateddate desc

	set @emailheader = 'Reset Password for Valuer Code:' + @Valuercode

	set @emailbody = 'Please use the link <a href="'+@ValuerLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'

end