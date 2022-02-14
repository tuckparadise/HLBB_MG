CREATE   function [dbo].[ufn_DUMaker_Letter_AV_disbursement_body_generate]
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
	@line11 nvarchar(max),
	@line12 nvarchar(max)

	declare @submissiondate datetime 

	select @submissiondate = SolicitorSubmissionDate 
	from aaSolDisbursementSubmission
	where arn = @arn

	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'

	/*
	select @arn = arn ,
		@letterofinstructiondate = DateOfLOAcceptance
	from sqlloads 
	where arn = @param_arn
	*/

	--set @line1 = 'Reminder to forward legal documents for execution for ' + @arn 
	
	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)
	
	set @line3 =''
	--set @line3 = 'Reference is made on the disbursement submission done by you dated  ' +  convert(nvarchar(max),@submissiondate,103)+ ' .<br><br>' + CHAR(13)+CHAR(10)

	--set @line4 = 'Based on our records, the bank has yet to receive the duly executed legal documents by the borrowers / customers.     <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Please note that the softcopy attachment(s) you provided togather with the e-form submission might contains harmful contents such as Virus or Malware hence you will need to resubmit the form with new attachments before the bank can take further actions.  <br><br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Kindly expedite on the documentation process and submit the documents for our execution. The bank shall not be liable for any delay in documentation.  <br><br>' + CHAR(13)+CHAR(10)
		
	set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for status update or uploading of the documents.   <br><br>' + CHAR(13)+CHAR(10)

	
	
	set @line6 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line7 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line8 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line9 = 'Mortgage Centre<br><br>' + CHAR(13)+CHAR(10)

	set @line10 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)

	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 
	
	--select @line1 as email_header , @text as email_content
	
	return @text
end