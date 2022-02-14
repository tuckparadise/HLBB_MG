CREATE function [dbo].[ufn_getPDFImageNameFileType]
(@ImageSource xml)
RETURNS nvarchar(max)
as
begin	
	
	--declare @ImageSource xml
	
	declare @ImageName nvarchar(max)
	declare @dotindex int
	declare @filetype nvarchar(max)
	declare @filetypereversed nvarchar(max)

	
	set @ImageName= @ImageSource.value('(/file/name)[1]', 'nvarchar(max)')
	set @dotindex = CHARINDEX('.', reverse(@ImageName))

	--select CHARINDEX('.', '4.Fixed asset - Internal Stock Requisition.pdf')
	--select reverse('4.Fixed asset - Internal Stock Requisition.pdf')
	set @filetypereversed = stuff(reverse(@ImageName),@dotindex,len(reverse(@ImageName))+1,'')
	set @filetype = reverse(@filetypereversed);
	--set @filetype =  stuff('Fixed asset - Internal Stock Requisition.pdf',1,CHARINDEX('.', 'Fixed asset - Internal Stock Requisition.pdf'),'')
	--select @filetype

	return @filetype
end