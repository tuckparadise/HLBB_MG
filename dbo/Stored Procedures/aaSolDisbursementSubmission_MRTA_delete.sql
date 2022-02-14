CREATE   procedure [dbo].[aaSolDisbursementSubmission_MRTA_delete]
@arn nvarchar(max) =null , 
@runningid nvarchar(max) =null,
@PaymentReference nvarchar(max) =null,
@error nvarchar(max) =null output 
as
begin
	
	set @error = ''
	/*
	if (@PaymentReference ='MRTA/ MRTT - Excess Amount')
	begin
		set @error = 'Excess Amount record cannot be modified'
	end 
	*/
	if (@error= '')
	begin
		delete from aaSolDisbursementSubmission_MRTA
		where arn = @arn and runningid = @runningid
		
		/*
		--recalculate principle payment 
		delete from aaSolDisbursementSubmission_MRTA where arn = @arn and PaymentReference ='MRTA/ MRTT - Excess Amount'
		
		declare @TotalMRTAFinancingAmt money
		select @TotalMRTAFinancingAmt = MRTAFinancedAmount
		from SQLLOADS
			where arn = @arn  

		declare @TotalMRTAFinancingAmtForCurrentCase money
		select @TotalMRTAFinancingAmtForCurrentCase = sum(AmountDisburse)
		from aaSolDisbursementSubmission_MRTA
			where arn = @arn  
				and PaymentReference ='MRTA/ MRTT'

		
		if (@TotalMRTAFinancingAmt > @TotalMRTAFinancingAmtForCurrentCase)
		begin
			declare @principleamt money
			set @principleamt = @TotalMRTAFinancingAmt - @TotalMRTAFinancingAmtForCurrentCase

			select @runningid= max(runningid)+ 1
			from aaSolDisbursementSubmission_MRTA
			where arn = @arn  


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
			values (@arn, @runningid, null, 'HLBB/ HLISB', null,
			@ApplicantName, 'HLBB/ HLISB', 'LN / FIN ACC', @principleamt,
				'MRTA/ MRTT - Excess Amount', 'Excess Amt', getdate(),getdate())

		end 
		*/
	end 
	
end