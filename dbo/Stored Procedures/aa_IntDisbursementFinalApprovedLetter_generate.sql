CREATE         procedure [dbo].[aa_IntDisbursementFinalApprovedLetter_generate]
@param_arn nvarchar(100) = null ,
@RunningIDForCompletedSubmission nvarchar(100) = null ,
@BillingID nvarchar(100) = null 
as
begin	

	declare @line nvarchar(max),
	@lineheader nvarchar(max),
	@text nvarchar(max),
	--@arn nvarchar(100),
	@url nvarchar(max)
	
	select @url = [url]
	from url_setting 
	where [type] = 'SolicitorLogin'
	
	declare 
		@reasons nvarchar(max),
		--@SolicitorSubmissionDate datetime ,
		@DUMakerSubmissionDate datetime 
	
	set @reasons= ''

	select @DUMakerSubmissionDate = DisbursementMakerSubmissionDate		
	from aaIntDisbursementSubmission_History
	where  arn = @param_arn
		and RunningIDForCompletedSubmission = @RunningIDForCompletedSubmission		

	set @line = ''

	--set @lineheader = 'Billing completed for ' + @param_arn + ' ( billing ref id:'+ @BillingID + ' )'
	set @lineheader = 'Billing completed for ' + @param_arn 

	set @line = @line +  'Dear Disbursement Maker, <br><br>'  + CHAR(13)+CHAR(10)

	--set @line = @line +  'Reference is made to disbursement request received by the bank on ' +  convert(nvarchar(max),@SolicitorSubmissionDate,103)+'. <br><br>' + CHAR(13)+CHAR(10)
	
	set @line = @line +  'The disbursement is now completed. You may submit further billing for this case if balance advice letter is applicable<br><br>' + CHAR(13)+CHAR(10)
	
	--set @line = @line +  @reasons + '<br><br>' + CHAR(13)+CHAR(10)

	--set @line = @line + 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for submission of the further disbursement if applicable  <br><br>' + CHAR(13)+CHAR(10)
	
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