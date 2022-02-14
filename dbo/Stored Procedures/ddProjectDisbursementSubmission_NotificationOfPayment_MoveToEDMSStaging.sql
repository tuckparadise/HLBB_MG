CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_MoveToEDMSStaging]
@RunningID bigint = null 
as
begin	
	
	declare @phaseCode nvarchar(max) 
	declare @projectCode nvarchar(max) 
	declare @DeveloperCode nvarchar(max) 

	declare @phaseEmail nvarchar(max) 

	set @phaseCode = (select phasecode from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master where  RunningID = @RunningID)
	set @projectCode = (select ProjectCode from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master where  RunningID = @RunningID)
	set @DeveloperCode = (select DevCode from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master where  RunningID = @RunningID)

	set @phaseEmail = (select isnull(phaseemail,'') from ddProjectPhase where DeveloperCode = @DeveloperCode and ProjectCode = @projectCode and phasecode = @phaseCode)

	/*
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_EmailLog
	select *,case when @phaseEmail = '' then 0 else 1 end from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master	
	where RunningID = @RunningID
	*/

	insert into ddProjectDisbursementSubmission_NotificationOfPayment_staging_master_EDMS
	select * from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master	
	where RunningID = @RunningID

	delete from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
	where RunningID = @RunningID
		
end