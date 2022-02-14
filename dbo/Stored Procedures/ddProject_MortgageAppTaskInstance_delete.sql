CREATE       procedure [dbo].[ddProject_MortgageAppTaskInstance_delete]
@workflow nvarchar(max) = null ,
@billingid bigint = null ,
@arn nvarchar(max) = null 
as
begin

	if (@workflow = 'ProjectSubmission_DisMaker') set @workflow = 'DisbDUMakerBillingApproval'
	if (@workflow = 'ProjectSubmission_DisChecker') set @workflow = 'DisbDUCheckerBillingApproval'
	if (@workflow = 'ProjectSubmission_RCOMaker') set @workflow = 'DisbRCOMakerBillingApproval'		

	if exists 
	(
		select 1
		from ddProject_MortgageAppTaskInstance 
		where workflow = @workflow
		and arn = @arn 
			and BillingRunningID = @billingid
	)
	begin
		insert into ddProject_MortgageAppTaskInstance_logs 
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
		from ddProject_MortgageAppTaskInstance 
		where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid
	end 		

	declare @Owner nvarchar(max), @Operator nvarchar(max)

	select @Owner = [TaskOwner]
	from ddProject_MortgageAppTaskInstance
	where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid

	if (@workflow = 'DisbDUMakerBillingApproval')
	begin
		insert into WorkflowHistory_ProjectBilling 
		values ('Disbursement By Developer- Disbursement Maker',@arn,'Case Unpicked By Disbursement Maker',@Owner,null,getdate(),@billingid)
	end 

	if (@workflow = 'DisbDUCheckerBillingApproval')
	begin
		insert into WorkflowHistory_ProjectBilling 
		values ('Disbursement By Developer- Disbursement Checker',@arn,'Case Unpicked By Disbursement Checker',@Owner,null,getdate(),@billingid)
	end 

	if (@workflow = 'DisbRCOMakerBillingApproval')
	begin
		insert into WorkflowHistory_ProjectBilling 
		values ('Disbursement By Developer- RCO Maker',@arn,'Case Unpicked By RCO Maker',@Owner,null,getdate(),@billingid)
	end 

	delete from ddProject_MortgageAppTaskInstance 
	where workflow = @workflow
		and arn = @arn 
		and BillingRunningID = @billingid
end