CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Delete]
@ARN [nvarchar](100)
as 
begin

	delete SQLDUMakerDP_ValuerSubmission 
	where arn = @arn 

end