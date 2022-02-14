create     procedure [dbo].[usp_MortgageAppTaskInstance_billing_delete]
@workflow nvarchar(max) = null ,
@billingid bigint = null ,
@arn nvarchar(max) = null 
as
begin

	if exists 
	(
		select 1
		from MortgageAppTaskInstance_billing 
		where workflow = @workflow
		and arn = @arn 
			and BillingRunningID = @billingid
	)
	begin
		insert into MortgageAppTaskInstance_billing_logs 
		select [workflow]
			,[arn]
			,[TaskOwner]
			,[CreatedDate]
			,getdate()
			,[CreatedUser]
			,[UpdatedUser]
			, 1
			, 0
			,@billingid
		from MortgageAppTaskInstance_billing 
		where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid
	end 		

	declare @Owner nvarchar(max), @Operator nvarchar(max)

	select @Owner = [TaskOwner]
	from MortgageAppTaskInstance_billing
	where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid

	if (@workflow = 'DisbDUMakerBillingApproval')
	begin
		insert into WorkflowHistory_billing 
		values ('Progressive Billing',@arn,'Case Unpicked By Disbursement Maker',@Owner,null,getdate(),@billingid)
	end 

	if (@workflow = 'DisbDUCheckerBillingApproval')
	begin
		insert into WorkflowHistory_billing
		values ('Progressive Billing',@arn,'Case Unpicked By Disbursement Checker',@Owner,null,getdate(),@billingid)
	end 

	if (@workflow = 'DisbRCOMakerBillingApproval')
	begin
		insert into WorkflowHistory_billing
		values ('Progressive Billing',@arn,'Case Unpicked By RCO Maker',@Owner,null,getdate(),@billingid)
	end 

	if (@workflow = 'DisbRCOCheckerBillingApproval')
	begin
		insert into WorkflowHistory_billing
		values ('Progressive Billing',@arn,'Case Unpicked By RCO Checker',@Owner,null,getdate(),@billingid)
	end 

	delete from MortgageAppTaskInstance_billing 
	where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid
end