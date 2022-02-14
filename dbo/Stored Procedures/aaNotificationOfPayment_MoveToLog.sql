CREATE   procedure [dbo].[aaNotificationOfPayment_MoveToLog]
@runningid bigint =null 
as
begin	
	INSERT INTO [dbo].[aaNotificationOfPayment_log]
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
           ,[Locked]
			,DevCode
			, SolCode
			, DevEmail
			, SolEmail)
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
		,DevCode
		, SolCode
		, DevEmail
		, SolEmail
  FROM [dbo].[aaNotificationOfPayment_staging] 	
	where runningid = @runningid

	
	delete from [aaNotificationOfPayment_staging]
	where runningid = @runningid
	
end