CREATE   procedure [dbo].[usp_SQLDUMakerDPSubmissionRemark_list]
@arn nvarchar(100) null 
as
begin
	select *
	from SQLDUMakerDP_SolicitorSubmissionRemark
	where arn = @arn 

end