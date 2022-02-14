CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMS_ARNList] 
@DevCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@ProcessingDate datetime = null 
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

	select distinct arn
		--@EDMSDocType as EDMSDocType, @ProfileName as ProfileName, @DefaultFileName as DefaultFileName , @EDMSUploadFolder as EDMSUploadFolder, @Category as Category,				
	from ddProjectDisbursementSubmission_NotificationOfPayment	 np
	where np.DevCode = @DevCode
		and np.ProjectCode = @ProjectCode
		and np.PhaseCode = @PhaseCode
		and year(DisCheckerApprovedDate) = year(@ProcessingDate)
		and month(DisCheckerApprovedDate) = month(@ProcessingDate)
		and day(DisCheckerApprovedDate) = day(@ProcessingDate)
	--left join sqlloads on sqlloads.arn = np.arn 
end