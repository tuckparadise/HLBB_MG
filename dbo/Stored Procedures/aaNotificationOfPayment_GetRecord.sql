-- [aaNotificationOfPayment_GetRecord] 

--select * from aaNotificationOfPayment


CREATE   procedure [dbo].[aaNotificationOfPayment_GetRecord]
@runningid bigint =null 
as
begin
	declare @SenderEmail nvarchar(max)
	select @SenderEmail= [SenderEmail] FROM [dbo].[Settings]

	declare @PR_URL nvarchar(max)
	select @PR_URL= URL FROM [dbo].URL_Setting where type = 'NotificationOfPaymentPR'

	declare @LS_URL nvarchar(max)
	select @LS_URL= URL FROM [dbo].URL_Setting where type = 'NotificationOfPaymentLS'

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
      ,convert(nvarchar(max),np.[CreatedDate],103) as [CreatedDate]
	  ,convert(nvarchar(max),np.[UpdatedDate],103) as [UpdatedDate]   
      ,[Locked]
      ,[RunningID]
	  ,sqlloads.SolicitorEmail as [ReceiverEmail]
	  ,dbo.ufn_NotificationOfPayment_header_generate(np.arn) as EmailHeader 
	  ,dbo.ufn_NotificationOfPayment_body_generate(np.arn) as EmailBody
	  ,sqlloads.DisbursementManner as DisbursementManner
	  ,@SenderEmail as SenderEmail
	  ,@PR_URL as PR_URL
	  ,@LS_URL as LS_URL	  
	  ,sqlloads.CustomerID as CustomerID
	  ,sqlloads.CustomerName as CustomerName
	--FROM [dbo].[aaNotificationOfPayment_staging] np
	FROM [dbo].[aaNotificationOfPayment] np
		left join sqlloads on sqlloads.arn = np.arn 
	where runningid = @runningid
	
end