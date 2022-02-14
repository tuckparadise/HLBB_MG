CREATE procedure [dbo].[aaa_SQLSolicitorDPSubmissionAttachment2_SelectAll]
@arn nvarchar(max) = null
as
begin

	select *
	from SQLSolicitorDPSubmissionAttachment2
	where arn = @arn 

end