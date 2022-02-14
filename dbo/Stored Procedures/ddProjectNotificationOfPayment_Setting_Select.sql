CREATE     procedure [dbo].[ddProjectNotificationOfPayment_Setting_Select]
as
begin
	select [days], LastUpdatedDate, LastUpdatedUser, cast (isnull(email,0) as int)as email
	from ddProjectNotificationOfPayment_Setting

end