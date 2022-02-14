CREATE        procedure [dbo].[aaIntDisbursementSubmission_LegalFee_AddToCurrentPayment]
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

	/*
	if exists 
	(
		select 1 from vw_aaDisbursementPaymentInProgress
		where PaymentReference = 'Legal Fee'
			and arn = @arn 
		union 
		select 1 from vw_aaDisbursementPaymentHistory
		where PaymentReference = 'Legal Fee'
			and arn = @arn 		
	)
	begin
		set @error = 'Legal Fee had been added/ submitted '
	end 
	*/

	if (@error = '')
	begin
		
		delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn 
			and PaymentReference in ('Legal Fee','Legal Fee - Principal Pymt')
			and BillingRunningID= @billingid

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
			   ,AccountFrom
			   ,BillingRunningID
			   )
		values (@arn, @runningid, @PaymentMode, @PayeeID, @PayeeName, 
			@BeneficiaryBank, @BeneficiaryBankAccountNumber, @AmountDisburse,@PaymentReference,
			@PaymentDescription, getdate(), getdate(), @account1,@billingid)

		if (isnull(@PrincipleAmount,0) >0)
		begin
			select @runningid = max(RunningIDForCurrentSubmission) + 1
			from aaintDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
				and BillingRunningID= @billingid
		
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
				--@BeneficiaryBank, 'LN / FIN ACC', @PrincipleAmount,'Legal Fee - Principal Pymt',
				--@PaymentDescription, getdate(), getdate(), @account1,@billingid)
			--20210405- default payment mode to HLBB and bank to   HLBB/ HLISB
			values (@arn, @runningid, 'HLBB', @PayeeID, @ApplicantName, 
				'HLBB/ HLISB', 'LN / FIN ACC', @PrincipleAmount,'Legal Fee - Principal Pymt',
				'N/A', getdate(), getdate(), @account1,@billingid)

		end 
	end 



end