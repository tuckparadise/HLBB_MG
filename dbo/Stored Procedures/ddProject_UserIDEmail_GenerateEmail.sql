create     procedure [dbo].[ddProject_UserIDEmail_GenerateEmail]
@LoginID nvarchar(max) = null , 
@DecryptedPassword nvarchar(max) = null,
@Receiver nvarchar(max) = null,
@IsSubUser nvarchar(max) = null,
@EmailHeader nvarchar(max) = null output,
@EmailContent nvarchar(max) = null output,
@EmailSender nvarchar(max) = null output,
@EmailReceiver nvarchar(max) = null output
as
begin
	

	set @EmailHeader = 
	(
		select dbo.ufn_UserIDEmail_header_generate()		
	)

	set @EmailContent = 
	(
		select dbo.ufn_UserIDEmail_body_generate(@LoginID,@DecryptedPassword,@IsSubUser)		
	)

	set @EmailSender = null

	set @EmailReceiver = 
	(
		select @Receiver
	)
end