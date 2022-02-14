create     procedure [dbo].[aa_PDFPasswordDev_getPassword]
@arn nvarchar(max) = null,
@password nvarchar(max) = null output 
as
begin
	declare @pw_arn nvarchar(100)

	--set @arn = 'KLM/MG/2019/Z0102891'
	set @pw_arn = lower(dbo.[RemoveNonAlphaCharacters](@arn))
	
	set @pw_arn = right(@pw_arn,8)
	
	declare @devfirm nvarchar(max)	
	
	--select @solfirm = lower(REPLACE(solicitorname, ' ', ''))
	select @devfirm =lower(dbo.[RemoveNonAlphaCharacters](DeveloperName))
	from SQLLOADS
	--where arn = 'arn1'
	where arn= @arn
	
	SET @password=UPPER(LEFT(@devfirm,1))+LOWER(SUBSTRING(@devfirm,2,2)) + @pw_arn
	
end