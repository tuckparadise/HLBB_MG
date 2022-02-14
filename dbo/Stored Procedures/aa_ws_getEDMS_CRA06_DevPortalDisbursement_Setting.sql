CREATE           procedure [dbo].[aa_ws_getEDMS_CRA06_DevPortalDisbursement_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT *
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA06 Billing (Dev Portal)'
end