create   procedure [dbo].[usp_SolPDFPasswordSetting_FieldName_FindAll]
as
begin
	SELECT [FieldName]
      ,[FieldNameDisplayValue]
  FROM [dbo].[SolPDFPasswordSetting_FieldName]
end