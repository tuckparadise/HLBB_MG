create   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSList]
as
begin
	/*
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

	select Devcode, np.ProjectCode, np.PhaseCode, DisCheckerApprovedDate  ,pdfid
		--@EDMSDocType as EDMSDocType, @ProfileName as ProfileName, @DefaultFileName as DefaultFileName , @EDMSUploadFolder as EDMSUploadFolder, @Category as Category,		
	from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS	 np
end