CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Delete]
@ARN [nvarchar](100)
as 
begin

	delete SQLDUMakerDP_SolicitorSubmission 
	where arn = @arn 

end