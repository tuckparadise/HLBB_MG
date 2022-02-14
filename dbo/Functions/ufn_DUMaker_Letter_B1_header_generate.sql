create function [dbo].[ufn_DUMaker_Letter_B1_header_generate]
(@param_arn nvarchar(100))
RETURNS nvarchar(max)
as
begin	
	
	declare @line1 nvarchar(max)

	set @line1 = 'Reminder to forward valuation report for ' + @param_arn 
	
	return @line1
end