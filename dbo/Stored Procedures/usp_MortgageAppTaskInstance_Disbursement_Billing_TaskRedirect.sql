CREATE     procedure [dbo].[usp_MortgageAppTaskInstance_Disbursement_Billing_TaskRedirect]
@role nvarchar(max) = null,
@arn nvarchar(max) = null,
@billingid bigint = null,
@NewOwner nvarchar(max) = null,
@Operator nvarchar(max) = null,
@SubmissionFrom nvarchar(max) = null,
@Error nvarchar(max) = null output
as
begin

	set @Error = ''

	if (@Operator like 'K2:%')
	begin		
		set @Operator = Stuff(@Operator, 1, 3, '')					

	end 

	if (@arn is null or ltrim(rtrim(@arn)) ='' )
	begin
		set @Error = @Error + 'Please select CRA<br>'
	end 

	if (@billingid is null or ltrim(rtrim(@billingid)) ='' )
	begin
		set @Error = @Error + 'Please select Billing ID<br>'
	end 

	if (@NewOwner is null or ltrim(rtrim(@NewOwner)) ='' )
	begin
		set @Error = @Error + 'Please select New Owner<br>'
	end 

	declare @workflow nvarchar(max)

	if (@role = '1Disbursement Maker') set @workflow = 'DisbDUMakerBillingApproval'
	if (@role = '2Disbursement Checker') set @workflow = 'DisbDUCheckerBillingApproval'
	if (@role = '3RCO Maker') set @workflow = 'DisbRCOMakerBillingApproval'
	if (@role = '4RCO Checker') set @workflow = 'DisbRCOCheckerBillingApproval'

	if (@Error = '')
	begin
		if (@SubmissionFrom = 'EDMS')
		BEGIN
			if exists
			(
				select 1
				from [MortgageAppTaskInstance_billing]
				where workflow = @workflow
					and arn = @arn 
					and BillingRunningID = @billingid
			)
			begin
				insert into MortgageAppTaskInstance_Billing_logs
				SELECT [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,@Operator 
					,null
					,null
					,@billingid
				from [MortgageAppTaskInstance_billing]
				where workflow = @workflow
					and arn = @arn 
					and BillingRunningID = @billingid

				update [MortgageAppTaskInstance_billing]
				set [TaskOwner] = @NewOwner,
					UpdatedUser = @Operator,
					UpdatedDate = getdate()
				where workflow = @workflow
					and arn = @arn 
					and BillingRunningID = @billingid

				if (@workflow = 'DisbDUMakerBillingApproval')
				begin
					insert into WorkflowHistory_billing
					values ('Progressive Billing- Disbursement Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 
			
				if (@workflow = 'DisbDUCheckerBillingApproval')
				begin
					insert into WorkflowHistory_billing
					values ('Progressive Billing- Disbursement Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 

				if (@workflow = 'DisbRCOMakerBillingApproval')
				begin
					insert into WorkflowHistory_billing
					values ('Progressive Billing- RCO Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 

				if (@workflow = 'DisbRCOCheckerBillingApproval')
				begin
					insert into WorkflowHistory_billing
					values ('Progressive Billing- RCO Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 
			end 
			else
			begin
				set @Error = 'Case does not exists'
			end 
		END 

		if (@SubmissionFrom = 'Developer')
		BEGIN
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
				SELECT [workflow]
					,[arn]
					,[TaskOwner]
					,[CreatedDate]
					,getdate()
					,[CreatedUser]
					,@Operator 
					,null
					,null
					,@billingid
				from ddProject_MortgageAppTaskInstance
				where workflow = @workflow
					and arn = @arn 
					and BillingRunningID = @billingid

				update ddProject_MortgageAppTaskInstance
				set [TaskOwner] = @NewOwner,
					UpdatedUser = @Operator,
					UpdatedDate = getdate()
				where workflow = @workflow
					and arn = @arn 
					and BillingRunningID = @billingid

				if (@workflow = 'DisbDUMakerBillingApproval')
				begin
					insert into WorkflowHistory_ProjectBilling 
					values ('Disbursement By Developer- Disbursement Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 
			
				if (@workflow = 'DisbDUCheckerBillingApproval')
				begin
					insert into WorkflowHistory_ProjectBilling 
					values ('Disbursement By Developer- Disbursement Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 

				if (@workflow = 'DisbRCOMakerBillingApproval')
				begin
					insert into WorkflowHistory_ProjectBilling 
					values ('Disbursement By Developer- RCO Maker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 

				if (@workflow = 'DisbRCOCheckerBillingApproval')
				begin
					insert into WorkflowHistory_ProjectBilling 
					values ('Disbursement By Developer- RCO Checker',@arn,'Case Reassigned',@NewOwner,@Operator,getdate(),@billingid)
				end 
			end 
			else
			begin
				set @Error = 'Case does not exists'
			end 
		END 
	end 

end