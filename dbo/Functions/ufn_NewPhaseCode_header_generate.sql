create           function [dbo].[ufn_NewPhaseCode_header_generate]
(
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
	--declare @PhaseName nvarchar(max)
	--set @PhaseName = (select phasename from ddProjectPhase where phasecode = @param_phase)

	set @line1 = 'New Phase Code '
	
	return @line1
end