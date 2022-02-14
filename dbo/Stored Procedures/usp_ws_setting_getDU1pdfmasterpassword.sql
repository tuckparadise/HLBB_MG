CREATE procedure [dbo].[usp_ws_setting_getDU1pdfmasterpassword]
  as
  begin
		--declare @masterpassword nvarchar(max)
		--select @masterpassword = 
		select pdfmasterpassword
		from Settings
				
  end