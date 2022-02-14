CREATE procedure [dbo].[usp_solicitorinstance_remove]
  @arn nvarchar(100) = null,
  @error nvarchar(max) = null output 
  as
  begin
	
	set @error = ''
	/*
	delete from [dbo].[K2Instance]
	where Workflow= 'DPDUMakerSolicitorApproval'
		and arn =  @arn	
	*/

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

	if (@DisbursementHistoryCount =0)
	begin	
		
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

		-- remove bank instance (dis)
		delete from MortgageAppTaskInstance
		where workflow in ('DisbDUMakerSolicitorApproval','DisbDUCheckerSolicitorApproval','DisbRCOMakerSolicitorApproval')
			AND arn = @arn

		delete from aaSolDisbursementSubmission_MRTA
		where arn = @arn

		delete from aaSolDisbursementSubmission_DisCheckerRejected
		where arn = @arn

		delete from aaSolDisbursementSubmission_DisCheckerRejectedPaymentDetail
		where arn = @arn

		delete from aaSolDisbursementSubmission_DisMakerRejected
		where arn = @arn

		delete from aaSolDisbursementSubmission_DisMakerSubmission
		where arn = @arn

		delete from aaSolDisbursementSubmission_DisMakerSubmissionPaymentDetail
		where arn = @arn

		/*
		delete from aaSolDisbursementSubmission_RCOMakerSubmission
		where arn = @arn

		delete from aaSolDisbursementSubmission_RCOMakerSubmission_History
		where arn = @arn

		delete from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail
		where arn = @arn

		delete from aaSolDisbursementSubmission_RCOMakerSubmissionPaymentDetail_history
		where arn = @arn
		*/

		delete from aaSolDisbursementSubmissionSubmittedView
		where arn = @arn

		delete from aaSolDisbursementSubmissionSubmittedView_PaymentDetail
		where arn = @arn

	end

  end