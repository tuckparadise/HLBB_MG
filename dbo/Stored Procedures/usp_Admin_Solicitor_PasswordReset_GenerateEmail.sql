CREATE   procedure [dbo].[usp_Admin_Solicitor_PasswordReset_GenerateEmail]
@SolicitorCode nvarchar(max),
@password nvarchar(max) = null, 	
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin
	declare @SolicitorLoginURL nvarchar(max)				
		
	select @senderemail = [SenderEmail]
	from settings		
	
	select @SolicitorLoginURL = [url]	
	from [URL_Setting]
	where [type]= 'SolicitorLogin'

	IF OBJECT_ID('tempdb..#SQLSolicitor_GetEmail') IS NOT NULL
    DROP TABLE #SQLSolicitor_GetEmail

	select top 100 Solicitorcode, SolicitorEmail,updateddate 
	into #SQLSolicitor_GetEmail
	from sqlloads 
	where Solicitorcode = @SolicitorCode
	order by updateddate desc

	select top 1 @receiveremail = SolicitorEmail 
	from #SQLSolicitor_GetEmail 
	where SolicitorEmail is not null 
		or ltrim(rtrim(SolicitorEmail)) <> '' 
	order by updateddate desc

	set @emailheader = 'Reset Password for Solicitor Code:' + @Solicitorcode

	set @emailbody = 'Please use the link <a href="'+@SolicitorLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'

end