--[usp_DUMaker_Letter_B3_generate] 'KLV/MG/2018/L3004'

--[usp_DUMaker_Letter_B3_generate] 'arn1'

CREATE procedure [dbo].[usp_DUMaker_Letter_B3_generate]
@param_arn nvarchar(100)
as
begin	

	declare @line1 nvarchar(max),
	@line2 nvarchar(max),
	@line3 nvarchar(max),
	@line4 nvarchar(max),
	@line5 nvarchar(max),
	@line6 nvarchar(max),
	@line7 nvarchar(max),
	@line8 nvarchar(max),
	@line9 nvarchar(max),
	@line10 nvarchar(max),
	@line11 nvarchar(max),
	@line12 nvarchar (max),
	@text nvarchar(max),
	@arn nvarchar(100),
	@letterofinstructiondate date,
	@dateofacceptance date,
	@url nvarchar(max)
	
	select @url = [url]
	from url_setting 
	where [type] = 'ValuerLogin'

	/*	
	select @arn = sqlloads.arn ,
		@letterofinstructiondate = DateOfLOAcceptance,
		@dateofacceptance = submission.UpdatedDate		
	from sqlloads 
		inner join SQLDUMakerDP_ValuerSubmission_LoweredOMV submission on submission.arn = sqlloads.arn
	where sqlloads.arn = @param_arn
	*/

	set @line1 = 'To proceed with forward Valuation Report for ' + @param_arn 
	
	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)

	set @line3 = 'Reference is made to the Letter of Instruction issued by the bank for the case above and update from you on the comments / lower OMV. <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Please proceed with the preparation of the Valuation Report. <br><br>' + CHAR(13)+CHAR(10)
	set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for status update or uploading of the VR. <br>' + CHAR(13)+CHAR(10)

	set @line6 = '' + CHAR(13)+CHAR(10)
	
	set @line7 = 'Regards <br>' 
	set @line8 = '<i> For and on behalf of </i> <br>'
	set @line9 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' 
	set @line10 = 'Mortgage Centre <br>' + CHAR(13)+CHAR(10)

	set @line11 = '' + CHAR(13)+CHAR(10)

	set @line12 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail. </i><br>'  

	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 + @line11 +@line12
	
	
	declare @sender nvarchar(max)

	select @sender = [SenderEmail]
	FROM [Settings]

	select @line1 as email_header , @text as email_content, @sender as sender_email

end