CREATE     procedure [dbo].[usp_AdminOperationAuditLog_SelectAll_MortgageAdmin]
as
begin
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      --,REPLACE([Operator], 'k2:', '') as [Operator]
	  ,UserFullName as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
  --left join InternalUser on InternalUser.UserName = [AdminOperationAuditLog].Operator
    left join InternalUser on InternalUser.UserName = case when [AdminOperationAuditLog].Operator like 'K2:%' then Stuff([AdminOperationAuditLog].Operator, 1, 3, '') else [AdminOperationAuditLog].Operator end 
	where TableName in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer','ddProjectDeveloper','ddProjectDeveloperSubUser','ddProjectPhase','ddProjectAnnouncementSettings','ddProjectAnnouncement','ddProjectNotificationOfPayment_Setting','aaNotificationOfPayment_Setting')
		and [Operation] not in ('UPDATE','EDIT')
		--and TableName not in ('UserRoleMetric','InternalUserRole')	
	union 
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      --,REPLACE([Operator], 'k2:', '') as [Operator]
	  ,UserFullName as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog2]
  --left join InternalUser on InternalUser.UserName = [AdminOperationAuditLog2].Operator
  left join InternalUser on InternalUser.UserName = case when [AdminOperationAuditLog2].Operator like 'K2:%' then Stuff([AdminOperationAuditLog2].Operator, 1, 3, '') else [AdminOperationAuditLog2].Operator end 
	where TableName in ('[aaSolDisbursementSubmission_BankInfo]','aaSolDisbursementSubmission_BankInfo','aaSolDisbursementSubmission_PaymentReference','SQLDUMakerDP_AttorneyCentre','SQLDUMakerDP_AttorneyName','SQLSolicitor','sqlvaluer','ddProjectDeveloper','ddProjectDeveloperSubUser','ddProjectPhase','ddProjectAnnouncementSettings','ddProjectAnnouncement','ddProjectNotificationOfPayment_Setting','aaNotificationOfPayment_Setting')
	--order	by InsertedDateTime desc
	union 
	-- developer project mapping
	SELECT [TableName]
      ,[Operation]
      ,[OperationPrimaryKeys]
      ,[OperationPrimaryKeysValue]
      ,[ConcatenatedFieldsName]
      ,[ConcatenatedOriginalValue]
      ,[ConcatenatedNewValue]
      --,REPLACE([Operator], 'k2:', '') as [Operator]
	  ,UserFullName as [Operator]
      ,[InsertedDateTime]
  FROM [dbo].[AdminOperationAuditLog]
  --left join InternalUser on InternalUser.UserName = [AdminOperationAuditLog].Operator
  left join InternalUser on InternalUser.UserName = case when [AdminOperationAuditLog].Operator like 'K2:%' then Stuff([AdminOperationAuditLog].Operator, 1, 3, '') else [AdminOperationAuditLog].Operator end 
	where TableName in ('ddProjectDeveloperProjectMapping')
		--and [Operation] not in ('UPDATE','EDIT')
end