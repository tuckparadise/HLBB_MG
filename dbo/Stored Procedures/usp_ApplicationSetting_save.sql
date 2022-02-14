CREATE   procedure [dbo].[usp_ApplicationSetting_save]
@CRA02_Documentation_ProfileName nvarchar(max) =null
,@CRA02_Documentation_LoginUser nvarchar(max) =null
,@CRA02_Documentation_DefaultFileName nvarchar(max) =null
,@CRA02_Documentation_EDMSUploadFolder nvarchar(max) =null
,@CRA02_Documentation_Category nvarchar(max) =null
,@CRA04_Valuation_ProfileName nvarchar(max) =null
,@CRA04_Valuation_LoginUser nvarchar(max) =null
,@CRA04_Valuation_DefaultFileName nvarchar(max) =null
,@CRA04_Valuation_EDMSUploadFolder nvarchar(max) =null
,@CRA04_Valuation_Category nvarchar(max) =null
,@CRA05_Disbursement_ProfileName nvarchar(max) =null
,@CRA05_Disbursement_LoginUser nvarchar(max) =null
,@CRA05_Disbursement_DefaultFileName nvarchar(max) =null
,@CRA05_Disbursement_EDMSUploadFolder nvarchar(max) =null
,@CRA05_Disbursement_Category nvarchar(max) =null
,@CRA06_Billings_ProfileName nvarchar(max) =null
,@CRA06_Billings_LoginUser nvarchar(max) =null
,@CRA06_Billings_DefaultFileName nvarchar(max) =null
,@CRA06_Billings_EDMSUploadFolder nvarchar(max) =null
,@DU1_Letter_URL nvarchar(max) =null
,@DU2_Letter_URL nvarchar(max) =null
,@LogoutURL_URL nvarchar(max) =null
,@SolicitorLogin_URL nvarchar(max) =null
,@ValuerLogin_URL nvarchar(max) =null
,@edms_letter_of_instruction_cdc_date datetime =null
,@edms_billing_cdc datetime =null
,@SolicitorDocSubPDF_Cancellation nvarchar(max) =null
,@SolicitorDocSubPDF_Submission nvarchar(max) =null
,@SolicitorDocSubPDF_UpdateInfo nvarchar(max) =null
,@ValuerVRSubPDF_UpdateInfo nvarchar(max) =null
,@ValuerVRSubPDF_Cancellation nvarchar(max) =null
,@ValuerVRSubPDF_LowerOMV nvarchar(max) =null
,@ValuerVRSubPDF_Submission nvarchar(max) =null
,@CRA06_Billings_Category nvarchar(max) =null
,@CRA06_Billing2_ProfileName nvarchar(max) =null
,@CRA06_Billing2_LoginUser nvarchar(max) =null
,@CRA06_Billing2_DefaultFileName nvarchar(max) =null
,@CRA06_Billing2_EDMSUploadFolder nvarchar(max) =null
,@CRA06_Billing2_Category nvarchar(max) =null
,@NotificationOfPaymentLS nvarchar(max) =null
,@NotificationOfPaymentPR nvarchar(max) =null
,@NotificationOfPaymentLS_Regenerate nvarchar(max) =null
,@NotificationOfPaymentPR_Regenerate nvarchar(max) =null
,@SolicitorDisbSubPDF_Cancellation nvarchar(max) =null
,@SolicitorDisbSubPDF_Submission_LS nvarchar(max) =null
,@SolicitorDisbSubPDF_Submission_PR nvarchar(max) =null
,@SolicitorDisbSubPDF_UpdateInfo nvarchar(max) =null 
,@DisbRCOMakerPDF nvarchar(max) =null
,@BilingRCOMakerPDF nvarchar(max) =null

,@DeveloperLogin nvarchar(max) =null
,@DevPortalAcknowledgementURL_PDF nvarchar(max) =null
,@ProjectSubmission nvarchar(max) =null
,@DevSubRCOMakerPDF nvarchar(max) =null
,@DevSubResubmitPDF nvarchar(max) =null
,@DevSubmissionNotificationOfPaymentRegenerate nvarchar(max) =null
,@DevSubmissionNotificationOfPayment nvarchar(max) =null

,@CRA06_DevPortal_Billing_ProfileName nvarchar(max) =null
,@CRA06_DevPortal_Billing_LoginUser nvarchar(max) =null
,@CRA06_DevPortal_Billing_DefaultFileName nvarchar(max) =null
,@CRA06_DevPortal_Billing_EDMSUploadFolder nvarchar(max) =null
,@CRA06_DevPortal_Billing_Category nvarchar(max) =null
			
,@lastupdateduser nvarchar(max) =null
,@error nvarchar(max) = null output 
as
begin
	set @error = ''

	-- start get original fields value 		
	declare @ConcatenatedOriginalValue nvarchar(max)
	set @ConcatenatedOriginalValue = ''

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA02 Documentation'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA04 Valuation'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA05 Disbursement'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA06 Billings'	

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DU1'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DU2'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'LogoutURL'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_Cancellation'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_Submission'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDocSubPDF_UpdateInfo'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_UpdateInfo'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_Cancellation'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_LowerOMV'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ValuerVRSubPDF_Submission'
		
	--CRA06 Billing Related Doc
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA06 Billing Related Doc'	

	--NotificationOfPaymentLS
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'NotificationOfPaymentLS'

	--NotificationOfPaymentPR
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'NotificationOfPaymentPR'

	--NotificationOfPaymentLS_Regenerate
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'NotificationOfPaymentLS_Regenerate'
	
	--NotificationOfPaymentPR_Regenerate
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'NotificationOfPaymentPR_Regenerate'
	
	--20210409- url setting for dis 
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDisbSubPDF_Cancellation'
	
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDisbSubPDF_Submission_LS'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDisbSubPDF_Submission_PR'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'SolicitorDisbSubPDF_UpdateInfo'
	-- end 

	-- 20210416- url setting for rco maker form 
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DisbRCOMakerPDF'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'BilingRCOMakerPDF'
	-- end 

	-- 20211025- url setting for rco maker form 
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DeveloperLogin'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DevPortalAcknowledgementURL_PDF'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'ProjectSubmission'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DevSubRCOMakerPDF'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DevSubResubmitPDF'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DevSubmissionNotificationOfPaymentRegenerate'

	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		[URL] 
	from [URL_Setting]
	where [Type] = 'DevSubmissionNotificationOfPayment'

	--CRA06 Billing(Dev Portal)
	select @ConcatenatedOriginalValue = @ConcatenatedOriginalValue + ',' + 
		ProfileName +','+
		LoginUser +','+
		DefaultFileName +','+
		EDMSUploadFolder +','+
		Category 	
	from EDMS_Settings
	where EDMSDocType = 'CRA06 Billing (Dev Portal)'	
	
	-- 20211025- end 

	-- end get original fields value 

	-- start get Concatenated field name 
	declare @fieldname nvarchar(max), 
		@ConcatenatedFieldsName nvarchar(max)
	
	
	SET @fieldname = ''
	SET @fieldname = 'CRA02_Documentation_ProfileName ,CRA02_Documentation_LoginUser ,CRA02_Documentation_DefaultFileName ,CRA02_Documentation_EDMSUploadFolder ,CRA02_Documentation_Category 		,CRA04_Valuation_ProfileName ,CRA04_Valuation_LoginUser ,CRA04_Valuation_DefaultFileName ,CRA04_Valuation_EDMSUploadFolder ,CRA04_Valuation_Category ,CRA05_Disbursement_ProfileName ,CRA05_Disbursement_LoginUser ,CRA05_Disbursement_DefaultFileName ,CRA05_Disbursement_EDMSUploadFolder ,CRA05_Disbursement_Category ,CRA06_Billings_ProfileName ,CRA06_Billings_LoginUser 		,CRA06_Billings_DefaultFileName ,CRA06_Billings_EDMSUploadFolder ,CRA06_Billings_Category ,DU1_Letter_URL ,DU2_Letter_URL ,LogoutURL_URL ,SolicitorLogin_URL ,ValuerLogin_URL,SolicitorDocSubPDF_Cancellation ,SolicitorDocSubPDF_Submission ,SolicitorDocSubPDF_UpdateInfo,ValuerVRSubPDF_UpdateInfo ,ValuerVRSubPDF_Cancellation ,ValuerVRSubPDF_LowerOMV ,ValuerVRSubPDF_Submission' 
	SET @fieldname = @fieldname + ',CRA06_BillingRelatedDoc_ProfileName ,CRA06_BillingRelatedDoc_LoginUser 		,CRA06_BillingRelatedDoc_DefaultFileName ,CRA06_BillingRelatedDoc_EDMSUploadFolder ,CRA06_BillingRelatedDoc_Category'
	
	SET @fieldname = @fieldname + ',NotificationOfPaymentLS, NotificationOfPaymentPR'	
	SET @fieldname = @fieldname + ',NotificationOfPaymentLS_Regenerate, NotificationOfPaymentPR_Regenerate'
	--20210409- url setting for dis 
	SET @fieldname = @fieldname + ',SolicitorDisbSubPDF_Cancellation, SolicitorDisbSubPDF_Submission_LS, SolicitorDisbSubPDF_Submission_PR, SolicitorDisbSubPDF_UpdateInfo'
	-- end 

	--20210416- url setting for rco maker form 
	SET @fieldname = @fieldname + ',DisbRCOMakerPDF,BilingRCOMakerPDF'
	-- end 

	--20211025- url setting for dev portal 
	SET @fieldname = @fieldname + ',DeveloperLogin,DevPortalAcknowledgementURL_PDF,ProjectSubmission,DevSubRCOMakerPDF,DevSubResubmitPDF,DevSubmissionNotificationOfPaymentRegenerate,DevSubmissionNotificationOfPayment'
	-- 20211025- end 

	-- dev portal 
	SET @fieldname = @fieldname + 	',CRA06_DevPortal_Billing_ProfileName,CRA06_DevPortal_Billing_LoginUser,CRA06_DevPortal_Billing_DefaultFileName,CRA06_DevPortal_Billing_EDMSUploadFolder,CRA06_DevPortal_Billing_Category'

	-- dev portal
	
	BEGIN TRY  
		update EDMS_Settings
		set ProfileName= @CRA02_Documentation_ProfileName,
			LoginUser= @CRA02_Documentation_LoginUser,
			DefaultFileName = @CRA02_Documentation_DefaultFileName,
			EDMSUploadFolder = @CRA02_Documentation_EDMSUploadFolder,
			Category = @CRA02_Documentation_Category
		where EDMSDocType = 'CRA02 Documentation'

		update EDMS_Settings
		set ProfileName= @CRA04_Valuation_ProfileName,
			LoginUser= @CRA04_Valuation_LoginUser,
			DefaultFileName = @CRA04_Valuation_DefaultFileName,
			EDMSUploadFolder = @CRA04_Valuation_EDMSUploadFolder,
			Category = @CRA04_Valuation_Category
		where EDMSDocType = 'CRA04 Valuation'

		update EDMS_Settings
		set ProfileName= @CRA05_Disbursement_ProfileName,
			LoginUser= @CRA05_Disbursement_LoginUser,
			DefaultFileName = @CRA05_Disbursement_DefaultFileName,
			EDMSUploadFolder = @CRA05_Disbursement_EDMSUploadFolder,
			Category = @CRA05_Disbursement_Category
		where EDMSDocType = 'CRA05 Disbursement'

		update EDMS_Settings
		set ProfileName= @CRA06_Billings_ProfileName,
			LoginUser= @CRA06_Billings_LoginUser,
			DefaultFileName = @CRA06_Billings_DefaultFileName,
			EDMSUploadFolder = @CRA06_Billings_EDMSUploadFolder,
			Category = @CRA06_Billings_Category
		where EDMSDocType = 'CRA06 Billings'		
		
		update [URL_Setting]
		set [URL] = @DU1_Letter_URL
		where type = 'DU1' 

		update [URL_Setting]
		set [URL] = @DU2_Letter_URL
		where type = 'DU2' 

		update [URL_Setting]
		set [URL] = @LogoutURL_URL
		where type = 'LogoutURL'

		update [URL_Setting]
		set [URL] = @SolicitorLogin_URL
		where type = 'SolicitorLogin'

		update [URL_Setting]
		set [URL] = @SolicitorLogin_URL
		where type = 'SolicitorLALogin'

		update [URL_Setting]
		set [URL] = @ValuerLogin_URL
		where type = 'ValuerLogin'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_Cancellation
		where type = 'SolicitorDocSubPDF_Cancellation'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_Submission
		where type = 'SolicitorDocSubPDF_Submission'

		update [URL_Setting]
		set [URL] = @SolicitorDocSubPDF_UpdateInfo
		where type = 'SolicitorDocSubPDF_UpdateInfo'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_UpdateInfo
		where type = 'ValuerVRSubPDF_UpdateInfo'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_Cancellation
		where type = 'ValuerVRSubPDF_Cancellation'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_LowerOMV
		where type = 'ValuerVRSubPDF_LowerOMV'

		update [URL_Setting]
		set [URL] = @ValuerVRSubPDF_Submission
		where type = 'ValuerVRSubPDF_Submission'
		
		-- billing related doc
		update EDMS_Settings
		set ProfileName= @CRA06_Billing2_ProfileName,
			LoginUser= @CRA06_Billing2_LoginUser,
			DefaultFileName = @CRA06_Billing2_DefaultFileName,
			EDMSUploadFolder = @CRA06_Billing2_EDMSUploadFolder,
			Category = @CRA06_Billing2_Category
		where EDMSDocType = 'CRA06 Billing Related Doc'

		--NotificationOfPaymentLS
		update [URL_Setting]
		set [URL] = @NotificationOfPaymentLS
		where type = 'NotificationOfPaymentLS'

		-- NotificationOfPaymentPR
		update [URL_Setting]
		set [URL] = @NotificationOfPaymentPR
		where type = 'NotificationOfPaymentPR'

		-- NotificationOfPaymentPR_Regenerate
		update [URL_Setting]
		set [URL] = @NotificationOfPaymentPR_Regenerate
		where type = 'NotificationOfPaymentPR_Regenerate'

		-- NotificationOfPaymentLS_Regenerate
		update [URL_Setting]
		set [URL] = @NotificationOfPaymentLS_Regenerate
		where type = 'NotificationOfPaymentLS_Regenerate'

		--20210409- url setting for dis 
		update [URL_Setting]
		set [URL] = @SolicitorDisbSubPDF_Cancellation
		where type = 'SolicitorDisbSubPDF_Cancellation'

		update [URL_Setting]
		set [URL] = @SolicitorDisbSubPDF_Submission_LS
		where type = 'SolicitorDisbSubPDF_Submission_LS'
		
		update [URL_Setting]
		set [URL] = @SolicitorDisbSubPDF_Submission_PR
		where type = 'SolicitorDisbSubPDF_Submission_PR'

		update [URL_Setting]
		set [URL] = @SolicitorDisbSubPDF_UpdateInfo
		where type = 'SolicitorDisbSubPDF_UpdateInfo'
		-- end 

		--20210416- url setting for rco maker form  
		update [URL_Setting]
		set [URL] = @DisbRCOMakerPDF
		where type = 'DisbRCOMakerPDF'

		update [URL_Setting]
		set [URL] = @BilingRCOMakerPDF
		where type = 'BilingRCOMakerPDF'
		-- end 

		--20211025- url setting for dev portal 
		update [URL_Setting]
		set [URL] = @DeveloperLogin
		where type = 'DeveloperLogin'

		update [URL_Setting]
		set [URL] = @DevPortalAcknowledgementURL_PDF
		where type = 'DevPortalAcknowledgementURL_PDF'

		update [URL_Setting]
		set [URL] = @ProjectSubmission
		where type = 'ProjectSubmission'

		update [URL_Setting]
		set [URL] = @DevSubRCOMakerPDF
		where type = 'DevSubRCOMakerPDF'

		update [URL_Setting]
		set [URL] = @DevSubResubmitPDF
		where type = 'DevSubResubmitPDF'

		update [URL_Setting]
		set [URL] = @DevSubmissionNotificationOfPaymentRegenerate
		where type = 'DevSubmissionNotificationOfPaymentRegenerate'

		update [URL_Setting]
		set [URL] = @DevSubmissionNotificationOfPayment
		where type = 'DevSubmissionNotificationOfPayment'
		--20211025- end 
		
		-- dev portal 
		update EDMS_Settings
		set ProfileName= @CRA06_DevPortal_Billing_ProfileName,
			LoginUser= @CRA06_DevPortal_Billing_LoginUser,
			DefaultFileName = @CRA06_DevPortal_Billing_DefaultFileName,
			EDMSUploadFolder = @CRA06_DevPortal_Billing_EDMSUploadFolder,
			Category = @CRA06_DevPortal_Billing_Category
		where EDMSDocType = 'CRA06 Billing (Dev Portal)'
		-- dev portal 
		
		/*
		update [tblCDC]
		set [newLICDC] = @edms_letter_of_instruction_cdc_date, 
			[newBillingCDC] = @edms_billing_cdc
		*/
	END TRY  
	BEGIN CATCH  
		 set @error =  ERROR_NUMBER() +','+ ERROR_MESSAGE()
	END CATCH  
	
	if (@error = '')
	begin
		-- start get new inserted primary key value 
		--declare @OperationPrimaryKeysValue nvarchar(max)

		--select @OperationPrimaryKeysValue = AttorneyNameID
		--from SQLDUMakerDP_AttorneyName
		--where AttorneyName = @AttorneyName
		-- end get new inserted primary key value

		-- start get table name, primary keys and operation 
		declare @tablename nvarchar(100),
			@operation nvarchar(100),
			@OperationPrimaryKeys nvarchar(max)

		set @tablename = 'IntUsr_Adm_ApplicationSetting' 
		set @operation = 'EDIT'
		--set @OperationPrimaryKeys = 'AttorneyNameID'
		-- end get table name, primary keys and operation 		
			
		-- start get operator 
		declare @operator nvarchar(100)
		set @operator = @lastupdateduser
		-- start get operator 

		
		/*
		select @fieldname = @fieldname + COLUMN_NAME + ', ' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
		

		set @ConcatenatedFieldsName = SUBSTRING(@fieldname, 0, LEN(@fieldname))
		-- end get Concatenated field name 

		-- end get Concatenated fields new values 
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)
						
		SET @ConcatenatedFieldsNamePlus = ''						
			
		select @ConcatenatedFieldsNamePlus = @ConcatenatedFieldsNamePlus + 'isnull(cast(' + COLUMN_NAME + ' as varchar(max)),'''') + '','' +' 
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = @tablename
			and column_name not in ('createddate', 'updateddate', 'createduser','updateduser')
			
		declare @queryResult nvarchar(max)
	
		declare @query nvarchar(max)
		set @query = ''
		set @query = @query + ' select @tempqueryResult=' + SUBSTRING(@ConcatenatedFieldsNamePlus, 0, LEN(@ConcatenatedFieldsNamePlus)) 
		set @query = @query + ' from ' + @tablename
		set @query = @query + ' where AttorneyNameID = ' + @OperationPrimaryKeysValue

		select @query

		EXECUTE sp_executesql @query, N'@tempqueryResult nvarchar(max) OUTPUT', @tempqueryResult=@queryResult OUTPUT
		set @queryResult = ltrim(rtrim(@queryResult))
		*/
		declare @ConcatenatedFieldsNamePlus nvarchar(max), 															
			@ConcatenatedNewValue nvarchar(max)

		--set @ConcatenatedNewValue = SUBSTRING(@queryResult,1, LEN(@queryResult)-1)
		set @ConcatenatedNewValue = @CRA02_Documentation_ProfileName +','+@CRA02_Documentation_LoginUser +','+@CRA02_Documentation_DefaultFileName +','+@CRA02_Documentation_EDMSUploadFolder +','+@CRA02_Documentation_Category 
			+','+@CRA04_Valuation_ProfileName +','+@CRA04_Valuation_LoginUser +','+@CRA04_Valuation_DefaultFileName +','+@CRA04_Valuation_EDMSUploadFolder +','+@CRA04_Valuation_Category 
			+','+@CRA05_Disbursement_ProfileName +','+@CRA05_Disbursement_LoginUser +','+@CRA05_Disbursement_DefaultFileName +','+@CRA05_Disbursement_EDMSUploadFolder +','+@CRA05_Disbursement_Category 
			+','+@CRA06_Billings_ProfileName +','+@CRA06_Billings_LoginUser +','+@CRA06_Billings_DefaultFileName +','+@CRA06_Billings_EDMSUploadFolder +','+@CRA06_Billings_Category +','+@DU1_Letter_URL 
			+','+@DU2_Letter_URL +','+@LogoutURL_URL +','+@SolicitorLogin_URL +','+@ValuerLogin_URL 			
			+','+@SolicitorDocSubPDF_Cancellation + ',' +@SolicitorDocSubPDF_Submission + ',' +@SolicitorDocSubPDF_UpdateInfo 
			+','+@ValuerVRSubPDF_UpdateInfo +',' +@ValuerVRSubPDF_Cancellation + ',' + @ValuerVRSubPDF_LowerOMV +',' + @ValuerVRSubPDF_Submission 
			+','+@CRA06_Billing2_ProfileName +','+@CRA06_Billing2_LoginUser +','+@CRA06_Billing2_DefaultFileName +','+@CRA06_Billing2_EDMSUploadFolder +','+@CRA06_Billing2_Category
			+','+@NotificationOfPaymentLS +','+@NotificationOfPaymentPR
			+','+@NotificationOfPaymentLS_Regenerate +','+@NotificationOfPaymentPR_Regenerate

			--20210409- url setting for dis 
			+','+@SolicitorDisbSubPDF_Cancellation +','+@SolicitorDisbSubPDF_Submission_LS+','+ @SolicitorDisbSubPDF_Submission_PR + ','+@SolicitorDisbSubPDF_UpdateInfo

			--20210416- url setting for rco maker form 
			+','+@DisbRCOMakerPDF +','+@BilingRCOMakerPDF

			--20211025- url setting for dev portal 
			
			+','+@DeveloperLogin+','+@DevPortalAcknowledgementURL_PDF+','+@ProjectSubmission+','+@DevSubRCOMakerPDF+','+@DevSubResubmitPDF+','+@DevSubmissionNotificationOfPaymentRegenerate+','+@DevSubmissionNotificationOfPayment
			--+','+isnull(cast(@edms_letter_of_instruction_cdc_date as nvarchar),'') +','+isnull(cast(@edms_billing_cdc  as nvarchar),'')			
			
			-- dev portal
			+','+@CRA06_DevPortal_Billing_ProfileName+','+@CRA06_DevPortal_Billing_LoginUser+','+@CRA06_DevPortal_Billing_DefaultFileName+','+@CRA06_DevPortal_Billing_EDMSUploadFolder+','+@CRA06_DevPortal_Billing_Category			
			-- dev portal
			
		-- end get Concatenated fields new values
		-- insert into admin log
		INSERT INTO [dbo].[AdminOperationAuditLog]
			([TableName]
			,[Operation]
			,[OperationPrimaryKeys]
			,[OperationPrimaryKeysValue]
			,[ConcatenatedFieldsName]
			,[ConcatenatedOriginalValue]
			,[ConcatenatedNewValue]
			,[Operator]
			,[InsertedDateTime])
		values (@tablename, @operation, @OperationPrimaryKeys, NULL, @fieldname, @ConcatenatedOriginalValue,@ConcatenatedNewValue, @operator, getdate() )

	end 
end