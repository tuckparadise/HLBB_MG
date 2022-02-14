CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Main]
@ARN [nvarchar](100),
@FormSubmissionDate [date]  = NULL,
@DocumentExecutionSubmissionDate [date]  = NULL,
@Decision [nvarchar](max)  = NULL,
@DUMakerEmail [nvarchar](100)  = NULL,
@Status [nvarchar](100)  = NULL,
@DisbursementManner [nvarchar](100)  = NULL,
@FacilityCancelled bit  = NULL,
@CancellationDate date  = NULL,
@LandArea decimal(19, 2) = NULL,
@BuildUpArea decimal(19, 2)  = NULL,
@error nvarchar(max) = null output 
as 
begin
	
	set @error = ''

	if (@DUMakerEmail like 'K2:%')
	begin		
		set @DUMakerEmail = Stuff(@DUMakerEmail, 1, 3, '')
			
		--select @index = CHARINDEX('\', @UserName)

		--set @UserName = Stuff(@UserName, 1,@index, '')

	end 

	declare @currentowner nvarchar(max)
	select @currentowner = TaskOwner
	from MortgageAppTaskInstance
	where workflow = 'DPDUMakerValuerApproval'
		and arn = @arn 

	declare @ValuationStatus nvarchar(max)
	select @ValuationStatus = [Status] 
	from SQLValuerDPSubmission
	where arn = @arn 

	if (@currentowner <> @DUMakerEmail)
	begin
		set @error = 'You are not the current owner of this case. The current owner of the task is ' +@currentowner+ ''
	end 

	if (@error = '')
	begin
		update SQLLOADS
		set DisbursementManner = @DisbursementManner,
			--FacilityCancelled = @FacilityCancelled, 
			--CancellationDate = @CancellationDate,
			LandArea = @LandArea,
			BuildUpArea = @BuildUpArea		
		where arn = @arn 

		if (@Status= 'Resubmit-New' or @Status='Completed') 
		begin
			delete from [SQLDUMakerDP_ValuerSubmission_LoweredOMV]
			where arn = @arn 
		end 

		if (@Status= 'Resubmit-New')
		begin

			INSERT INTO [dbo].[SQLDUMakerDP_ValuerSubmission_LoweredOMV]
			(
				[ARN]
				,[FormSubmissionDate]
				,[DocumentExecutionSubmissionDate]
				,[Decision]
				,[DUMakerEmail]
				--,[Status]
				,[CreatedDate]
				,[UpdatedDate]
			)
			 VALUES
			(
				@ARN 
				,@FormSubmissionDate
				,@DocumentExecutionSubmissionDate
				,@Decision
				,@DUMakerEmail
				--,@Status
				,getdate()
				,getdate()
			)

			update l
			set 
				l.[ValuerCode] = v.[ValuerCode]
				,l.[ValuerReportAttachmentURL] = v.[ValuerReportAttachmentURL]
				,l.[ValuerReportAttachment] = v.[ValuerReportAttachment]
				,l.[ValuerReportAttachmentDate] = v.[ValuerReportAttachmentDate]
				,l.[VRInstructionDate] = v.[VRInstructionDate]
				,l.[ValuerReference] = v.[ValuerReference]
				,l.[PersonInChargeName] = v.[PersonInChargeName]
				,l.[VUpdateInfoStatus] = v.[VUpdateInfoStatus]
				,l.[VLowerOMVStatus] = v.[VLowerOMVStatus]
				,l.[VUpdateInfoStatusOthers] = v.[VUpdateInfoStatusOthers]
				,l.[VLowerOMVReasons] = v.[VLowerOMVReasons]
				,l.[DateOfValuation] = v.[DateOfValuation]
				,l.[MarketValue] = v.[MarketValue]
				,l.[FireInsuranceValue] = v.[FireInsuranceValue]
				,l.[InvoiceNumber] = v.[InvoiceNumber]
				,l.[ShortfallAmount] = v.[ShortfallAmount]
				,l.[Declaration] = v.[Declaration]
				,l.[Status] = v.[Status]
				,l.[ValuationFeeFinancedByBankFlag] = v.[ValuationFeeFinancedByBankFlag]
				,l.[OutputPDFID] = v.[OutputPDFID]
				,l.[ValuerCreatedDate] = v.[CreatedDate]
				,l.[ValuerUpdatedDate] = v.[UpdatedDate]
			  from [SQLDUMakerDP_ValuerSubmission_LoweredOMV] l
			  inner join SQLValuerDPSubmission v on v.arn = l.arn 
			  where l.arn = @arn 

			delete from SQLDUMakerDP_ValuerSubmission
			where arn = @arn 

			insert into MortgageAppTaskInstance_logs 
			select [workflow]
				,[arn]
				,[TaskOwner]
				,[CreatedDate]
				,getdate()
				,[CreatedUser]
				,[UpdatedUser]
				, 0
				, 1
			from MortgageAppTaskInstance
			where workflow = 'DPDUMakerValuerApproval'
			and arn = @arn 

			delete from MortgageAppTaskInstance
				where workflow = 'DPDUMakerValuerApproval'
					and arn = @arn 

			update SQLValuerDPSubmission
			set status = 'Resubmit-New'
				, completed = 0
				--,UpdatedDate = getdate()
			where arn = @arn 

			insert into WorkflowHistory
			values ('Valuation Report',@arn,'LowerOMV Approved',@DUMakerEmail,null,getdate())
		end 
		else
		begin 
		
			if not exists 
			(
				select 1
				from SQLDUMakerDP_ValuerSubmission
				where arn = @arn 
			)
			begin
				INSERT INTO [dbo].[SQLDUMakerDP_ValuerSubmission]
						   ([ARN]
						   ,[FormSubmissionDate]
						   ,[DocumentExecutionSubmissionDate]
						   ,[Decision]
						   ,[DUMakerEmail]
						   ,[Status]
						   ,[CreatedDate]
						   ,[UpdatedDate])
				values 
				(
					@ARN ,
					@FormSubmissionDate ,
					@DocumentExecutionSubmissionDate ,
					@Decision ,
					@DUMakerEmail,
					@Status,
					getdate(),
					getdate()
				)

				if (@Status='Completed')
				begin

					insert into MortgageAppTaskInstance_logs 
					select [workflow]
						,[arn]
						,[TaskOwner]
						,[CreatedDate]
						,getdate()
						,[CreatedUser]
						,[UpdatedUser]
						, 0
						, 1
					from MortgageAppTaskInstance
					where workflow = 'DPDUMakerValuerApproval'
					and arn = @arn 

					delete from MortgageAppTaskInstance
					where workflow = 'DPDUMakerValuerApproval'
						and arn = @arn

					if (@ValuationStatus = 'Submitted' or @ValuationStatus = 'Resubmitted')
					begin
						insert into WorkflowHistory
						values ('Valuation Report',@arn,'VR Approved',@DUMakerEmail,null,getdate())
					end 								

					if (@ValuationStatus = 'Cancelled')
					begin
						insert into WorkflowHistory
						values ('Valuation Report',@arn,'Cancellation Approved',@DUMakerEmail,null,getdate())
					end 
				end 
				 
			end 
			else
			begin
				update  [SQLDUMakerDP_ValuerSubmission]
				set 			
					[FormSubmissionDate] = @FormSubmissionDate
					,[DocumentExecutionSubmissionDate] = @DocumentExecutionSubmissionDate
					,[Decision] = @Decision 
					,[DUMakerEmail] = @DUMakerEmail 
					,[Status] = @Status			
					,[UpdatedDate] = getdate()
				where arn = @arn 

				if (@Status='Completed')
				begin

					insert into MortgageAppTaskInstance_logs 
					select [workflow]
						,[arn]
						,[TaskOwner]
						,[CreatedDate]
						,getdate()
						,[CreatedUser]
						,[UpdatedUser]
						, 0
						, 1
					from MortgageAppTaskInstance
					where workflow = 'DPDUMakerValuerApproval'
					and arn = @arn 

					delete from MortgageAppTaskInstance
					where workflow = 'DPDUMakerValuerApproval'
						and arn = @arn 

					if (@ValuationStatus = 'Submitted' or @ValuationStatus = 'Resubmitted')
					begin
						insert into WorkflowHistory
						values ('Valuation Report',@arn,'VR Approved',@DUMakerEmail,null,getdate())
					end 								

					if (@ValuationStatus = 'Cancelled')
					begin
						insert into WorkflowHistory
						values ('Valuation Report',@arn,'Cancellation Approved',@DUMakerEmail,null,getdate())
					end 
				end 				
			end 
		end 

		declare @LF_PayeeName nvarchar(max)
			,@LF_BilledAmount nvarchar(max)
			,@LF_AccountNumber nvarchar(max)
			,@LF_Bank nvarchar(max)
			,@LF_PaymentDescription nvarchar(max)
			,@LF_PaymentMode nvarchar(max)

		if ( @Status='Completed')
		begin
			-- move valuation fee to payment detail table
			-- prevent duplicate entry 
			if not exists 
			(
				select 1
				from SQLValuerDPSubmission_ValuationFee
				where 
					--[PaymentReference] = 'Valuation Fee'
					--and 
					arn = @arn 
					/*
				union 
				select 1
				from vw_aaDisbursementPaymentHistory
				where [PaymentReference] = 'Valuation Fee'
					and arn = @arn 
					*/
			)
			begin
				-- proceed only if valuation report is approved 
				if exists 
				(
					select 1 from [SQLDUMakerDP_ValuerSubmission]
					where status = 'Completed'
					and arn = @arn 
				)
				begin
					declare @Valuation_amt money
					declare @RunningIDForCurrentSubmission bigint 
					declare @LastMaxRunningIDForCurrentSubmission bigint 

					select @Valuation_amt = LF_BilledAmount
					from SQLValuerDPSubmission
					where arn = @arn 

					if (@Valuation_amt >0 )
					begin
						
						/*
						if not exists 
						(
							select 1
							from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
							where arn = @arn 
						)
						begin
							set @RunningIDForCurrentSubmission = 1
						end 
						else
						begin				
							select @LastMaxRunningIDForCurrentSubmission = max(RunningIDForCurrentSubmission)
							from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
							where arn = @arn 

							set @RunningIDForCurrentSubmission = @LastMaxRunningIDForCurrentSubmission + 1
						end 
						*/
						declare @valuer_name nvarchar(max)

						select @valuer_name = [ValuerName] 
							from sqlloads 
							where arn = @arn 

						select @LF_PayeeName = [LF_PayeeName]
							,@LF_BilledAmount = [LF_BilledAmount]
							,@LF_AccountNumber = [LF_AccountNumber]
							,@LF_Bank = [LF_Bank]
							,@LF_PaymentDescription = [LF_PaymentDescription]
							,@LF_PaymentMode = [LF_PaymentMode]
						from [SQLValuerDPSubmission]
						where arn = @arn 
						
						delete from SQLValuerDPSubmission_ValuationFee where arn = @arn 

						INSERT INTO [dbo].SQLValuerDPSubmission_ValuationFee
						(
							[arn]							
							,[FacilityAccountNumber]
							,[PaymentMode]
							,[PayeeID]
							,[PayeeName]
							,[BeneficiaryBank]
							,[BeneficiaryBankAccountNumber]
							,[AmountDisburse]
							,[PaymentReference]
							,[PaymentDescription]
							,[CreatedDate]
							,[UpdatedDate]
						)
						VALUES 
						(
							@arn,							
							null,
							@LF_PaymentMode,
							null,
							@LF_PayeeName,
							@LF_Bank,
							@LF_AccountNumber,
							@LF_BilledAmount,
							'Valuation Fee', 
							@LF_PaymentDescription,
							getdate(),
							getdate()
						)
						/*
						INSERT INTO [dbo].aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
						(
							[arn]
							,RunningIDForCurrentSubmission
							,[FacilityAccountNumber]
							,[PaymentMode]
							,[PayeeID]
							,[PayeeName]
							,[BeneficiaryBank]
							,[BeneficiaryBankAccountNumber]
							,[AmountDisburse]
							,[PaymentReference]
							,[PaymentDescription]
							,[CreatedDate]
							,[UpdatedDate]
						)
						VALUES 
						(
							@arn,
							@RunningIDForCurrentSubmission,
							null,
							@LF_PaymentMode,
							null,
							@LF_PayeeName,
							@LF_Bank,
							@LF_AccountNumber,
							@LF_BilledAmount,
							'Valuation Fee', 
							@LF_PaymentDescription,
							getdate(),
							getdate()
						)
						*/
						
						/*
						-- get balance valuation fee
						declare @ValuationFeesFinancedAmount money 
						declare @ValuationFeesFinancedAmountBalance money 
						select @ValuationFeesFinancedAmount= ValuationFeesFinancedAmount
						from sqlloads 
						where arn = @arn 

						if (@ValuationFeesFinancedAmount>0)
						begin
							set @ValuationFeesFinancedAmountBalance = @ValuationFeesFinancedAmount - @LF_BilledAmount

							if (@ValuationFeesFinancedAmountBalance>0)
							begin
								if not exists 
								(
									select 1
									from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
									where arn = @arn 
								)
								begin
									set @RunningIDForCurrentSubmission = 1
								end 
								else
								begin					 
									select @LastMaxRunningIDForCurrentSubmission = max(RunningIDForCurrentSubmission)
									from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
									where arn = @arn 

									set @RunningIDForCurrentSubmission = @LastMaxRunningIDForCurrentSubmission + 1
								end 

								declare @CustomerName nvarchar(max)
								select @CustomerName = [CustomerName] 
								from sqlloads 
								where arn = @arn 

								INSERT INTO [dbo].aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
								(
									[arn]
									,RunningIDForCurrentSubmission
									,[FacilityAccountNumber]
									,[PaymentMode]
									,[PayeeID]
									,[PayeeName]
									,[BeneficiaryBank]
									,[BeneficiaryBankAccountNumber]
									,[AmountDisburse]
									,[PaymentReference]
									,[PaymentDescription]
									,[CreatedDate]
									,[UpdatedDate]
								)
								VALUES 
								(
									@arn,
									@RunningIDForCurrentSubmission,
									null,
									null,
									null,
									@CustomerName,
									null,
									null,
									@ValuationFeesFinancedAmountBalance,
									'Valuation Fee', 
									'Principal Payment',
									getdate(),
									getdate()
								)
							end 
						end 
						*/
					end 
				end 				
			end
		end 
	end 
	
end