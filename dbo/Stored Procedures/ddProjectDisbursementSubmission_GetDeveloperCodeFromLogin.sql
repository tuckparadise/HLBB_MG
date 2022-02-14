CREATE     procedure [dbo].[ddProjectDisbursementSubmission_GetDeveloperCodeFromLogin]
@ID nvarchar(max) = null,
@DeveloperCode nvarchar(max) = null output 
as
begin
	if exists 
	(
		select 1
		from ddProjectDeveloperSubUser
		where ID = @ID
	)
	begin
		set @DeveloperCode  = (select DeveloperCode from ddProjectDeveloperSubUser where ID = @ID ) 
	end 
	else 
	begin
		set @DeveloperCode = @ID 
	end 
end