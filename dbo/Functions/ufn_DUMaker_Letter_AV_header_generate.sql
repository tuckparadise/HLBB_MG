CREATE   function [dbo].[ufn_DUMaker_Letter_AV_header_generate]
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
	@letterofinstructiondate date,
	@url nvarchar(max),
	@line11 nvarchar(max)

	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'

	select @arn = arn ,
		@letterofinstructiondate = DateOfLOAcceptance
	from sqlloads 
	where arn = @param_arn

	set @line1 = 'Non compliance attachment for ' + @arn 
	/*
	set @line2 = 'Dear Business Partner, <br>'  + CHAR(13)+CHAR(10)
		
	set @line3 = 'Reference is made to the Letter of Instruction dated  ' +  convert(nvarchar(max),@letterofinstructiondate,103)+ ' issued by the bank. <br>' + CHAR(13)+CHAR(10)

	set @line4 = 'Based on our records, the bank has yet to receive the duly executed legal documents by the borrowers / customers.     <br>' + CHAR(13)+CHAR(10)
	set @line5 = 'Please note that the bank reserve the rights to review and / or cancel the loan / facility in the event we did not receive the duly executed legal documents by customers and shall not be responsible for any damages and / or cost incurred.  <br>' + CHAR(13)+CHAR(10)

	set @line6 = 'Kindly expedite on the documentation process and submit the documents for our execution. The bank shall not be liable for any delay in documentation.  <br>' + CHAR(13)+CHAR(10)
		
	set @line7 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for status update or uploading of the documents.   <br>' + CHAR(13)+CHAR(10)

	set @line8 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	
	set @line9 = 'Regards <br>' 
	set @line10 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' 
	set @line11 = 'Mortgage Centre'

	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 + @line11
	
	select @line1 as email_header , @text as email_content
	*/
	return @line1
end