﻿CREATE     procedure [dbo].[aaIntDisbursementSubmission_MRTA_ExportToCurrentPayment]
@arn nvarchar(max) =null , 
@billingid bigint = null ,
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
		select 1 from vw_aaDisbursementPaymentInProgress
		where PaymentReference = 'MRTA/ MRTT'
			and arn = @arn 
		union 
		select 1 from vw_aaDisbursementPaymentHistory
		where PaymentReference = 'MRTA/ MRTT'
			and arn = @arn 		
	)
	begin
		set @error = 'MRTA/ MRTT had been added/ submitted'
	end 
	*/

	if (@error = '')
	begin
		
		delete from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where 
			arn = @arn 	
			and BillingRunningID = @billingid
			and PaymentReference in ('MDTA/ MRTT','MDTA/ MRTT - Principal Pymt') 	

		if exists 
		(
			select 1
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
				and BillingRunningID = @billingid
		)
		begin
			select @runningid = max(RunningIDForCurrentSubmission) 
			from aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
			where arn = @arn 
				and BillingRunningID = @billingid
		end 

		insert into aaIntDisbursementSubmission_DisMakerSubmissionPaymentDetail
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
			   ,BillingRunningID
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
		  ,@billingid
		  from aaIntDisbursementSubmission_MRTA
		  where arn = @arn 
			and BillingRunningID = @billingid
	end 
	 
end