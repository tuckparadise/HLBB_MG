CREATE         procedure [dbo].[aa_SolDisbursementSubmission_AddPaymentForCurrentSubmission]
@arn nvarchar(max) = null ,
@FacilityAccountNumber nvarchar(max) = null ,
@PaymentMode nvarchar(max) = null ,
@PayeeID nvarchar(max) = null ,
@PayeeName nvarchar(max) = null ,
@BeneficiaryBank nvarchar(max) = null ,
@BeneficiaryBankAccountNumber nvarchar(max) = null ,
@AmountDisburse nvarchar(max) = null ,
@PaymentReference nvarchar(max) = null ,
@PaymentDescription nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin
	
	set @Error = ''

	/* 20210327- remove integer checking 
	if(@BeneficiaryBankAccountNumber is not null or ltrim(rtrim(@BeneficiaryBankAccountNumber)) <> '' )
	begin
		if (isnumeric(@BeneficiaryBankAccountNumber) = 0)
		begin
			set @Error = 'Beneficiary Bank Account Number field must be a number'	
		end
	end 
	*/

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
			@PaymentDescription is null or ltrim(rtrim(@PaymentDescription)) = ''		
		)
		begin
			set @Error = 'Please fill up all mandatory fields'
		end 

		if (@Error = '')
		begin
			if exists 
			(
				select 1
				from aaSolDisbursementSubmission
				where SolicitorSubmissionCompleted = 1
					and arn = @arn 
			)
			begin
				set @Error = 'The record is submitted. You are not allowed to add further payment until bank approve/reject the current submission'
			end 
		end 


		if (@Error = '')
		begin
			declare @RunningIDForCurrentSubmission int 
			if not exists 
			(
				select 1
				from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 
			)
			begin
				set @RunningIDForCurrentSubmission = 1
			end 
			else
			begin
				declare @LastMaxRunningIDForCurrentSubmission int 
				select @LastMaxRunningIDForCurrentSubmission = max(RunningIDForCurrentSubmission)
				from aaSolDisbursementSubmission_PaymentDetail
				where arn = @arn 

				set @RunningIDForCurrentSubmission = @LastMaxRunningIDForCurrentSubmission + 1
			end 
		
			insert into aaSolDisbursementSubmission_PaymentDetail
			values (@arn , @RunningIDForCurrentSubmission,@FacilityAccountNumber ,@PaymentMode  ,@PayeeID  ,@PayeeName,@BeneficiaryBank  ,@BeneficiaryBankAccountNumber  ,@AmountDisburse  ,@PaymentReference  ,@PaymentDescription, getdate() , getdate())
		end
	end 
	


end