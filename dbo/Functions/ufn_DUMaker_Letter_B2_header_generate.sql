CREATE function [dbo].[ufn_DUMaker_Letter_B2_header_generate]
(@param_arn nvarchar(100))
RETURNS nvarchar(max)
as
begin	
	
	declare @line1 nvarchar(max)

	--set @line1 = 'Reminder to forward Valuation Report for ' + @param_arn
	set @line1 = 'Pending receipt of original documents for ' + @param_arn
	
	return @line1
end