/*
declare @senderemail nvarchar(max)  ,
@receiveremail nvarchar(max)  ,
@emailheader nvarchar(max)  ,
@emailbody nvarchar(max)  

[usp_Maintenance_SQLSolicitor_PasswordReset_GetDefaultPasswordAndEmail] '1@sol.com', 'abc123', @senderemail output, @receiveremail output, @emailheader output, @emailbody output 

select @senderemail, @receiveremail, @emailheader, @emailbody

*/

CREATE procedure [dbo].[usp_Maintenance_SQLValuer_PasswordReset_GenerateEmail]
@ValuerCode nvarchar(100),
@Password nvarchar(max) = null, 
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin

	declare @ValuerLoginURL nvarchar(max)
		--@defaultpassword  nvarchar(max)				
		
	select @senderemail = [SenderEmail]
	from settings	
	--select @senderemail
	
	select @ValuerLoginURL = [url]	
	from [URL_Setting]
	where [type]= 'ValuerLogin'

	IF OBJECT_ID('tempdb..#Maintenance_SQLValuer_PasswordReset_GetDefaultPasswordAndEmail') IS NOT NULL
    DROP TABLE #Maintenance_SQLValuer_PasswordReset_GetDefaultPasswordAndEmail

	select top 100 Valuercode, ValuerEmail,updateddate 
	into #Maintenance_SQLValuer_PasswordReset_GetDefaultPasswordAndEmail 
	from sqlloads 
	where Valuercode = @ValuerCode
	order by updateddate desc

	select top 1 @receiveremail = Valueremail 
	from #Maintenance_SQLValuer_PasswordReset_GetDefaultPasswordAndEmail 
	where Valueremail is not null 
		or ltrim(rtrim(Valueremail)) <> '' 
	order by updateddate desc

	set @emailheader = 'Reset Password for Valuer Code:' + @Valuercode

	set @emailbody = 'Please use the link <a href="'+@ValuerLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'

end