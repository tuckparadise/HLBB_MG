CREATE     procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetMasterList]

as
begin
	
	declare @days int 
	select @days = [days] from ddProjectNotificationOfPayment_Setting
	
	declare @NotificationDate datetime 
	set @NotificationDate = DATEADD(day,-@days,CONVERT(date, getdate()))	
	--set @NotificationDate = getdate()

	truncate table ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
	--truncate table ddProjectDisbursementSubmission_NotificationOfPayment_staging
	
	insert into ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
	(
		DevCode,
		--DevEmail,
		ProjectCode,
		--ProjectName,
		PhaseCode,
		--PhaseName,				
		createddate,
		Updateddate,		
		DisCheckerApprovedDate ,
		RunningID
		--DevName
	)
	select DevCode,
		--DevEmail,
		ProjectCode,
		--ProjectName,
		PhaseCode,
		--PhaseName,		
		getdate(),
		getdate(),
		@NotificationDate , 
		ROW_NUMBER() OVER(ORDER BY PhaseCode ASC) AS Row	
		--DevName
	from (
		select distinct 
			DevCode,
			--DevEmail,
			ProjectCode,
			--ProjectName,
			PhaseCode
			--PhaseName,		
			--DevName			
		from ddProjectDisbursementSubmission_NotificationOfPayment
		--where cast(DisCheckerApprovedDate as date) <= cast(@NotificationDate as date)
		/* testing */
		
			where 						
				year(DisCheckerApprovedDate) = year(@NotificationDate)
				and month(DisCheckerApprovedDate) = month(@NotificationDate)
				and day(DisCheckerApprovedDate) = day(@NotificationDate)
				
				/* testing */
	) tbl

	
	update  staging_master	
	set staging_master.DevName = dev.name
	from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master staging_master
	inner join ddProjectDeveloper dev on dev.id = staging_master.DevCode 
	
	update  staging_master	
	set staging_master.ProjectName = dev_proj.projectname
	from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master staging_master
	inner join ddProjectDeveloperProjectMapping dev_proj on dev_proj.developercode = staging_master.DevCode and dev_proj.projectcode = staging_master.projectcode

	update  staging_master	
	set staging_master.phasename = dev_phase.phasename,
		staging_master.DevEmail = dev_phase.phaseemail
	from ddProjectDisbursementSubmission_NotificationOfPayment_staging_master staging_master
	inner join ddProjectPhase dev_phase on dev_phase.developercode = staging_master.DevCode and dev_phase.projectcode = staging_master.projectcode and dev_phase.phasecode = staging_master.phasecode


	select * from 	ddProjectDisbursementSubmission_NotificationOfPayment_staging_master
end