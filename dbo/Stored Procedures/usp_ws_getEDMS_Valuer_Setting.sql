CREATE procedure [dbo].[usp_ws_getEDMS_Valuer_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT *
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA04 Valuation'
end