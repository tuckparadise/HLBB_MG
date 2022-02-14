CREATE   procedure [dbo].[ddProjectDisbursementSubmission_AcknowledgementUpload_GetRecord]
@Proceed int  = null output,  
@LoginID nvarchar(max) = null output,
@LoginName nvarchar(max) = null output,
@AcknowledgementDate nvarchar(max) = null output,
@IsSubUser bit = null output,
@EDMSDocType nvarchar(max) = null output,
@ProfileName nvarchar(max) = null output,
@LoginUser nvarchar(max) = null output,
@DefaultFileName nvarchar(max) = null output,
@EDMSUploadFolder nvarchar(max) = null output,
@Category nvarchar(max) = null output,
@url nvarchar(max) = null output,
@DeveloperName nvarchar(max) = null output
as
begin
	set @Proceed = 0

	if exists 
	(
		select 1
		from ddProject_vw_DeveloperLogin
		where AcknowledgementFlag = 1
			and isnull(AcknowledgementUploaded,0) = 0
	)
	begin
		set @Proceed = 1

		select @LoginID = ddProject_vw_DeveloperLogin.[ID] ,			
			@LoginName = ddProject_vw_DeveloperLogin.[Name] ,
			@AcknowledgementDate = FORMAT (ddProject_vw_DeveloperLogin.AcknowledgementDate, 'dd/MM/yyyy HH:mm') ,
			@IsSubUser = [IsSubUser],			
			@DeveloperName = ddProjectDeveloper.[Name]
		from ddProject_vw_DeveloperLogin 
		left join ddProjectDeveloper on ddProjectDeveloper.id = ddProject_vw_DeveloperLogin.DeveloperCode
		where ddProject_vw_DeveloperLogin.AcknowledgementFlag = 1 
			and isnull(ddProject_vw_DeveloperLogin.AcknowledgementUploaded,0) = 0

		SELECT @EDMSDocType = [EDMSDocType]
		  ,@ProfileName = [ProfileName]
		  ,@LoginUser = [LoginUser]
		  ,@DefaultFileName = [DefaultFileName]
		  ,@EDMSUploadFolder = [EDMSUploadFolder]
		  ,@Category = [Category]
		FROM [dbo].[EDMS_Settings]
		where [EDMSDocType] = 'CRA06 Billing Related Doc'		

		set @url = (select [URL] from URL_Setting where [type] = 'DevPortalAcknowledgementURL_PDF' )
	end 
end