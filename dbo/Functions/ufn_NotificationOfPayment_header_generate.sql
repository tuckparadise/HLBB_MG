CREATE     function [dbo].[ufn_NotificationOfPayment_header_generate]
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
	@line11 nvarchar(max)

	/*
	select @url = [url]
	from url_setting 
	where [type] = 'ValuerLogin'

	select @arn = arn ,
		@letterofinstructiondate = DateOfLOAcceptance
	from sqlloads 
	where arn = @param_arn
	*/
	set @line1 = 'Notification Of Payment for ' + @param_arn  
	
	return @line1
end