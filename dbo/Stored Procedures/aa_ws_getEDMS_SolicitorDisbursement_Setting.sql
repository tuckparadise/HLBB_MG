CREATE       procedure [dbo].[aa_ws_getEDMS_SolicitorDisbursement_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT *
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA05 Disbursement'
end