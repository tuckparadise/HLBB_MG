create   procedure [dbo].[aa_ws_Check_ProjectDisbursementSubmissionAttachment_CheckCaseInMaster]
@draftID nvarchar(max) = null ,
@arn nvarchar(max) = null ,
@Found int = null output 
as
begin
	set @Found = 0 

	declare @caseID nvarchar(max) 

	set @caseID = @arn + '_' +@draftID

	if exists 
	(
		select 1
		from attachment_master
		where arn = @caseID
	)
	begin 
		set @Found = 1
	end 
	
end