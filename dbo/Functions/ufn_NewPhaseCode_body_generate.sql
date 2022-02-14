create         function [dbo].[ufn_NewPhaseCode_body_generate]
(
@param_devcode nvarchar(100),
@param_projectcode nvarchar(100),
@param_phasecode nvarchar(100),
@param_arn nvarchar(100)
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

	set @line2 = 'Dear Mortgage Admin, <br><br>'  + CHAR(13)+CHAR(10)
	set @line3 =''	
	
	set @line4 = 'Please refer to below info regarding new phase code detected during New LI process   <br><br>' + CHAR(13)+CHAR(10)
	--set @line5 = 'Project Phase Name/Code :' + @PhaseName + '/' + @param_phase + '   <br>' + CHAR(13)+CHAR(10)

	set @line5 = 'New Phase Code: ' + @param_phasecode + '<br><br>' + CHAR(13)+CHAR(10)

	--set @line6 = 'Developer Code: ' + @param_devcode + '<br><br>' + CHAR(13)+CHAR(10)
	
	--set @line7 = 'Project Code: ' + @param_projectcode +  '<br><br>' + CHAR(13)+CHAR(10)
	
	set @line6 = 'Detected In Case: ' + @param_arn +  '<br><br>' + CHAR(13)+CHAR(10)

	--set @line7 = 'User ID:     <br>' + CHAR(13)+CHAR(10)

	--set @line25 = 'Regards <br>' + CHAR(13)+CHAR(10)
	--set @line26 = '<i>For and on behalf of</i> <br>'  + CHAR(13)+CHAR(10)
	--set @line27 = 'Hong Leong Bank Berhad / Hong Leong Islamic Bank Berhad <br>' + CHAR(13)+CHAR(10)
	--set @line28 = 'Mortgage Centre<br><br>' + CHAR(13)+CHAR(10)

	--set @line29 = '<i>**This is an auto generated e-mail. Please do not respond to this e-mail.</i>  <br>' + CHAR(13)+CHAR(10)

	--set @text = @line3
	set @text = @line2 + @line3 + @line4  + @line5 + @line6 
	--+ @line7 + @line8 
	--+ @line9 + @line10 + @line11 + @line12 + @line13
	--set @text = @text + @line14 + @line15 + @line16  + @line17 + @line18 + @line19 + @line20 + @line21 + @line22 + @line23 + @line24 + @line25
	--set @text = @text + @line26 + @line27 + @line28 + @line29  

	--select @line1 as email_header , @text as email_content
	
	return @text
end