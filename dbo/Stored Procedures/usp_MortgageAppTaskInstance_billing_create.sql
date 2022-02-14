CREATE     procedure [dbo].[usp_MortgageAppTaskInstance_billing_create]
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
		from MortgageAppTaskInstance_billing 
		where workflow = @workflow
			and arn = @arn
			and BillingRunningID = @billingid
	)
	begin
		set @Error = 'Task existed'
		
	end 
	
	/*
	if (@workflow = 'DisbDUCheckerBillingApproval')
	begin
		if exists 
		(
			select 1
			from aaIntDisbursementSubmission
			where arn = @arn
				and BillingRunningID = @billingid
				and DisbursementMakerEmailAddress = @TaskOwner
		)
		begin
			set @Error = 'Disbursment Checker and Disbursment Maker cannot be the same person'
		end 
	end 
	*/
	if (@Error = '')
	begin
		insert into MortgageAppTaskInstance_billing
		values (@workflow, @arn, @TaskOwner, getdate(), getdate(), @TaskOwner, @TaskOwner, @billingid)

		if (@workflow = 'DisbDUMakerBillingApproval')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Accepted By Disbursement Maker',@TaskOwner,null,getdate(), @billingid)
		end 

		if (@workflow = 'DisbDUCheckerBillingApproval')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Accepted By Disbursement Checker',@TaskOwner,null,getdate(), @billingid)
		end 

		if (@workflow = 'DisbRCOMakerBillingApproval')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Accepted By RCO Maker',@TaskOwner,null,getdate(), @billingid)
		end 

		if (@workflow = 'DisbRCOCheckerBillingApproval')
		begin
			insert into WorkflowHistory_Billing
			values ('Progressive Billing',@arn,'Case Accepted By RCO Checker',@TaskOwner,null,getdate(), @billingid)
		end 

		/*
		-- start look for other billing for the arn and assign the cases to him/her (aaIntDisbursementSubmission)
		if exists
		(
			select 1
			from aaIntDisbursementSubmission
			where DisbursementMakerSubmissionCompleted = 0
		)
		begin
			declare  @TEMParn nvarchar(max),  @TEMPBillingID bigint
			DECLARE cursor_aaIntDisbursementSubmission CURSOR
			FOR SELECT arn ,BillingRunningID 
				FROM aaIntDisbursementSubmission
				where DisbursementMakerSubmissionCompleted = 0

			OPEN cursor_aaIntDisbursementSubmission;

			FETCH NEXT FROM cursor_aaIntDisbursementSubmission INTO 
				@TEMParn, 
				@TEMPBillingID				
				;

			WHILE @@FETCH_STATUS = 0
			BEGIN											
				--start locate last billing dis maker and assign to him/her. 
				declare @LastDisMaker nvarchar(max)

				select top 1 @LastDisMaker= taskowner 
				from [MortgageAppTaskInstance_billing]
				where workflow = 'DisbDUMakerBillingApproval'
					and arn = @TEMParn 
				order by updateddate desc 

				if (isnull(@LastDisMaker,'') <> '')
				begin
	
					insert into MortgageAppTaskInstance_billing
					values ('DisbDUMakerBillingApproval', @TEMParn, @LastDisMaker, getdate(), getdate(), @LastDisMaker, @LastDisMaker, @TEMPBillingID)

					insert into WorkflowHistory_Billing
					values ('Progressive Billing',@TEMParn,'Case Accepted By Disbursement Maker',@LastDisMaker,null,getdate(), @TEMPBillingID)
				end 		
				else
				begin
					--start locate last billing dis maker from logs and assign to him/her.  
					declare @LastDisMakerFromLog nvarchar(max)

					select top 1 @LastDisMakerFromLog= taskowner 
					from [MortgageAppTaskInstance_Billing_logs]
					where workflow = 'DisbDUMakerBillingApproval'
						and Completed = 1
						and arn = @TEMParn 
					order by updateddate desc

					if (isnull(@LastDisMakerFromLog,'') <> '')
					begin
						insert into MortgageAppTaskInstance_billing
						values ('DisbDUMakerBillingApproval', @TEMParn, @LastDisMakerFromLog, getdate(), getdate(), @LastDisMakerFromLog, @LastDisMakerFromLog, @TEMPBillingID)

						insert into WorkflowHistory_Billing
						values ('Progressive Billing',@TEMParn,'Case Accepted By Disbursement Maker',@LastDisMakerFromLog,null,getdate(), @TEMPBillingID)
					end 

					--end locate last billing dis maker from logs and assign to him/her. 
				end 
				--end locate last billing dis maker and assign to him/her. 


								
				FETCH NEXT FROM cursor_aaIntDisbursementSubmission INTO 
					@TEMParn, 
					@TEMPBillingID					
			END;

			CLOSE cursor_aaIntDisbursementSubmission;

			DEALLOCATE cursor_aaIntDisbursementSubmission;		
		end
		-- end look for other billing for the arn and assign the cases to him/her
		*/
	end 
end