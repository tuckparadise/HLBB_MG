CREATE     function [dbo].[ufn_DocApprovedEmailToDeveloper_body_generate]
(
@param_phase nvarchar(100),
@param_project nvarchar(100),
@param_developer nvarchar(100)
)
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
	@line12 nvarchar(max),
	@line13 nvarchar(max)
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
	select @url = [url]	
	from url_setting 
	where [type] = 'DeveloperLogin'	

	declare @PhaseName nvarchar(max)
	set @PhaseName = (select phasename from ddProjectPhase where phasecode = @param_phase)

	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)
	set @line3 =''	
	
	set @line4 = 'Kindly be informed that the property(ies) financed by our Bank for the following project is available in HLB Developer e-Portal for your company to submit progressive billing to the Bank.  <br><br>' + CHAR(13)+CHAR(10)
	set @line5 = 'Project Phase Name/Code :' + @PhaseName + '/' + @param_phase + '   <br><br>' + CHAR(13)+CHAR(10)

	set @line6 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the e-Portal for billing submission.   <br><br>' + CHAR(13)+CHAR(10)

	set @line7 = 'Please refer to the notice posted in the e-Portal should you have any queries.    <br><br>' + CHAR(13)+CHAR(10)
	
	set @line8 = 'We look forward to your co-operation to submit your billings by e-submission via this e-Portal. Thank you.    <br><br>' + CHAR(13)+CHAR(10)
	
	/*
	set @line9 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line10 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line11 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line12 = 'Mortgage Centre<br><br>' + CHAR(13)+CHAR(10)
	*/
	set @line9 = '<br>' + CHAR(13)+CHAR(10)
	set @line10 = 'From, <br>'  + CHAR(13)+CHAR(10)
	set @line11 = 'Hong Leong Bank <br>' + CHAR(13)+CHAR(10)
	set @line12 = 'Hong Leong Islamic Bank <br><br>' + CHAR(13)+CHAR(10)

	--set @line13 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	set @line13 = '*** This is a system generated email. Please do not reply to this address. ***  <br><br>' + CHAR(13)+CHAR(10)
	
	--set @text = @line3
	set @text = @line2 + @line3 + @line4  + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 + @line11 + @line12 + @line13
	
	--select @line1 as email_header , @text as email_content
	
	return @text
end