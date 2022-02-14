CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_EDMSStaging_MoveToCompleted]
@DevCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@NotificationDate datetime = null 
as
begin
	
	
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_Completed
	select * from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS
	where DevCode = @DevCode
		and ProjectCode = @ProjectCode
		and PhaseCode = @PhaseCode
		and year(DisCheckerApprovedDate) = year(@NotificationDate)
		and month(DisCheckerApprovedDate) = month(@NotificationDate)
		and day(DisCheckerApprovedDate) = day(@NotificationDate)	

	delete from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS
	where DevCode = @DevCode
		and ProjectCode = @ProjectCode
		and PhaseCode = @PhaseCode
		and year(DisCheckerApprovedDate) = year(@NotificationDate)
		and month(DisCheckerApprovedDate) = month(@NotificationDate)
		and day(DisCheckerApprovedDate) = day(@NotificationDate)	
	

end