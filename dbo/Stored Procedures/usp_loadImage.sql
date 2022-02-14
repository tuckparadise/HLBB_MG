CREATE procedure [dbo].[usp_loadImage]
@ImageType nvarchar(100)
as
begin

	declare @ImageSource xml
	declare @Image nvarchar(max)

	select @ImageSource= [image]
	from imagesettings 
	where imagetype = @ImageType 

	set @Image= @ImageSource.value('(/file/content)[1]', 'nvarchar(max)')

	select @Image as [Image]
end