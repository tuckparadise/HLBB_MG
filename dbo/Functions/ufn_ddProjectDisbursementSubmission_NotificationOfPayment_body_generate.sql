CREATE     function [dbo].[ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate]
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

	/*
	declare @SolicitorEmail nvarchar(max)

	select @SolicitorEmail = SolicitorEmail 	
	from SQLLOADS
	where arn = @arn	
	*/

	/*
	declare @submissiondate date 

	select @submissiondate = UpdatedDate 
	--select @submissiondate1 = convert(nvarchar(max),UpdatedDate,103) 	
	from SQLValuerDPSubmission
	where arn = @arn	
	*/

	/*
	select @arn = arn ,
		@letterofinstructiondate = DateOfLOAcceptance
	from sqlloads 
	where arn = @param_arn
	*/

	--set @line1 = 'Reminder to forward legal documents for execution for ' + @arn 
	
	--set @line2 = 'Dear Developer, <br><br>'  + CHAR(13)+CHAR(10)
	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)
	set @line3 =''	
	
	--set @line4 = 'Please refer to the attached document for the notification of payment and contact Mortgage Centre for any questions about the payment  <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Attached herewith the Notification of Payment for your further action.   <br><br>' + CHAR(13)+CHAR(10)
	
	set @line5 = 'For security purposes, the attachment is password protected. Please refer to the notice posted in HLB Developer e-Portal for the password combination.    <br><br>' + CHAR(13)+CHAR(10)

	/*
	select @url = [url]	
	from url_setting 
	where [type] = 'ValuerLogin'
	*/
	--set @line5 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for status update or uploading of the documents.   <br><br>' + CHAR(13)+CHAR(10)
	
	/*
	set @line6 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line7 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line8 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line9 = 'Mortgage Centre<br><br>' + CHAR(13)+CHAR(10)
	*/

	set @line6 = '<br>' + CHAR(13)+CHAR(10)
	set @line7 = 'From, <br>'  + CHAR(13)+CHAR(10)
	set @line8 = 'Hong Leong Bank <br>' + CHAR(13)+CHAR(10)
	set @line9 = 'Hong Leong Islamic Bank <br><br>' + CHAR(13)+CHAR(10)

	set @line10 = '*** This is a system generated email. Please do not reply to this address. ***  <br><br>' + CHAR(13)+CHAR(10)

	--set @text = @line3
	set @text = @line2 + @line3 + @line4  + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 
	
	--select @line1 as email_header , @text as email_content
	
	return @text
end