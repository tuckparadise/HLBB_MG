CREATE   procedure [dbo].[usp_ws_getEDMS_SolicitorDisbursement_Setting]
@error nvarchar(max) = null output 
as
begin
	SELECT [EDMSDocType]
      ,[ProfileName]
      ,[LoginUser]
      ,[DefaultFileName]
      ,[EDMSUploadFolder]
      ,[Category]
  FROM [dbo].[EDMS_Settings]
  where EDMSDocType = 'CRA05 Disbursement'
end