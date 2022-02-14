CREATE     procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecord]
@runningid bigint =null 
as
begin
	declare @SenderEmail nvarchar(max)
	select @SenderEmail= [SenderEmail] FROM [dbo].[Settings]

	declare @URL nvarchar(max)
	select @URL= URL FROM [dbo].URL_Setting where type = 'DevSubmissionNotificationOfPayment'

	SELECT 
		np.[arn]
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
	  ,dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate(np.phasecode + '-' + np.phasename) as EmailHeader 
	  ,dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate(null) as EmailBody
	  ,sqlloads.DisbursementManner as DisbursementManner
	  ,@SenderEmail as SenderEmail
	  ,@URL as [URL]	    
	  ,sqlloads.CustomerID as CustomerID
	  ,sqlloads.CustomerName as CustomerName
	  ,np.ProjectCode
	  ,np.ProjectName
	  ,np.PhaseCode
	  ,np.PhaseName
	  ,ExtraField1 as [NotificationDate]	  
	FROM [dbo].ddProjectDisbursementSubmission_NotificationOfPayment_staging_master np
		left join sqlloads on sqlloads.arn = np.arn 
	where runningid = @runningid
	
end