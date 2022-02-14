CREATE procedure [dbo].[usp_wf_ConvertFormToPDF_GetURL]
  @Type nvarchar(max) = null, 
  @URL nvarchar(max) = null output 
  as
  begin
	select @URL = URL
	from URL_Setting
	where type = @Type
  end