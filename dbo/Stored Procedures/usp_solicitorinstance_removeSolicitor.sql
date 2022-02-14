CREATE   procedure [dbo].[usp_solicitorinstance_removeSolicitor]
  @arn nvarchar(100) = null,
  @NewSolCode nvarchar(max) = null, 
  @CurrentUser nvarchar(max) = null, 
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''

	if (@CurrentUser like 'K2:%')
	begin		
		set @CurrentUser = Stuff(@CurrentUser, 1, 3, '')					
	end 

	/*
	delete from [dbo].[K2Instance]
	where Workflow= 'DPDUMakerSolicitorApproval'
		and arn =  @arn	
	*/

	/*
	delete from MortgageAppTaskInstance
	where Workflow= 'DPDUMakerSolicitorApproval'
		and arn = @arn

	-- dumaker submission 
	delete from SQLDUMakerDP_SolicitorSubmission
	where arn = @arn 
	
	-- dumaker submission (rejected)
	delete from SQLDUMakerDP_SolicitorSubmission_ExeDocs_Rejected
	where arn = @arn 

	delete from SQLDUMakerDP_SolicitorSubmission_Rejected
	where arn = @arn 
	*/

	-- 20210518-start new rules for changing sol code 
	declare @DisbursementHistoryCount nvarchar(max)	
	
	if exists 
	(
		select 1
		from aaSolDisbursementSubmission_DisMakerSubmission_History
		where arn = @arn 
	)
	begin
		set @DisbursementHistoryCount = 1
	end 
	else
	begin
		set @DisbursementHistoryCount = 0
	end 	
	
	--get old sol code 
	declare @OldSolCode nvarchar(max)
	set @OldSolCode = (select solicitorcode from sqlloads where arn = @arn )

	if (@DisbursementHistoryCount =0)
	begin		
		-- remove solicitor submission (doc)
		delete from SQLSolicitorDPSubmission
		where arn = @arn

		delete from SQLSolicitorDPSubmissionAttachment2
		where arn = @arn

		delete from SQLSolicitorDPSubmissionExeDocs
		where arn = @arn

		delete from SQLSolicitorDPSubmissionRemark
		where arn = @arn
	
		-- solicitor submission in staging (doc)
		delete from SQLSolicitorDPSubmission_staging
		where arn = @arn

		delete from SQLSolicitorDPSubmissionAttachment2_staging
		where arn = @arn

		delete from SQLSolicitorDPSubmissionExeDocs_staging
		where arn = @arn

		delete from SQLSolicitorDPSubmissionRemark_staging
		where arn = @arn

		-- remove solicitor submission (dis)
		delete from aaSolDisbursementSubmission
		where arn = @arn

		delete from aaSolDisbursementSubmission_LegalFee
		where arn = @arn

		delete from aaSolDisbursementSubmission_PaymentDetail
		where arn = @arn

		delete from aaSolDisbursementSubmission_UpdateInfo
		where arn = @arn

		

		-- remove solicitor submission staging (dis)
		delete from aaSolDisbursementSubmission_PaymentDetail_staging
		where arn = @arn

		delete from aaSolDisbursementSubmission_PaymentDetail_temp
		where arn = @arn

		delete from aaSolDisbursementSubmission_staging
		where arn = @arn

		/*
		declare @NewSolCode nvarchar(max) 

		select @NewSolCode = [SolicitorCode]
		from [SQLLOADS]
		where arn = @arn 
		*/

		insert into WorkflowHistory
		values ('Documentation',@arn,'Change of Solicitor',@NewSolCode,null,getdate())

		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Change of Solicitor',@NewSolCode,null,getdate())

		-- log the data 
		insert into aaSolCodeChangeLog 
		values (@arn, @OldSolCode, @NewSolCode, 0, getdate(), getdate(), @CurrentUser, @CurrentUser)
	end 
	else
	begin
		insert into WorkflowHistory
		values ('Documentation',@arn,'Change of Solicitor(First Advice Completed)',@NewSolCode,null,getdate())

		insert into WorkflowHistory
		values ('Disbursement By Solicitor',@arn,'Change of Solicitor(First Advice Completed)',@NewSolCode,null,getdate())

		-- log the data 
		insert into aaSolCodeChangeLog 
		values (@arn, @OldSolCode, @NewSolCode, 1, getdate(), getdate(), @CurrentUser, @CurrentUser)
	end 
  end