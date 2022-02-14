﻿CREATE function [dbo].[ufn_DUMaker_Letter_A3_header_generate]
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

	set @line1 = 'Pending execution of legal documents for ' + @arn 
	/*
	set @line2 = 'Dear officer in charge, <br>'  + CHAR(13)+CHAR(10)
		
	set @line3 = 'Reference is made to the Letter of Offer dated ' +  convert(nvarchar(max),@letterofinstructiondate,103)+ ' <br>' + CHAR(13)+CHAR(10)

	set @line4 = 'Please note that the bank has yet to receive the legal documents duly executed from the solicitors.  <br>' + CHAR(13)+CHAR(10)
	set @line5 = 'You may follow up with the solicitor for the status of legal documentation.  <br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Kindly expedite on the documentation process and submit the documents for our execution. The bank shall not be liable for any delay in documentation.  <br>' + CHAR(13)+CHAR(10)
		
	--set @line7 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for status update or uploading of the documents.   <br>' + CHAR(13)+CHAR(10)

	set @line8 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	
	set @line9 = 'Regards <br>' 
	set @line10 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' 
	set @line11 = 'Mortgage Centre'

	set @text = @line2 + @line3 + @line4 + @line5 +  @line8 + @line9 + @line10 + @line11
	
	select @line1 as email_header , @text as email_content
	*/
	return @line1
end