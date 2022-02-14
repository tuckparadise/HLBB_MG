create       procedure [dbo].[ddProject_NOP_Email_GetList]
@DevCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@ProcessingDate datetime = null ,
@ReceiverEmail nvarchar(max) = null output ,
@EmailBody nvarchar(max) = null output ,
@EmailHeader nvarchar(max) = null output ,
@pdfid bigint = null output ,
@DevName nvarchar(max) = null output 
as
begin
	declare @SenderEmail nvarchar(max)
	select @SenderEmail= [SenderEmail] FROM [dbo].[Settings]
	
	set @ReceiverEmail =  (select devemail from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
							where DevCode = @DevCode
							and ProjectCode = @ProjectCode
							and PhaseCode = @PhaseCode
							and year(DisCheckerApprovedDate) = year(@ProcessingDate)
							and month(DisCheckerApprovedDate) = month(@ProcessingDate)
							and day(DisCheckerApprovedDate) = day(@ProcessingDate)
							)

	set @EmailHeader =  (select dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_header_generate(phasecode + '-' + phasename) 
							from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
							where DevCode = @DevCode
							and ProjectCode = @ProjectCode
							and PhaseCode = @PhaseCode
							and year(DisCheckerApprovedDate) = year(@ProcessingDate)
							and month(DisCheckerApprovedDate) = month(@ProcessingDate)
							and day(DisCheckerApprovedDate) = day(@ProcessingDate)
							)

	set @EmailBody =  (select dbo.ufn_ddProjectDisbursementSubmission_NotificationOfPayment_body_generate(null)
							from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
							where DevCode = @DevCode
							and ProjectCode = @ProjectCode
							and PhaseCode = @PhaseCode
							and year(DisCheckerApprovedDate) = year(@ProcessingDate)
							and month(DisCheckerApprovedDate) = month(@ProcessingDate)
							and day(DisCheckerApprovedDate) = day(@ProcessingDate)
							)

	set @pdfid =  (select pdfid
							from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
							where DevCode = @DevCode
							and ProjectCode = @ProjectCode
							and PhaseCode = @PhaseCode
							and year(DisCheckerApprovedDate) = year(@ProcessingDate)
							and month(DisCheckerApprovedDate) = month(@ProcessingDate)
							and day(DisCheckerApprovedDate) = day(@ProcessingDate)
							)

	set @DevName =  (select DevName
							from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	
							where DevCode = @DevCode
							and ProjectCode = @ProjectCode
							and PhaseCode = @PhaseCode
							and year(DisCheckerApprovedDate) = year(@ProcessingDate)
							and month(DisCheckerApprovedDate) = month(@ProcessingDate)
							and day(DisCheckerApprovedDate) = day(@ProcessingDate)
							)
	/*
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

	/*
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
	  ,devemail as [ReceiverEmail]
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
	, @EDMSDocType as EDMSDocType 
	, @ProfileName as ProfileName
	, @DefaultFileName as DefaultFileName
	, @EDMSUploadFolder as EDMSUploadFolder
	, @Category as Category	
	,devcode
	,pdfid
	FROM [dbo].ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS np		
		left join sqlloads on sqlloads.arn = np.arn 		
	where np.DevCode = @DevCode
		and np.ProjectCode = @ProjectCode
		and np.PhaseCode = @PhaseCode
		and year(DisCheckerApprovedDate) = year(@ProcessingDate)
		and month(DisCheckerApprovedDate) = month(@ProcessingDate)
		and day(DisCheckerApprovedDate) = day(@ProcessingDate)
	*/

end