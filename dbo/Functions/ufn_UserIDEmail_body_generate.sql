CREATE       function [dbo].[ufn_UserIDEmail_body_generate]
(
@param_userid nvarchar(100),
@param_pw nvarchar(100),
@param_IsSubUser bit
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
	@line13 nvarchar(max),
	@line14 nvarchar(max),
	@line15 nvarchar(max),
	@line16 nvarchar(max),
	@line17 nvarchar(max),
	@line18 nvarchar(max),
	@line19 nvarchar(max),
	@line20 nvarchar(max),
	@line21 nvarchar(max),
	@line22 nvarchar(max),
	@line23 nvarchar(max),
	@line24 nvarchar(max),
	@line25 nvarchar(max),
	@line26 nvarchar(max),
	@line27 nvarchar(max),
	@line28 nvarchar(max),
	@line29 nvarchar(max)

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
	
	--declare @PhaseName nvarchar(max)
	--set @PhaseName = (select phasename from ddProjectPhase where phasecode = @param_phase)

	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)
	set @line3 =''	
	
	set @line4 = 'Kindly be informed the Bank has an e-portal for developers. The property(ies) financed by our Bank will be listed in the e-portal for your company to submit progressive billing to the Bank.   <br><br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'Project Phase Name/Code :' + @PhaseName + '/' + @param_phase + '   <br>' + CHAR(13)+CHAR(10)
	set @line5 = 'The URL to access to the e-portal is as follow:-    <br>' + CHAR(13)+CHAR(10)
	
	--set @line7 = 'We look forward to your co-operation to submit your billings by e-submission via this e-portal. Thank you.    <br><br>' + CHAR(13)+CHAR(10)

	select @url = [url]	
	from url_setting 
	where [type] = 'DeveloperLogin'
	
	--set @line8 = 'Please <a href="'+ @url +'">CLICK HERE</a> to log on to the portal for billing submission.   <br><br>' + CHAR(13)+CHAR(10)
	set @line6 = '<a href="'+ @url +'">LINK</a> <br><br>' + CHAR(13)+CHAR(10)
	
	set @line7 = 'The log-in user ID and password assigned to your company is listed below:     <br><br>' + CHAR(13)+CHAR(10)

	set @line8 = '<u>User ID & Password</u>     <br>' + CHAR(13)+CHAR(10)

	set @line9 = 'User ID: '+ @param_userid + '<br>' + CHAR(13)+CHAR(10)

	set @line10 = 'Password: '+ @param_pw + '<br><br>' + CHAR(13)+CHAR(10)

	set @line11 = 'Please ensure compliance of the following:<br>' + CHAR(13)+CHAR(10)

	set @line12 = '1.	The User ID and Password are strictly to be used by your authorised personnel only;<br>' + CHAR(13)+CHAR(10)

	set @line13 = '2.	You are required to change the password immediately upon first log-in, with minimum password length of 12 digits;<br>' + CHAR(13)+CHAR(10)

	declare @passwordlength int 
	set @passwordlength = (select ProjectPasswordMinCharacters from ddSettingsExt)

	set @line14 = '(Note: The minimum password length is '+cast(@passwordlength as nvarchar(max))+' digits and must include combination of number, symbols, capital letters and lower case letters) <br>' + CHAR(13)+CHAR(10)

	set @line15 = '3.	The User ID will be blocked after three (3) continuous wrong password attempts. Please submit the form and contact the respective Mortgage Centre for any request to unblock the User ID; <br>' + CHAR(13)+CHAR(10)

	set @line16 = '4.	Compliance of the Terms and Conditions as per Appendix I attached. Upon your first log-in, you will be prompted to acknowledge acceptance of the Terms & Conditions of the e-portal. <br><br>' + CHAR(13)+CHAR(10)

	set @line17 = 'For submission of progressive billing, please access to the e-portal:<br>' + CHAR(13)+CHAR(10)

	set @line18 = '1.	Upload softcopy of the progressive billing and relevant architect certificate for the Bank to proceed for disbursement;<br>' + CHAR(13)+CHAR(10)

	set @line19 = 'Note: The property(ies) financed by our Bank will be listed in the e-portal once loan/financing documentation is executed by the Bank <br>' + CHAR(13)+CHAR(10)

	set @line20 = '2.	Resubmit billing and supporting document in the event of your submitted billing is rejected by the Bank due to incomplete document; <br>' + CHAR(13)+CHAR(10)

	set @line21 = '3.	Check the status of your submitted billing and payment record from the Bank. <br><br>' + CHAR(13)+CHAR(10)

	set @line22 = 'Notification of payment will be auto-generated and send to the registered email address of your respective project/phase upon remittance of payment for the property(ies). <br><br>' + CHAR(13)+CHAR(10)

	set @line23 = 'You may refer to the “Guide for HLB Developer e-Portal” posted in the e-portal for further reference on how to use the e-portal.  <br><br>' + CHAR(13)+CHAR(10)

	set @line24 = 'We look forward to your co-operation in e-submission of billing via this e-portal. Thank you.  <br><br>' + CHAR(13)+CHAR(10)

	--set @line7 = 'User ID:     <br>' + CHAR(13)+CHAR(10)

	/*
	set @line25 = 'Regards <br>' + CHAR(13)+CHAR(10)
	set @line26 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line27 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	set @line28 = 'Mortgage Centre<br><br>' + CHAR(13)+CHAR(10)
	*/
	set @line25 = '<br>' + CHAR(13)+CHAR(10)
	set @line26 = 'From, <br>'  + CHAR(13)+CHAR(10)
	set @line27 = 'Hong Leong Bank <br>' + CHAR(13)+CHAR(10)
	set @line28 = 'Hong Leong Islamic Bank<br><br>' + CHAR(13)+CHAR(10)


	--set @line29 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)
	set @line29 = '*** This is a system generated email. Please do not reply to this address. ***  <br><br>' + CHAR(13)+CHAR(10)

	--set @text = @line3
	set @text = @line2 + @line3 + @line4  + @line5 + @line6 + @line7 + @line8 + @line9 + @line10 + @line11 + @line12 + @line13
	set @text = @text + @line14 + @line15 + @line16  + @line17 + @line18 + @line19 + @line20 + @line21 + @line22 + @line23 + @line24 + @line25
	set @text = @text + @line26 + @line27 + @line28 + @line29  

	--select @line1 as email_header , @text as email_content
	
	return @text
end