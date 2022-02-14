CREATE       procedure [dbo].[ddProjectDeveloperSubUser_PasswordReset_GenerateEmail]
@ID nvarchar(max) = null,
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

	select @ReceiverEmail = Email
	from ddProjectDeveloperSubUser
	where ID= @ID

	set @emailheader = 'Reset Password for ID:' + @ID

	set @emailbody = 'Please use the link <a href="'+@ProjectLoginURL+'">link</a> to access the system. You are required to change the password immediately upon log in.<br>'
	set @emailbody = @emailbody + 'New password: ' + @Password + '<br>'

end