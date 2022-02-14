CREATE     procedure [dbo].[ddAdmin_Project_ValidateDeveloperCode]
@ID nvarchar(max) = null,
@Error nvarchar(max) = null output 
as
begin
	set @Error = ''

	if exists 
	(
		SELECT id
		FROM [dbo].ddProjectDeveloper
		WHERE id = @ID
	)		
	BEGIN
		SET @Error = 'Duplicate Developer Code'
	END 
end