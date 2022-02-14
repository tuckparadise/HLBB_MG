CREATE   procedure [dbo].[aa_SolDisbursementSubmission_GetRejectionReason]
  @arn nvarchar(max) = null ,
  @RejectionReason nvarchar(max) output 
  as
  begin
	set @RejectionReason =''
	select @RejectionReason= [DisbursementMakerRejectionReason]
	from [aaSolDisbursementSubmission_DisMakerRejected]
	where arn = @arn 
  end