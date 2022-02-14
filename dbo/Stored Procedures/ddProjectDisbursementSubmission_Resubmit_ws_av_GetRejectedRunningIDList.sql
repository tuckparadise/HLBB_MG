create         procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_ws_av_GetRejectedRunningIDList]
as
begin	
	select rejectedrunningid ,arn
	from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging  	
	where ProjectSubmissionPDFID is not null and ProjectSubmissionPDFID <> 0 
	order by UpdatedDate asc 
end