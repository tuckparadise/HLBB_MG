/*
 declare @RecordCount bigint 
 exec [ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount] @RecordCount output 

 select @RecordCount
 */
CREATE   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_GetRecordCount]
@RecordCount bigint = null output 
as
begin
	set @RecordCount = 0

	
	declare @days int 
	select @days = [days] from ddProjectNotificationOfPayment_Setting	

	declare @NotificationDate datetime 
	set @NotificationDate = DATEADD(day,-@days,CONVERT(date, getdate()))	
	
	set @RecordCount = (SELECT count(*)	
	FROM [dbo].ddProjectDisbursementSubmission_NotificationOfPayment 
	--where cast(DisCheckerApprovedDate as date) <= cast(@NotificationDate as date)
	
	where 		
		year(DisCheckerApprovedDate) = year(@NotificationDate)
		and month(DisCheckerApprovedDate) = month(@NotificationDate)
		and day(DisCheckerApprovedDate) = day(@NotificationDate)
	
	)
	
	
end