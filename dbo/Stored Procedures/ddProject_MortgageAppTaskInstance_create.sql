CREATE       procedure [dbo].[ddProject_MortgageAppTaskInstance_create]
@workflow nvarchar(max) = null ,
@arn nvarchar(max) = null ,
@billingid bigint = null ,
@TaskOwner nvarchar(max) = null ,
@Error nvarchar(max) = null output  
as
begin
	
	set @Error = ''

	if (@TaskOwner like 'K2:%')
	begin		
		set @TaskOwner = Stuff(@TaskOwner, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	if exists
	(
		select 1
		from ddProject_MortgageAppTaskInstance 
		where workflow = @workflow
			and arn = @arn
			and BillingRunningID = @billingid
	)
	begin
		set @Error = 'Task existed'
		
	end 
	
	if (@workflow = 'ProjectSubmission_DisChecker')
	begin
		if exists 
		(
			select 1
			from ddProjectDisbursementSubmission_DisMaker
			where arn = @arn
				and BillingRunningID = @billingid
				and DisbursementMakerEmailAddress = @TaskOwner
		)
		begin
			set @Error = 'Disbursment Checker and Disbursment Maker cannot be the same person'
		end 
	end 

	if (@Error = '')
	begin
		if (@workflow = 'ProjectSubmission_DisMaker') set @workflow = 'DisbDUMakerBillingApproval'
		if (@workflow = 'ProjectSubmission_DisChecker') set @workflow = 'DisbDUCheckerBillingApproval'
		if (@workflow = 'ProjectSubmission_RCOMaker') set @workflow = 'DisbRCOMakerBillingApproval'		

		insert into ddProject_MortgageAppTaskInstance		
		values (@workflow, @arn, @TaskOwner, getdate(), getdate(), @TaskOwner, @TaskOwner, @billingid)

		--start developer portal 

		if (@workflow = 'DisbDUMakerBillingApproval')
		begin
			insert into WorkflowHistory_ProjectBilling
			values ('Developer Submission',@arn,'Case Accepted By Disbursement Maker',@TaskOwner,null,getdate(), @billingid)
		end 

		if (@workflow = 'DisbDUCheckerBillingApproval')
		begin
			insert into WorkflowHistory_ProjectBilling
			values ('Developer Submission',@arn,'Case Accepted By Disbursement Checker',@TaskOwner,null,getdate(), @billingid)
		end 

		if (@workflow = 'DisbRCOMakerBillingApproval')
		begin
			insert into WorkflowHistory_ProjectBilling
			values ('Developer Submission',@arn,'Case Accepted By RCO Maker',@TaskOwner,null,getdate(), @billingid)
		end 
		-- end developer portal 

	end 
end