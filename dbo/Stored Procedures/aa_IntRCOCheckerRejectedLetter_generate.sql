CREATE     procedure [dbo].[aa_IntRCOCheckerRejectedLetter_generate]
@param_arn nvarchar(100) = null,
@param_billingid nvarchar(100) = null
as
begin	

	declare @line nvarchar(max),
	@lineheader nvarchar(max),
	@text nvarchar(max),
	@arn nvarchar(100),
	--@letterofinstructiondate date,
	--@dateofacceptance date,
	@url nvarchar(max)
	
	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'
	
	declare 
		@reasons nvarchar(max),
		@SubmissionDate datetime ,
		@receiver nvarchar(max)
	
	set @reasons= ''
	set @receiver = ''

	select @SubmissionDate = RCOMakerSubmissionDate,
		@reasons = RCOCheckerRejectionReason,
		@receiver = RCOMakerSubmissionDate
	from aaIntDisbursementSubmission_RCOCheckerRejected
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

	--set @lineheader = 'Billing rejected for ' + @param_arn + ' ( billing ref id:'+ @param_billingid + ' ) '
	set @lineheader = 'Billing rejected for ' + @param_arn 

	set @line = @line +  'Dear RCO Maker, <br><br>'  + CHAR(13)+CHAR(10)

	--set @line = @line +  'Reference is made to disbursement request received by the bank on ' +  convert(nvarchar(max),@SolicitorSubmissionDate,103)+'. <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  'The billing is rejected due to the following reason below: <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  @reasons + '<br><br>' + CHAR(13)+CHAR(10)

	--set @line = @line + 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for re-submission of the disbursement   <br><br>' + CHAR(13)+CHAR(10)
	
	--set @line = @line +  'Regards <br>' + CHAR(13)+CHAR(10)
	--set @line = @line +  '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	--set @line = @line +  'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	--set @line = @line +  'Mortgage Centre <br><br>' + CHAR(13)+CHAR(10)
	
	Set @line = @line +  '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>' 
	
	declare @sender nvarchar(max)

	select @sender = [SenderEmail]
	FROM [Settings]


	select @lineheader as email_header , @line as email_content, @sender as sender_email, @receiver as receiver_email

end