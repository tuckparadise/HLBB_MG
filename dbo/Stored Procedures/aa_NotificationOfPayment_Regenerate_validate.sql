create   procedure [dbo].[aa_NotificationOfPayment_Regenerate_validate] 
@arn nvarchar(max) = null ,
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if (isnull(@arn,'') = '')
	begin
		set @error = 'Please Enter Customer Reference Number'
	end 

	if not exists 
	(
		select 1
		FROM [dbo].[aaNotificationOfPayment_log]  
		where arn = @arn 
		union 
		select 1
		FROM [dbo].[aaNotificationOfPayment_failedlog]  
		where arn = @arn 
	)
	begin
		set @error = 'No Records Found'
	end 
end