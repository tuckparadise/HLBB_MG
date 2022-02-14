create   procedure [dbo].[aaNotificationOfPayment_LockRecord]
@runningid bigint =null 
as
begin
	update [aaNotificationOfPayment]
	set [Locked] =1
	where runningid = @runningid
end