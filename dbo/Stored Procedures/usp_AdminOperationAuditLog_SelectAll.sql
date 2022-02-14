CREATE   procedure [dbo].[usp_AdminOperationAuditLog_SelectAll]
as
begin	
	/*
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeysview]  as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValueview] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName] 
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		and [Operation] = 'EDIT'
		and TableName in ('UserRoleMetric')
		union 
	*/
	-- get internal user (insert)
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where 
		--TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		--and 
		[Operation] not in ('UPDATE','EDIT')
		--and TableName not in ('UserRoleMetric','InternalUserRole','IntUsr_Adm_SecuritySetting','IntUsr_Adm_ApplicationSetting' )
		and TableName in ('InternalUser')
	union 

	-- get internal user role (insert)
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeysView] as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValueView] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
	where 
		--TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
		--and 
		[Operation] not in ('UPDATE','EDIT')
		and TableName in ('InternalUserRole')
	union 
	-- get internal user role and internal user (update)
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys] as [OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue] as [OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      ,REPLACE([Operator], 'k2:', '') as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog2]
	--where TableName not in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer')
	--where TableName in ('InternalUserRole','InternalUser')
	where TableName in ('InternalUser','InternalUserRole','IntUsr_Adm_ApplicationSetting','IntUsr_Adm_SecuritySetting' )	
end