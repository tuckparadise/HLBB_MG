CREATE   procedure [dbo].[aa_aaIntDisbursementSubmission_RCOMakerSubmission_GetDisChecker]
  @arn nvarchar(max) = null ,
  @billingid bigint = null ,
  @DisChecker nvarchar(max) = null output,
  @DisCheckerApprovalDate nvarchar(max)  = null output
  as
  begin
		--select @DisChecker = DisbursementCheckerEmailAddress,
		select @DisChecker = InternalUser_checker.UserFullName ,
			@DisCheckerApprovalDate = FORMAT (DisbursementCheckerSubmissionDate, 'dd/MM/yyyy HH:mm:ss')
		from aaIntDisbursementSubmission_RCOMakerSubmission
		left join InternalUser InternalUser_checker on InternalUser_checker.UserName = aaIntDisbursementSubmission_RCOMakerSubmission.DisbursementCheckerEmailAddress
		where arn = @arn 
			and BillingRunningID = @billingid
  end