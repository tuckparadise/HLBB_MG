create   procedure [dbo].[aa_DisbursementSubmission_PR_DI_AuditTrailList]
@arn nvarchar(max) = null 
as
begin
	select * from 
	(
		select FORMAT (inserteddatetime, 'dd/MM/yyyy HH:mm:ss') as [Date],
			ConcatenatedFieldsName as [Field],
			ConcatenatedOriginalValue as [OldValue],
			ConcatenatedNewValue as [NewValue],
			Operator as [Maker]
		from aaDI_ProjectAccountBankAuditLog
		where OperationPrimaryKeysValue = @arn 
		union
		select FORMAT (inserteddatetime, 'dd/MM/yyyy HH:mm:ss') as [Date],
			ConcatenatedFieldsName as [Field],
			ConcatenatedOriginalValue as [OldValue],
			ConcatenatedNewValue as [NewValue],
			Operator as [Maker]
		from aaDI_ProjectAccountAuditLog
		where OperationPrimaryKeysValue = @arn 
		union
		select FORMAT (inserteddatetime, 'dd/MM/yyyy HH:mm:ss') as [Date],
			ConcatenatedFieldsName as [Field],
			ConcatenatedOriginalValue as [OldValue],
			ConcatenatedNewValue as [NewValue],
			Operator as [Maker]
		from aaBF_BridgingFinancierRedemptionSumAuditLog
		where OperationPrimaryKeysValue = @arn 
		union
		select FORMAT (inserteddatetime, 'dd/MM/yyyy HH:mm:ss') as [Date],
			ConcatenatedFieldsName as [Field],
			ConcatenatedOriginalValue as [OldValue],
			ConcatenatedNewValue as [NewValue],
			Operator as [Maker]
		from aaBF_RedemptionPaymentAccountNumberAuditLog
		where OperationPrimaryKeysValue = @arn 
	) tbl 
	order by [date] desc 
end