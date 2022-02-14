CREATE procedure [dbo].[usp_ws_SQLSolicitorDPSubmission_MoveFailedToMain]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin	
	
	declare @status nvarchar(100)
	
	insert into SQLSolicitorDPSubmissionRemark
	select * from SQLSolicitorDPSubmissionRemark_staging 
	where arn = @arn 

	insert into SQLSolicitorDPSubmissionExeDocs
	select * from [SQLSolicitorDPSubmissionExeDocs_staging] 
	where arn = @arn 

	if exists
	(
		select 1
		from SQLDUMakerDP_SolicitorSubmission_Rejected
		where arn = @arn 
	)
	begin
		set @status = 'Resubmit-New'
	end 
	else
	begin
		set @status = 'New'
	end 

	update SQLSolicitorDPSubmission_Staging
	set SolicitorCancellationReportAttachment = null,
		SolicitorRefReportAttachment = null ,
		status = @status,
		Completed = 0 
	where arn = @arn 

	insert into SQLSolicitorDPSubmission
	select * from SQLSolicitorDPSubmission_Staging 
	where arn = @arn 
	
	delete from [SQLSolicitorDPSubmissionExeDocs_staging] 
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionRemark_staging 
	where arn = @arn 

	delete from SQLSolicitorDPSubmissionAttachment2_Staging 
	where arn = @arn 

	delete from SQLSolicitorDPSubmission_Staging 
	where arn = @arn 

	-- generate email 
	declare @senderemail nvarchar(max),
		@solicitoremail nvarchar(max),
		@emailheader nvarchar(max),
		@emailcontent nvarchar(max)

	select @senderemail = [SenderEmail] FROM [dbo].[Settings]
	select @solicitoremail = solicitoremail from sqlloads where arn = @arn 

	delete from SQLJOB_DUMaker_Letter_AV_Solicitor_email_content

	--insert into SQLJOB_DUMaker_Letter_AV_generate_list_aging_staging
	insert into SQLJOB_DUMaker_Letter_AV_Solicitor_email_content
	select @arn,   @solicitoremail, @senderemail, dbo.[ufn_DUMaker_Letter_AV_header_generate](@arn), dbo.[ufn_DUMaker_Letter_AV_body_generate](@arn) 
		
end