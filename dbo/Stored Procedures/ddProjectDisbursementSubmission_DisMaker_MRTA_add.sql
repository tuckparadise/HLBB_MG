CREATE       procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_add]
@arn nvarchar(max) =null , 
@billingid bigint =null , 
@FacilityAccountNumber nvarchar(max) =null , 
@PaymentMode nvarchar(max) =null , 
@PayeeID nvarchar(max) =null , 
@PayeeName nvarchar(max) =null , 
@BeneficiaryBank nvarchar(max) =null , 
@BeneficiaryBankAccountNumber nvarchar(max) =null , 
@AmountDisburse money =null , 
@PaymentReference nvarchar(max) =null , 
@PaymentDescription nvarchar(max) =null , 
@error nvarchar(max) =null output 
as
begin
	set @error = ''

	if (@PaymentReference = 'MDTA/ MRTT' and (isnull(@AmountDisburse,0) = 0 or isnull(@PaymentDescription,'') = ''))
	begin
		set @error = 'Amount Disbursed and Policy Number cannot be blank'
	end 

	if (@PaymentReference = 'MDTA/ MRTT - Principal Pymt' and isnull(@AmountDisburse,0) = 0 )
	begin
		set @error = 'Amount Disbursed cannot be blank'
	end 


	/*
	declare @TotalMRTAFinancingAmt money
	select @TotalMRTAFinancingAmt = MRTAFinancedAmount
	from SQLLOADS
		where arn = @arn  

	declare @TotalMRTAFinancingAmtForCurrentCase money
	select @TotalMRTAFinancingAmtForCurrentCase = sum(AmountDisburse)
	from aaSolDisbursementSubmission_MRTA
		where 
			arn = @arn  and
			 PaymentReference ='MRTA/ MRTT'
	
	set @TotalMRTAFinancingAmtForCurrentCase = isnull(@TotalMRTAFinancingAmtForCurrentCase,0) + @AmountDisburse

	if (@TotalMRTAFinancingAmtForCurrentCase > @TotalMRTAFinancingAmt)
	begin
		set @error = 'Total Disbursed Amount cannot more than MRTA financed amount'
	end 
	*/

	if (@error ='')
	begin
		
		if (@PaymentReference = 'MDTA/ MRTT - Principal Pymt')
		begin
			declare @ApplicantName nvarchar(max)

			select @ApplicantName = ApplicantName
			from SQLLOADS
			where arn = @arn 	

			set @BeneficiaryBankAccountNumber = 'LN / FIN ACC'
			set @PayeeName = @ApplicantName
			set @PaymentDescription = 'MDTA/ MRTT - Principal Pymt'
		end 
		
		declare @runningid bigint 

		set @runningid= 1

		if exists
		(
			select 1 from ddProjectDisbursementSubmission_DisMaker_MRTA
			where arn = @arn 
				and BillingRunningID = @billingid
		)
		begin
			select @runningid= max(runningid)+ 1
			from ddProjectDisbursementSubmission_DisMaker_MRTA
			where arn = @arn  
				and BillingRunningID = @billingid
		end 

		insert into ddProjectDisbursementSubmission_DisMaker_MRTA
			([arn]
           ,[runningid]
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
		   ,BillingRunningID
		   )
		   values (@arn, @runningid, @FacilityAccountNumber, @PaymentMode, @PayeeID,
			@PayeeName, @BeneficiaryBank, @BeneficiaryBankAccountNumber, @AmountDisburse,
			@PaymentReference, @PaymentDescription, getdate(),getdate(), @billingid)

			/*
			--recalculate principle payment 
			delete from aaSolDisbursementSubmission_MRTA where arn = @arn and PaymentReference ='MRTA/ MRTT - Excess Amount'

			if (@TotalMRTAFinancingAmt > @TotalMRTAFinancingAmtForCurrentCase)
			begin
				declare @principleamt money
				set @principleamt = @TotalMRTAFinancingAmt - @TotalMRTAFinancingAmtForCurrentCase

				set @runningid = @runningid + 1

				declare @ApplicantName nvarchar(max)

				select @ApplicantName = ApplicantName
				from SQLLOADS
				where arn = @arn 

				insert into aaSolDisbursementSubmission_MRTA
				([arn]
				,[runningid]
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
				,[UpdatedDate])
				values (@arn, @runningid, null, 'HLBB', null,
			@ApplicantName, 'HLBB/ HLISB', 'LN / FIN ACC', @principleamt,
				'MRTA/ MRTT - Excess Amount', 'Excess Amt', getdate(),getdate())

			end 
			*/
	end 

end