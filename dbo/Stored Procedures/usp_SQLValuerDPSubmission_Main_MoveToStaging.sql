CREATE procedure [dbo].[usp_SQLValuerDPSubmission_Main_MoveToStaging]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin

	insert into SQLValuerDPSubmissionRemark_Staging
	select * from SQLValuerDPSubmissionRemark
	where arn = @arn

	insert into SQLValuerDPSubmission_Staging
	select * from SQLValuerDPSubmission
	where arn = @arn


	delete from SQLValuerDPSubmission
	where arn = @arn 

	delete from SQLValuerDPSubmissionRemark
	where arn = @arn 

end