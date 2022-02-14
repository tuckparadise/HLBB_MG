CREATE     procedure [dbo].[ddProjectDisbursementSubmission_Resubmit_PDF_GetARNFromRunningID]
@RejectedRunningID bigint = null ,
@ARN nvarchar(max) = null output 
as
begin		
	set @ARN = (select arn
			from ddProjectDisbursementSubmission_DisMaker_Rejected_Staging  	
			where RejectedRunningID = @RejectedRunningID			
			)
end