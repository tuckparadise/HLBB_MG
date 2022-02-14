CREATE function [dbo].[ufn_DUMaker_Letter_A8_header_generate]
(@param_arn nvarchar(100))
RETURNS nvarchar(max)
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
	@text nvarchar(max),
	@arn nvarchar(100),
	@dateofreject date,
	@url nvarchar(max),
	@line11 nvarchar(max)

	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'

	select @arn = arn 		
	from sqlloads 
	where arn = @param_arn

	select @dateofreject = updateddate
	from SQLDUMakerDP_SolicitorSubmission_Rejected
	where arn = @arn 

	set @line1 = 'Reminder- Re-submit legal documents for ' + @arn 

	/*
	set @line2 = 'Dear Business Partner, <br>'  + CHAR(13)+CHAR(10)
		
	set @line3 = 'Reference is made to our letter dated ' +  convert(nvarchar(max),@dateofreject,103)+ ' <br>' + CHAR(13)+CHAR(10)

	set @line4 = 'Please rectify the errors in the legal documents as stipulated in our aforesaid letter and re-submit to us for our execution.   <br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'You may follow up with the solicitor for the status of legal documentation.  <br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Kindly expedite on the documentation process and submit the documents for our execution. The bank shall not be liable for any delay in documentation.  <br>' + CHAR(13)+CHAR(10)
		
	set @line7 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for uploading of the additional documents and re-submit the documents for our execution.   <br>' + CHAR(13)+CHAR(10)

	set @line8 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	
	set @line9 = 'Regards <br>' 
	set @line10 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' 
	set @line11 = 'Mortgage Centre'

	set @text = @line2 + @line3 + @line4 + @line7 +  @line8 + @line9 + @line10 + @line11
	*/
	--select @line1 as email_header , @text as email_content
	
	return @line1
end