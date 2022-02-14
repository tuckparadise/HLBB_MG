CREATE     procedure [dbo].[usp_AdminOperationAuditLog_SelectAll_UserMetric]
as
begin
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].AdminOperationAuditLog_UserMetric
	
end