create   procedure [dbo].[ddProjectDisbursementSubmission_draft_insert]
@arn nvarchar(max) = null ,
@output nvarchar(max) = null output 
as
begin
	insert into ddProjectDisbursementSubmission_draft (arn)
	values (@arn)
end