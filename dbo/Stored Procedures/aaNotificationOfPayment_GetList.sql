CREATE   procedure [dbo].[aaNotificationOfPayment_GetList]
as
begin
	declare @days int 
	select @days = [days] from aaNotificationOfPayment_Setting
	
	INSERT INTO [dbo].[aaNotificationOfPayment_failedlog]
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
           ,[PaymentCreatedDate]
           ,[PaymentUpdatedDate]
           ,[DisMakerEmail]
           ,[DisMakerSubmissionDate]
           ,[DisCheckerEmail]
           ,[DisCheckerApprovedDate]
           ,[RCOMakerEmail]
           ,[RCOMakerApprovedDate]
           ,[RCOCheckerEmail]
           ,[RCOCheckerApprovedDate]
           ,[AccountFrom]
           ,[DevName]
           ,[SolName]
           ,[NotificationCreatedDate]
           ,[NotificationUpdatedDate]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[Locked])
	SELECT [arn]
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
      ,[PaymentCreatedDate]
      ,[PaymentUpdatedDate]
      ,[DisMakerEmail]
      ,[DisMakerSubmissionDate]
      ,[DisCheckerEmail]
      ,[DisCheckerApprovedDate]
      ,[RCOMakerEmail]
      ,[RCOMakerApprovedDate]
      ,[RCOCheckerEmail]
      ,[RCOCheckerApprovedDate]
      ,[AccountFrom]
      ,[DevName]
      ,[SolName]
      ,[CreatedDate]
      ,[UpdatedDate]
	  ,getdate()
	  ,getdate()
      ,[Locked]      
  FROM [dbo].[aaNotificationOfPayment_staging] 	

	truncate table [aaNotificationOfPayment_staging]

	--if not exists (select 1 from [aaNotificationOfPayment_staging])
	--begin
		INSERT INTO [dbo].[aaNotificationOfPayment_staging]
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
           ,[PaymentCreatedDate]
           ,[PaymentUpdatedDate]
           ,[DisMakerEmail]
           ,[DisMakerSubmissionDate]
           ,[DisCheckerEmail]
           ,[DisCheckerApprovedDate]
           ,[RCOMakerEmail]
           ,[RCOMakerApprovedDate]
           ,[RCOCheckerEmail]
           ,[RCOCheckerApprovedDate]
           ,[AccountFrom]
           ,[DevName]
           ,[SolName]
           ,[CreatedDate]
           ,[UpdatedDate]
           ,[Locked]
		   ,RunningID)
		SELECT np.[arn]
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
		  ,[PaymentCreatedDate]
		  ,[PaymentUpdatedDate]
		  ,[DisMakerEmail]
		  ,[DisMakerSubmissionDate]
		  ,[DisCheckerEmail]
		  ,[DisCheckerApprovedDate]
		  ,[RCOMakerEmail]
		  ,[RCOMakerApprovedDate]
		  ,[RCOCheckerEmail]
		  ,[RCOCheckerApprovedDate]
		  ,[AccountFrom]
		  ,[DevName]
		  ,[SolName]
		  ,np.[CreatedDate]
		  ,np.[UpdatedDate]
		  ,[Locked]      
		  ,ROW_NUMBER() OVER(ORDER BY runningid ASC) AS Row
	--	  ,sqlloads.DisbursementManner as DisbursementManner	   
	  FROM [dbo].[aaNotificationOfPayment] np
		--left join sqlloads on sqlloads.arn = np.arn 
	  where 
		--locked = 1
		--and 
		getdate() >= DATEADD(day,@days,CONVERT(date, np.[UpdatedDate]))
		--getdate() > DATEADD(day,4,CONVERT(date, np.[UpdatedDate])) 

		delete from [aaNotificationOfPayment] 
		where 		
		getdate() >= DATEADD(day,@days,CONVERT(date, [UpdatedDate]))
		--getdate() > DATEADD(day,4,CONVERT(date, np.[UpdatedDate])) 
	--end 	

	select * from 	[aaNotificationOfPayment_staging]
end