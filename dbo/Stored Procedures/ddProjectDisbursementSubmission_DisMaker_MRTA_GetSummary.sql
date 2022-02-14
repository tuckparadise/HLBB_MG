create       procedure [dbo].[ddProjectDisbursementSubmission_DisMaker_MRTA_GetSummary]
@arn nvarchar(max) =null , 
@billingid bigint =null , 
@error nvarchar(max) =null output ,
@AmountDisburse money =null output ,
@PrincipleAmount money =null output ,
@TotalMRTAFinancingAmt money=null output 
as
begin
	
	set @error = ''
	
	--declare @TotalMRTAFinancingAmt money
	select @TotalMRTAFinancingAmt = isnull(MRTAFinancedAmount,0)
	from SQLLOADS
		where arn = @arn  			

	declare @TotalMRTAFinancingAmtForCurrentCase money
	select @TotalMRTAFinancingAmtForCurrentCase = isnull(sum(AmountDisburse),0)
	from ddProjectDisbursementSubmission_DisMaker_MRTA
		where 
			arn = @arn  
			and BillingRunningID = @billingid
			--and
			-- PaymentReference in ('MRTA/ MRTT','MRTA/ MRTT - Excess Amount')
	
	declare @TotalMRTAFinancingAmtForHistory money
	select @TotalMRTAFinancingAmtForHistory = isnull(sum(AmountDisburse),0)
	from vw_aaDisbursementPaymentHistory
		where 
			arn = @arn  and
			--PaymentReference in ('MRTA/ MRTT','MRTA/ MRTT - Excess Amount')			
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 	

	set @AmountDisburse =  @TotalMRTAFinancingAmtForHistory
	/*
	-- amount disburse
	select @AmountDisburse = isnull(sum(AmountDisburse),0)
	from aaSolDisbursementSubmission_MRTA
	where arn = @arn
		and paymentreference = 'MRTA/ MRTT'
	*/
	set @PrincipleAmount = 0 

	if (@AmountDisburse <>0)
	begin
		/*
		select @PrincipleAmount= AmountDisburse
		from aaIntDisbursementSubmission_MRTA
		where arn = @arn
			and paymentreference = 'MRTA/ MRTT - Excess Amount'
		*/
		set @PrincipleAmount = @TotalMRTAFinancingAmtForCurrentCase - @AmountDisburse
	end 
end