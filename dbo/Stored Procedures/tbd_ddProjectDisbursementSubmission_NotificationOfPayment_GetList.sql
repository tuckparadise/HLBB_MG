CREATE     procedure [dbo].[tbd_ddProjectDisbursementSubmission_NotificationOfPayment_GetList]

as
begin
	declare @days int 
	select @days = [days] from [aaNotificationOfPayment_Setting]
	
	declare @NotificationDate datetime 
	set @NotificationDate = DATEADD(day,-@days,CONVERT(date, getdate()))	

	/*
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
  */

	truncate table ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
		
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
	(
		DevCode,
		DevEmail,
		ProjectCode,
		ProjectName,
		PhaseCode,
		PhaseName,
		--DeveloperLoginID,
		ExtraField1,
		RunningID
	)
	select distinct DevCode,
		DevEmail,
		ProjectCode,
		ProjectName,
		PhaseCode,
		PhaseName,
		--DeveloperLoginID,
		@NotificationDate as ExtraField1,
		ROW_NUMBER() OVER(ORDER BY PhaseCode ASC) AS Row	
	from ddProjectDisbursementSubmission_NotificationOfPayment
		/* testing */
			where 						
				year(UpdatedDate) = year(@NotificationDate)
				and month(UpdatedDate) = month(@NotificationDate)
				and day(UpdatedDate) = day(@NotificationDate)
				/* testing */

	
	select * from 	ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
end