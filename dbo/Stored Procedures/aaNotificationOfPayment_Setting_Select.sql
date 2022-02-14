create   procedure [dbo].[aaNotificationOfPayment_Setting_Select]
as
begin
	select [days], LastUpdatedDate, LastUpdatedUser
	from aaNotificationOfPayment_Setting

end