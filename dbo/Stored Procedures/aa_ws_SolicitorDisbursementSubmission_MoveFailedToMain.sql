CREATE   procedure [dbo].[aa_ws_SolicitorDisbursementSubmission_MoveFailedToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin	
	
	declare @status nvarchar(100)
	/*
	insert into SQLSolicitorDPSubmissionRemark
	select * from SQLSolicitorDPSubmissionRemark_staging 
	where arn = @arn 

	insert into SQLSolicitorDPSubmissionExeDocs
	select * from [SQLSolicitorDPSubmissionExeDocs_staging] 
	where arn = @arn 
	*/
	if exists
	(
		select 1
		from aaSolDisbursementSubmission_DisMakerRejected
		where arn = @arn 
	)
	begin
		set @status = 'Resubmit-New'
	end 
	else
	begin
		set @status = 'New'
	end 

	update aaSolDisbursementSubmission_staging
	set CancelLoan_File = null,
		SolicitorSubmissionCompleted = 0		
	where arn = @arn 

	insert into aaSolDisbursementSubmission
	select * from aaSolDisbursementSubmission_staging 
	where arn = @arn 
	
	/*
	delete from [SQLSolicitorDPSubmissionExeDocs_staging] 
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionRemark_staging 
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2_Staging 
	where arn = @arn 
	*/

	delete from aaSolDisbursementSubmission_staging 
	where arn = @arn 

	-- generate email 
	declare @senderemail nvarchar(max),
		@solicitoremail nvarchar(max),
		@emailheader nvarchar(max),
		@emailcontent nvarchar(max)

	select @senderemail = [SenderEmail] FROM [dbo].[Settings]
	select top 1 @solicitoremail = solicitoremail from sqlloads where arn = @arn 

	delete from SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content

	--insert into aa_DUMaker_Letter_AV_SolicitorDisbursementSubmission_generate_list_aging_staging
	insert into SQLJOB_DUMaker_Letter_AV_SolicitorDisbursement_email_content
	select @arn,   @solicitoremail, @senderemail, dbo.[ufn_DUMaker_Letter_AV_disbursement_header_generate](@arn), dbo.[ufn_DUMaker_Letter_AV_disbursement_body_generate](@arn) 
		
end