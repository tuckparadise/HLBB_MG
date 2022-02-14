CREATE       procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_delete]
@arn nvarchar(max) =null , 
@billingid bigint =null , 
@runningid nvarchar(max) =null,
@PaymentReference nvarchar(max) =null,
@error nvarchar(max) =null output 
as
begin
	
	set @error = ''

	if (@PaymentReference ='MRTA/ MRTT - Excess Amount')
	begin
		set @error = 'Excess Amount record cannot be modified'
	end 
	
	if (@error= '')
	begin
		delete from ddProjectDisbursementSubmission_DisMaker_MRTA
		where arn = @arn 
			and runningid = @runningid
			and BillingRunningID = @billingid
		
		/*
		--recalculate principle payment 
		delete from aaIntDisbursementSubmission_MRTA 
		where arn = @arn 
			and PaymentReference ='MRTA/ MRTT - Excess Amount'
			and BillingRunningID = @billingid

		declare @TotalMRTAFinancingAmt money
		select @TotalMRTAFinancingAmt = MRTAFinancedAmount
		from SQLLOADS
			where arn = @arn  

		declare @TotalMRTAFinancingAmtForCurrentCase money
		select @TotalMRTAFinancingAmtForCurrentCase = sum(AmountDisburse)
		from aaIntDisbursementSubmission_MRTA
			where arn = @arn  
				and PaymentReference ='MRTA/ MRTT'
				and BillingRunningID = @billingid

		
		if (@TotalMRTAFinancingAmt > @TotalMRTAFinancingAmtForCurrentCase)
		begin
			declare @principleamt money
			set @principleamt = @TotalMRTAFinancingAmt - @TotalMRTAFinancingAmtForCurrentCase

			select @runningid= max(runningid)+ 1
			from aaIntDisbursementSubmission_MRTA
			where arn = @arn  
				and BillingRunningID = @billingid
				
			declare @ApplicantName nvarchar(max)

			select @ApplicantName = ApplicantName
			from SQLLOADS
			where arn = @arn 

			insert into aaIntDisbursementSubmission_MRTA
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
			values (@arn, @runningid, null, 'HLBB/ HLISB', null,
			@ApplicantName, 'HLBB/ HLISB', 'LN / FIN ACC', @principleamt,
				'MRTA/ MRTT - Excess Amount', 'Excess Amt', getdate(),getdate(),@billingid)

		end 
		*/
	end 
	
end