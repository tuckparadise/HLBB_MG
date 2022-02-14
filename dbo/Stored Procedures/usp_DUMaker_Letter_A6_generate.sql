--[usp_DUMaker_Letter_A1_generate] 'arn1'

CREATE procedure [dbo].[usp_DUMaker_Letter_A6_generate]
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
	@line12 nvarchar(max),
	@text nvarchar(max),
	@arn nvarchar(100),
	@letterofinstructiondate date,
	@dateofacceptance date,
	@url nvarchar(max)
	
	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'
	
	select @arn = sqlloads.arn ,
		@letterofinstructiondate = DateOfLOAcceptance,
		@dateofacceptance = submission.UpdatedDate
	from sqlloads 
		inner join SQLDUMakerDP_SolicitorSubmission_Rejected submission on submission.arn = sqlloads.arn
	where sqlloads.arn = @param_arn

	set @line1 = 'Unexecuted documents by the bank for ' + @arn 

	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)

	set @line3 = 'Reference is made to documents received by the bank on ' +  convert(nvarchar(max),@dateofacceptance,103)+'. <br><br>' + CHAR(13)+CHAR(10)
	--set @line4 = ''
	--set @line4 = 'Enclosed herewith the cover letter in Adobe Acrobat PDF format. The password to open the file is the first 3 letters as per your firm name with the first letter in upper case (no spacing or symbol) and followed by the last 8 alphanumeric of the Application Number (ie bank’s reference number) as shown in the subject of the email     <br><br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'Kindly collect the documents from the respective Mortgage Centre at earliest possible time. For outstation solicitor, Mortgage Centre will courier the same to your firm. <br><br>' + CHAR(13)+CHAR(10)

	--set @line4 = 'Kindly collect the documents from the respective Mortgage Centre at earliest possible time for further action. For outstation solicitor, Mortgage Centre will courier the same to your firm. <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Kindly collect the unexecuted documents from the respective Mortgage Centre at earliest possible time. <br><br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Please CLICK HERE to log on to the portal for re-submission once the documents have been duly rectified or additional documents have been obtained as per our comments / remarks stated as per the cover letter.   <br>' + CHAR(13)+CHAR(10)
	
	--set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for re-submission once the documents have been duly rectified or additional documents have been obtained as per our comments / remarks stated as per the cover letter.   <br><br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for re-submission of the documents required documents and for time for comments / remarks by the bank, if any and re-submission of documents, if any, together with the relevant documents.   <br><br>' + CHAR(13)+CHAR(10)
	set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal to review comments / remarks made by the bank and for re-submission of documents, if any.   <br><br>' + CHAR(13)+CHAR(10)
	
	--set @line6 =  '' + CHAR(13)+CHAR(10)

	set @line6 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line7 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line8 =  'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line9 = 'Mortgage Centre <br><br>' + CHAR(13)+CHAR(10)

	--set @line11 = '' + CHAR(13)+CHAR(10)

	Set @line10 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>' 

	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9  + @line10 
	
	
	declare @sender nvarchar(max)

	select @sender = [SenderEmail]
	FROM [Settings]


	select @line1 as email_header , @text as email_content, @sender as sender_email

end