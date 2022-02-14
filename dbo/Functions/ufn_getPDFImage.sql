CREATE function [dbo].[ufn_getPDFImage]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	declare @Image nvarchar(max)
	
	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')
	
	return @Image
end