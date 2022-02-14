CREATE     procedure [dbo].[ddAdmin_Project_PasswordReset_GenerateEmail]
@ProjectCode nvarchar(max),
@password nvarchar(max) = null, 	
@senderemail nvarchar(max)  = null output,
@receiveremail nvarchar(max)  = null output,
@emailheader nvarchar(max)  = null output,
@emailbody nvarchar(max)  = null output
as
begin
	declare @ProjectLoginURL nvarchar(max)				
		
	select @senderemail = [SenderEmail]
	from settings		
	
	select @ProjectLoginURL = [url]		
	from [URL_Setting]
	--where [type]= 'ProjectLogin'
	where [type]= 'DeveloperLogin'

	--declare @ReceiverEmail nvarchar(max)
	if exists 
	(
		select 1
		from ddProjectDeveloperSubUser
		where ID= @ProjectCode
	)
	begin
		select @ReceiverEmail = Email
		from ddProjectDeveloperSubUser
		where ID= @ProjectCode
	end 
	else
	begin
		select @ReceiverEmail = Email
		from ddProjectDeveloper
		where ID= @ProjectCode
	end 
	

	set @emailheader = 'Reset Password for ID:' + @ProjectCode

	set @emailbody = 'Please use the <a href="'+@ProjectLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br><br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br><br>'

end