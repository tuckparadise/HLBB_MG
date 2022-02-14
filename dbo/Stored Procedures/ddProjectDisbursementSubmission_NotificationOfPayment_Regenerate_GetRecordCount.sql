create   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_GetRecordCount]
@DevCode nvarchar(max) = null,
@ProjCode nvarchar(max) = null,
@PhaseCode nvarchar(max) = null,
@CheckerApprovalDate datetime = null ,
@RecordCount bigint = null output 
as
begin
	set @RecordCount = 0 

	
	set @RecordCount = 
	(
		SELECT  count(*) 	
		FROM [dbo].ddProjectDisbursementSubmission_vw_NotificationOfPayment_Regenerate np
			left join sqlloads on sqlloads.arn = np.arn 	
		where 
			--DevCode = @DevCode
			--and np.ProjectCode = @ProjCode
			np.PhaseCode = @PhaseCode
			and year([DisCheckerApprovedDate]) = year(@CheckerApprovalDate)
			and month([DisCheckerApprovedDate]) = month(@CheckerApprovalDate)
			and day([DisCheckerApprovedDate]) = day(@CheckerApprovalDate) 	
		)
		
end