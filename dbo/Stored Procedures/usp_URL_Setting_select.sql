CREATE procedure [dbo].[usp_URL_Setting_select] 
  @Type nvarchar(max) = null
  as
  begin
	select Type, URL
	from URL_Setting
	where type = @Type
  end