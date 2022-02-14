create function [dbo].[ufn_getPDFImageName]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	--declare @ImageSource xml
	
	declare @ImageName nvarchar(max)
	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	
	return @ImageName
end