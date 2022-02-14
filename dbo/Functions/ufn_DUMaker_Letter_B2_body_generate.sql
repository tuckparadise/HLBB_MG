CREATE function [dbo].[ufn_DUMaker_Letter_B2_body_generate]
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
	@dateofacceptance date,
	@url nvarchar(max),
	@line11 nvarchar(max)
	
	/*	
	select @url = [url]
	from url_setting 
	where [type] = 'ValuerLogin'

	select @dateofacceptance = sqlloads.DateOfLOAcceptance
	from sqlloads 
	where arn = @param_arn
	*/
	
	set @line2 = 'Dear Business Partner, <br><br>'  + CHAR(13)+CHAR(10)

	set @line3 = 'Reference is made to the Letter of Instruction issued by the bank for the case above. <br><br>' + CHAR(13)+CHAR(10)
	set @line4 = 'Based on our records, the bank has yet to receive the original Valuation Report (“VR”). <br><br>' + CHAR(13)+CHAR(10)
	set @line5 = 'Kindly expedite and send us the original VR for our further action. <br><br>' + CHAR(13)+CHAR(10)

	--set @line6 = '' + CHAR(13)+CHAR(10)
		
	set @line6 = 'Regards <br>'  + CHAR(13)+CHAR(10)
	set @line7 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	set @line8 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>'  + CHAR(13)+CHAR(10)
	set @line9 = 'Mortgage Centre<br><br>'  + CHAR(13)+CHAR(10)

	set @line10 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail. </i><br>'  + CHAR(13)+CHAR(10)

	set @text = @line2 + @line3 + @line4 + @line5 + @line6 + @line7 + @line8 + @line9 + @line10
	
	return @text
end