CREATE procedure [dbo].[aa_SolDisbursementSubmission_MoveToStaging]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	
	/*
	insert into aaSolicitorDisbursementSubmissionAttachment_Staging
	select * from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn

	insert into aaSolDisbursementSubmission_PaymentDetail_staging
	select * from aaSolDisbursementSubmission_PaymentDetail
	where arn = @arn
		
	insert into SQLSolicitorDPSubmissionRemark_staging
	select * from [SQLSolicitorDPSubmissionRemark]
	where arn = @arn
	*/	
	
	insert into aaSolDisbursementSubmission_staging
	select * from aaSolDisbursementSubmission
	where arn = @arn

	delete from aaSolDisbursementSubmission
	where arn = @arn 

	/*
	delete from aaSolicitorDisbursementSubmissionAttachment
	where arn = @arn 

	delete from aaSolDisbursementSubmission_PaymentDetail
	where arn = @arn 

	delete from [SQLSolicitorDPSubmissionRemark]
	where arn = @arn
	*/
end