CREATE       procedure [dbo].[SQLIntValuerDPSubmission_ValuationFee_AddToCurrentPayment]
@arn nvarchar(max) = null ,
@billingid bigint = null ,
@FacilityAccountNumber nvarchar(max) = null ,
@PaymentMode nvarchar(max) = null ,
@PayeeID nvarchar(max) = null ,
@PayeeName nvarchar(max) = null ,
@BeneficiaryBank nvarchar(max) = null ,
@BeneficiaryBankAccountNumber nvarchar(max) = null ,
@AmountDisburse money = null ,
@PaymentReference nvarchar(max) = null ,
@PaymentDescription nvarchar(max) = null ,
@PrincipleAmount money = null ,
@error nvarchar(max) = null output 
as
begin
	
	set @error = ''

	declare @account1 nvarchar(max) 
	select @account1 = account1
	from aaFacilityAccountMaintenance
	where arn = @arn 

	if (isnull(@PayeeName,'') ='') set @error = @error + 'Payee Name cannot be blank <br>'
	if (isnull(@BeneficiaryBankAccountNumber,'') ='') set @error = @error + 'Account Number cannot be blank <br>'
	--if (isnull(@AmountDisburse,'') ='') set @error = @error + 'Billed Amount cannot be blank <br>'
	if (@AmountDisburse is null) set @error = @error + 'Billed Amount cannot be blank <br>'

	--set @error = @error + @AmountDisburse
	/*
	if exists 
	(
		select 1 from vw_aaDisbursementPaymentInProgress
		where PaymentReference = 'Valuation Fee'
			and arn = @arn 
		union 
		select 1 from vw_aaDisbursementPaymentInProgress
		where PaymentReference = 'Valuation Fee'
			and arn = @arn 		
	)
	begin
		set @error = 'Valuation Fee had been added/ submitted'
	end 
	*/

	if (@error = '')
	begin
		delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn 
			and BillingRunningID = @billingid
			and PaymentReference in ('Valuation Fee','Valuation Fee - Principal Pymt')

		declare @runningid bigint 	

		set @runningid = 1

		if exists 
		(
			select 1
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
				and BillingRunningID= @billingid
		)
		begin
			select @runningid = max(RunningIDForCurrentSubmission) + 1
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 	
				and BillingRunningID= @billingid
		end 

		insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		 ([arn]
			   ,[RunningIDForCurrentSubmission]           
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
				, AccountFrom
				,BillingRunningID
			   )
		values (@arn, @runningid, @PaymentMode, @PayeeID, @PayeeName, 
			@BeneficiaryBank, @BeneficiaryBankAccountNumber, @AmountDisburse,@PaymentReference,
			@PaymentDescription, getdate(), getdate(),@account1,@billingid)

		if (isnull(@PrincipleAmount,0) >0)
		begin
			select @runningid = max(RunningIDForCurrentSubmission) + 1
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
		
			declare @ApplicantName nvarchar(max)

			select @ApplicantName = ApplicantName
			from SQLLOADS
			where arn = @arn 

		insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		 ([arn]
			   ,[RunningIDForCurrentSubmission]           
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
			   ,AccountFrom
			   ,BillingRunningID
			   )
		--values (@arn, @runningid, @PaymentMode, @PayeeID, @ApplicantName, 
			--@BeneficiaryBank, 'LN / FIN ACC', @PrincipleAmount,'Valuation Fee - Principal Pymt',
			--@PaymentDescription, getdate(), getdate(),@account1,@billingid)
			--20210405- default payment mode to HLBB and bank to   HLBB/ HLISB
		values (@arn, @runningid, 'HLBB', @PayeeID, @ApplicantName, 
			'HLBB/ HLISB', 'LN / FIN ACC', @PrincipleAmount,'Valuation Fee - Principal Pymt',
			'N/A', getdate(), getdate(),@account1,@billingid)

		end 
	end 

	
end