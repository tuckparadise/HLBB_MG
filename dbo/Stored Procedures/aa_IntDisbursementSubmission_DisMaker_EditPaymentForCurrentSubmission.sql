CREATE            procedure [dbo].[aa_IntDisbursementSubmission_DisMaker_EditPaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@billingid bigint = null ,
@RunningIDForCurrentSubmission nvarchar(max) = null ,
@FacilityAccountNumber nvarchar(max) = null ,
@PaymentMode nvarchar(max) = null ,
@PayeeID nvarchar(max) = null ,
@PayeeName nvarchar(max) = null ,
@BeneficiaryBank nvarchar(max) = null ,
@BeneficiaryBankAccountNumber nvarchar(max) = null ,
@AmountDisburse nvarchar(max) = null ,
@PaymentReference nvarchar(max) = null ,
@PaymentDescription nvarchar(max) = null ,
@AccountFrom nvarchar(max) = null ,
@MakerEmail nvarchar(max) = null ,
@FLVMFLag bit = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''
	/*
	if (@PaymentReference <>'MDTA/ MRTT - Principal Pymt' and 
		@PaymentReference <>'Legal Fee - Principal Pymt' and 
		@PaymentReference <>'Valuation Fee - Principal Pymt')
	begin
		if(@BeneficiaryBankAccountNumber is not null or ltrim(rtrim(@BeneficiaryBankAccountNumber)) <> '' )
		begin
			if (isnumeric(@BeneficiaryBankAccountNumber) = 0)
			begin
				set @Error = 'Beneficiary Bank Account Number field must be a number'	
			end
		end 
	end
	*/

	
	if (@FLVMFLag = 0 and (@PaymentReference = 'Legal Fee' or 
		@PaymentReference = 'Legal Fee - Principal Pymt' or 
		@PaymentReference = 'MDTA/ MRTT' or 
		@PaymentReference = 'MDTA/ MRTT - Principal Pymt' or 
		@PaymentReference = 'Valuation Fee' or 
		@PaymentReference = 'Valuation Fee - Principal Pymt')
		)
	begin
		set @Error = 'Please manage FLMV items from FLMV tab'
	end 
	

	if (@PaymentReference = 'Others' and isnull(@FacilityAccountNumber,'') = '')
	begin
		set @Error = 'Please fill in Payment Reference Others field'
	end 


	if (@Error = '')
	begin
		if 
		(
			@PaymentMode is null or ltrim(rtrim(@PaymentMode)) = '' or
			--@PayeeID is null or ltrim(rtrim(@PayeeID)) = '' or
			@PayeeName is null or ltrim(rtrim(@PayeeName)) = '' or
			@BeneficiaryBank is null or ltrim(rtrim(@BeneficiaryBank)) = '' or
			@BeneficiaryBankAccountNumber is null or ltrim(rtrim(@BeneficiaryBankAccountNumber)) = '' or
			@AmountDisburse is null or ltrim(rtrim(@AmountDisburse)) = '' or
			@PaymentReference is null or ltrim(rtrim(@PaymentReference)) = '' or
			@PaymentDescription is null or ltrim(rtrim(@PaymentDescription)) = ''		--or
			--@AccountFrom is null or ltrim(rtrim(@AccountFrom)) = ''		
		)
		begin
			set @Error = 'Please fill up all mandatory fields'
		end 

		if (@Error = '')
		begin
			if exists 
			(
				select 1
				from aaIntDisbursementSubmission
				where DisbursementMakerSubmissionCompleted = 1
					and arn = @arn 		
					and BillingRunningID= @billingid
			)
			begin
				set @Error = 'The record is submitted. You are not allowed to add further payment until bank approve/reject the current submission'
			end 
		end 


		if (@Error = '')
		begin
		
			UPDATE [dbo].aaintDisbursementSubmission_DisMakerSubmissionPaymentDetail
			SET 
			  [FacilityAccountNumber] = @FacilityAccountNumber
			  ,[PaymentMode]= @PaymentMode
			  ,[PayeeID] = @PayeeID
			  ,[PayeeName] = @PayeeName
			  ,[BeneficiaryBank] = @BeneficiaryBank
			  ,[BeneficiaryBankAccountNumber] = @BeneficiaryBankAccountNumber
			  ,[AmountDisburse] = @AmountDisburse
			  ,[PaymentReference] = @PaymentReference
			  ,[PaymentDescription]= @PaymentDescription	 
			  ,[AccountFrom]= @AccountFrom	
			  ,[UpdatedDate] = getdate()
			  ,DisMakerEmail = @MakerEmail
			  ,DisMakerSubmissionDate= getdate()
			  
			where arn = @arn 
				and RunningIDForCurrentSubmission = @RunningIDForCurrentSubmission				
				and BillingRunningID = @billingid
		end
	end 
	


end