CREATE   procedure [dbo].[aa_DisbursementMakerRejectedLetter_generate]
@param_arn nvarchar(100)
as
begin	

	declare @line nvarchar(max),
	@lineheader nvarchar(max),
	--@text nvarchar(max),
	--@arn nvarchar(100),
	--@letterofinstructiondate date,
	--@dateofacceptance date,
	@url nvarchar(max)
	
	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'
	
	declare 
		@reasons nvarchar(max),
		@SolicitorSubmissionDate datetime 
	
	set @reasons= ''

	select @SolicitorSubmissionDate = SolicitorSubmissionDate,
		@reasons = DisbursementMakerRejectionReason
	from aaSolDisbursementSubmission_DisMakerRejected
	where  arn = @param_arn

	/*
	select @arn = sqlloads.arn ,
		@letterofinstructiondate = DateOfLOAcceptance,
		@dateofacceptance = submission.UpdatedDate
	from sqlloads 
	--inner join SQLDUMakerDP_SolicitorSubmission_Rejected submission on submission.arn = sqlloads.arn
	where sqlloads.arn = @param_arn
	*/
	
	set @line = ''

	set @lineheader = 'Unexecuted disbursement by the bank for ' + @param_arn 

	set @line = @line +  'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)

	set @line = @line +  'Reference is made to disbursement request received by the bank on ' +  convert(nvarchar(max),@SolicitorSubmissionDate,103)+'. <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  'The disbursement is rejected due to the following reasons below: <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  @reasons + '<br><br>' + CHAR(13)+CHAR(10)

	set @line = @line + 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for re-submission of the disbursement   <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  'Regards <br>' + CHAR(13)+CHAR(10)
	set @line = @line +  '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line = @line +  'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line = @line +  'Mortgage Centre <br><br>' + CHAR(13)+CHAR(10)
	
	Set @line = @line +  '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>' 
	
	declare @sender nvarchar(max)

	select @sender = [SenderEmail]
	FROM [Settings]

	declare @receiver nvarchar(max)
	select top 1 @receiver = SolicitorEmail 
	from SQLLOADS
	where arn = @param_arn 

	select @lineheader as email_header , @line as email_content, @sender as sender_email, @receiver as receiver_email

end