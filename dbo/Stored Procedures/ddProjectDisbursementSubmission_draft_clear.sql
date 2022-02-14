CREATE     procedure [dbo].[ddProjectDisbursementSubmission_draft_clear]
@ProjectCode nvarchar(max) = null ,
@LoginUser nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin

	delete ddProjectDisbursementSubmission_draft 
	where ProjectCode= @ProjectCode
		and DeveloperLoginID = @LoginUser

	IF OBJECT_ID('##ddProjectDisbursementSubmission_draft') IS NOT NULL
		DROP TABLE ##ddProjectDisbursementSubmission_draft
	
	CREATE TABLE ##ddProjectDisbursementSubmission_draft (developercode nvarchar(100), projectcode nvarchar(100), phasecode nvarchar(100), arn nvarchar(100),DeveloperLoginID nvarchar(100), InsertedDate datetime)

end