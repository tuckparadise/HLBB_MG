/*
declare 
@senderemail nvarchar(max)  ,
@receiveremail nvarchar(max)  ,
@emailheader nvarchar(max)  ,
@emailbody nvarchar(max)  

[usp_Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail] '1@sol.com', @senderemail output, @receiveremail output, @emailheader output, @emailbody output 

*/

CREATE procedure [dbo].[usp_Maintenance_SQLSolicitor_PasswordReset_GenerateEmail]
@SolicitorCode nvarchar(100),
@Password nvarchar(max) = null, 
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin

	declare @SolicitorLoginURL nvarchar(max)
		--@defaultpassword  nvarchar(max)		
	
	
	select @SolicitorLoginURL = [url]
	from [URL_Setting]
	where [type]= 'SolicitorLogin'
		
	/*
	select @defaultpassword = SolicitorPassword
	from sqlsolicitor 
	where SolicitorCode = @SolicitorCode	
	*/

	select @senderemail = [SenderEmail]
	from settings	
 
	IF OBJECT_ID('tempdb..#Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail') IS NOT NULL
    DROP TABLE #Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail

	select top 100 Solicitorcode, SolicitorEmail,updateddate 
	into #Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail 
	from sqlloads 
	where Solicitorcode = 
		@SolicitorCode 
	order by updateddate desc

	select top 1 @receiveremail = Solicitoremail from #Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail where Solicitoremail is not null or ltrim(rtrim(Solicitoremail)) <> '' order by updateddate desc

	set @emailheader = 'Reset Password for Solicitor Code:' + @SolicitorCode
	
	set @emailbody = 'Please use the link <a href="'+@SolicitorLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'
	

	--select @defaultpassword as defaultpassword, @senderemail as senderemail, @receiveremail as receiveremail 
end