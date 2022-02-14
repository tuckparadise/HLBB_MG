CREATE   procedure [dbo].[usp_MortgageAppTaskInstance_create]
@workflow nvarchar(max) = null ,
@arn nvarchar(max) = null ,
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
		from MortgageAppTaskInstance
		where workflow = @workflow
			and arn = @arn
	)
	begin
		set @Error = 'Task existed'
		
	end 
	
	
	--to be enabled after testing completed
	/*
	if (@workflow = 'DisbDUCheckerSolicitorApproval')
	begin
		if exists 
		(
			select 1
			from aaSolDisbursementSubmission_DisMakerSubmission
			where arn = @arn
				and DisbursementMakerEmailAddress = @TaskOwner
		)
		begin
			set @Error = 'Disbursment Checker and Disbursment Maker cannot be the same person'
		end 
	end 
	*/

	if (@Error = '')
	begin
		insert into MortgageAppTaskInstance
		values (@workflow, @arn, @TaskOwner, getdate(), getdate(), @TaskOwner, @TaskOwner)

		if (@workflow = 'DPDUMakerValuerApproval')
		begin
			insert into WorkflowHistory
			values ('Valuation Report',@arn,'Case Accepted',@TaskOwner,null,getdate())
		end 
		if (@workflow = 'DPDUMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Documentation',@arn,'Case Accepted',@TaskOwner,null,getdate())
		end 
		if (@workflow = 'DisbDUMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Maker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbDUCheckerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By Disbursement Checker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbRCOMakerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By RCO Maker',@TaskOwner,null,getdate())
		end 

		if (@workflow = 'DisbRCOCheckerSolicitorApproval')
		begin
			insert into WorkflowHistory
			values ('Disbursement By Solicitor',@arn,'Case Accepted By RCO Checker',@TaskOwner,null,getdate())
		end 
	end 
end