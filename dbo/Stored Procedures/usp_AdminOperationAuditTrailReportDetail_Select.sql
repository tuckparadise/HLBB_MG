CREATE   procedure [dbo].[usp_AdminOperationAuditTrailReportDetail_Select]
@TableName nvarchar(max) = null ,
@Operation nvarchar(max) = null ,
@InsertedDate nvarchar(max) = null 
as
begin
	
SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,[Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
where tablename = @TableName
	and operation = @Operation	
	and inserteddatetime = @InsertedDate
end