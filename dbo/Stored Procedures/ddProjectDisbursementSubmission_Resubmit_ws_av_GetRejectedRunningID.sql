CREATE       procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningID]
@IDCount bigint = null output,
@RunningID bigint = null output,
@error nvarchar(max) = null output,
@arn nvarchar(max) = null output
as
begin	
	set @IDCount = 0

	set @RunningID = (select top 1 rejectedrunningid 
			from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging  	
			where ProjectSubmissionPDFID is not null and ProjectSubmissionPDFID <> 0 
			order by UpdatedDate asc 
			)
	
	set @arn = (select arn 
			from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging  	
			where rejectedrunningid = @RunningID
			)

	if (@RunningID is not null )
	begin		
		set @IDCount = 1
	end 	
end