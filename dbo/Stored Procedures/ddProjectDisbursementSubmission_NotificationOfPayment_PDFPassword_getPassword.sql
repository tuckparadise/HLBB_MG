CREATE     procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_PDFPassword_getPassword]
@DevCode nvarchar(max) = null,
@ProjectCode nvarchar(max) = null,
@PhaseCode nvarchar(max) = null,
@DevName nvarchar(max) = null,
@password nvarchar(max) = null output 
as
begin
	declare @pwDevCode nvarchar(100)
	declare @pwDevCodeFirstLetter nvarchar(100)
	declare @pwDevCodeSecondLetter nvarchar(100)

	--set @arn = 'KLM/MG/2019/Z0102891'
	set @pwDevCode = lower(dbo.[RemoveNonAlphaCharacters](@DevCode))
	
	set @pwDevCodeFirstLetter = left(@DevName,1)
	--select @pwDevCodeFirstLetter

	set @pwDevCodeSecondLetter = substring(@DevName,2,1)
	--select @pwDevCodeSecondLetter

	select @PhaseCode =lower(dbo.[RemoveNonAlphaCharacters](@PhaseCode))

	--select @solfirm = lower(REPLACE(solicitorname, ' ', ''))
	--select @PhaseCode =lower(dbo.[RemoveNonAlphaCharacters]([Name]))
	--from ddProjectDeveloper
	--where arn = 'arn1'
	--where ID= @DevCode
	
	SET @password=UPPER(@pwDevCodeFirstLetter)+LOWER(@pwDevCodeSecondLetter) + @PhaseCode
	
end