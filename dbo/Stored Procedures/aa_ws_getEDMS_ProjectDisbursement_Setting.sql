create         procedure [dbo].[aa_ws_getEDMS_ProjectDisbursement_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT *
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA06 Billing Related Doc'
end