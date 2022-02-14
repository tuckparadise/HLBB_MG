CREATE   procedure [dbo].[aaSolDisbursementSubmission_MRTA_ExportToCurrentPayment]
@arn nvarchar(max) =null , 
@error nvarchar(max) =null output 
as
begin
	
	set @error = ''

	declare @runningid bigint 	

	set @runningid = 0

	
	declare @account1 nvarchar(max) 
	select @account1 = account1
	from aaFacilityAccountMaintenance
	where arn = @arn 

	/*
	if exists 
	(
		/*
		select 1 from vw_aaDisbursementPaymentInProgress
		where PaymentReference = 'MRTA/ MRTT'
			and arn = @arn 
		union 
		*/
		select 1 from vw_aaDisbursementPaymentHistory
		where PaymentReference = 'MRTA/ MRTT'
			and arn = @arn 		
	)
	begin
		set @error = 'MRTA/ MRTT had been added/ submitted'
	end 
	*/
	
	/*
	--check mrta limit 
	declare @TotalMRTAFinancingAmt money
	select @TotalMRTAFinancingAmt = MRTAFinancedAmount
	from SQLLOADS
		where arn = @arn  

	declare @TotalMRTAFinancingAmtForCurrentCase money
	select @TotalMRTAFinancingAmtForCurrentCase = sum(AmountDisburse)
	from aaSolDisbursementSubmission_MRTA
		where 
			arn = @arn  
			--and
			-- PaymentReference in ('MRTA/ MRTT','MRTA/ MRTT - Excess Amount')
	
	declare @TotalMRTAFinancingAmtForHistory money
	select @TotalMRTAFinancingAmtForHistory = sum(AmountDisburse)
	from vw_aaDisbursementPaymentHistory
		where 
			arn = @arn  and
			PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt')
	
	
	if (@TotalMRTAFinancingAmt > @TotalMRTAFinancingAmtForHistory +@TotalMRTAFinancingAmtForCurrentCase )
	begin
		set @error = 'Total Disbursed Amount cannot more than MRTA financed amount'
	end 
	*/

	if (@error = '')
	begin
				
		delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where 
			arn = @arn 	
			and PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 	

		--PaymentReference in ('MRTA/ MRTT','MRTA/ MRTT - Excess Amount')
			

		if exists 
		(
			select 1
			from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
		)
		begin
			select @runningid = max(RunningIDForCurrentSubmission) 
			from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 		
		end 

		insert into aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
			 ([arn]
			   ,[RunningIDForCurrentSubmission]
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
			   ,AccountFrom
			   )	
		SELECT [arn]
		  ,(ROW_NUMBER () over (order by runningid))+@runningid  as runningid
		  ,[FacilityAccountNumber]
		  ,[PaymentMode]
		  ,[PayeeID]
		  ,[PayeeName]
		  ,[BeneficiaryBank]
		  ,[BeneficiaryBankAccountNumber]
		  ,[AmountDisburse]
		  ,[PaymentReference]
		  ,[PaymentDescription]
		  ,getdate()
		  ,getdate()
		  ,@account1
		  from aaSolDisbursementSubmission_MRTA
		  where arn = @arn 
	end 
	 
end