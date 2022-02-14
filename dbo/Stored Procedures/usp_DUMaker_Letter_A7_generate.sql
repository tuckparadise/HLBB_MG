--[usp_DUMaker_Letter_A1_generate] 'arn1'

CREATE procedure [dbo].[usp_DUMaker_Letter_A7_generate]
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
	@text nvarchar(max),
	@arn nvarchar(100),
	@letterofinstructiondate date,
	@dateofacceptance date
	

	select @arn = sqlloads.arn ,
		@letterofinstructiondate = DateOfLOAcceptance,
		@dateofacceptance = submission.UpdatedDate
	from sqlloads 
		inner join SQLDUMakerDP_SolicitorSubmission_Rejected submission on submission.arn = sqlloads.arn
	where sqlloads.arn = @param_arn

	set @line1 = 'Unexecuted documents by the bank for ' + @arn

	set @line2 = 'Dear Customers, <br><br>'  + CHAR(13)+CHAR(10)

	set @line3 = 'Reference is made to the Letter of Offer dated ' +  convert(nvarchar(max),@letterofinstructiondate,103)+'. <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Please note that the bank has returned the legal documents to solicitor for rectification prior to execution.      <br><br>' + CHAR(13)+CHAR(10)
	set @line5 = 'You may follow up with the solicitor on the details. <br><br>' + CHAR(13)+CHAR(10)

	--set @line6 = '' + CHAR(13)+CHAR(10)
	
	set @line6 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line7 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line8 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>'  + CHAR(13)+CHAR(10)
	set @line9 = 'Mortgage Centre <br><br>'+ CHAR(13)+CHAR(10)

	--set @line10 = '' + CHAR(13)+CHAR(10)

	set @line10 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>'  
	
	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 
	
	declare @sender nvarchar(max)

	select @sender = [SenderEmail]
	FROM [Settings]

	
	
	select @line1 as email_header , @text as email_content, @sender as sender_email

end