CREATE   procedure [dbo].[aa_aaSolDisbursementSubmission_RCOMakerSubmission_GetDisChecker]
  @arn nvarchar(max) = null ,
  @DisChecker nvarchar(max) = null output,
  @DisCheckerApprovalDate nvarchar(max)  = null output
  as
  begin
		--select @DisChecker = DisbursementCheckerEmailAddress,
		select @DisChecker = InternalUser_checker.UserFullName,
			@DisCheckerApprovalDate = FORMAT (DisbursementCheckerSubmissionDate, 'dd/MM/yyyy HH:mm:ss')
		from aaSolDisbursementSubmission_RCOMakerSubmission
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = aaSolDisbursementSubmission_RCOMakerSubmission.DisbursementCheckerEmailAddress
		where arn = @arn 
  end