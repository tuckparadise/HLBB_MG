CREATE       procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDF_GetRecordByRunningID]
@runningid bigint =null 
as
begin
	/*
	declare @SenderEmail nvarchar(max)
	select @SenderEmail= [SenderEmail] FROM [dbo].[Settings]

	declare @URL nvarchar(max)
	select @URL= URL FROM [dbo].URL_Setting where type = 'DevSubmissionNotificationOfPayment'

	declare @EDMSDocType nvarchar(max)
	declare @ProfileName nvarchar(max)
	declare @DefaultFileName nvarchar(max)
	declare @EDMSUploadFolder nvarchar(max)
	declare @Category nvarchar(max)

	set @EDMSDocType = 'CRA06 Billing Related Doc'
	set @ProfileName = (select ProfileName from EDMS_Settings where EDMSDocType = @EDMSDocType)
	set @DefaultFileName = (select DefaultFileName from EDMS_Settings where EDMSDocType = @EDMSDocType)
	set @EDMSUploadFolder = (select EDMSUploadFolder from EDMS_Settings where EDMSDocType = @EDMSDocType)
	set @Category = (select Category from EDMS_Settings where EDMSDocType = @EDMSDocType)
	*/

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
	  ,DevCode
	  --,sqlloads.DeveloperCode as DevCode
      ,[DevName]
	  --,np.Name as [DevName]
      --,[SolName]
      ,convert(nvarchar(max),np.[CreatedDate],103) as [CreatedDate]
	  ,convert(nvarchar(max),np.[UpdatedDate],103) as [UpdatedDate]   
      --,[Locked]
      ,[RunningID]
	  --,sqlloads.SolicitorEmail as [ReceiverEmail]
	  --,dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate(np.phasecode + '-' + np.phasename) as EmailHeader 
	  --,dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate(null) as EmailBody
	  --,sqlloads.DisbursementManner as DisbursementManner
	  --,@SenderEmail as SenderEmail
	  --,@URL as [URL]	    
	  --,sqlloads.CustomerID as CustomerID
	  --,sqlloads.CustomerName as CustomerName
	  ,np.ProjectCode
	  ,np.ProjectName
	  ,np.PhaseCode
	  ,np.PhaseName
	  ,ExtraField1 as [NotificationDate]	  
	  --, @EDMSDocType as EDMSDocType 
	--	, @ProfileName as ProfileName
	--, @DefaultFileName as DefaultFileName
	--, @EDMSUploadFolder as EDMSUploadFolder
	--, @Category as Category
	FROM [dbo].ddProjectDisbursementSubmission_NotificationOfPayment_staging_master np
		left join sqlloads on sqlloads.arn = np.arn 
		--left join ddProjectPhase phase on phase.developercode = sqlloads.DeveloperCode and phase.projectcode = sqlloads.projectcode and phase.phasecode = sqlloads.phasecode
		--left join ddProjectDeveloperProjectMapping project on project.developercode = sqlloads.DeveloperCode and project.projectcode = sqlloads.projectcode 
		--left join ddprojectdeveloper on ddprojectdeveloper.id = sqlloads.DeveloperCode

	where runningid = @runningid
	
end