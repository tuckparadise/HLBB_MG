CREATE          procedure [dbo].[aa_ws_SolDisbursementSubmission_GetPreviousDUMaker]
@arn nvarchar(max) = null ,
@Error nvarchar(max) = null output 
as
begin	
	set @Error = ''

	select arn,
		DisbursementMakerEmailAddress
	from aaSolDisbursementSubmission_DisMakerRejected
	where arn = @arn 

	
end