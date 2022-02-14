CREATE procedure [dbo].[usp_ws_getCustomerInfo_forARN]
@arn nvarchar(100) = null ,
@error nvarchar(max) = null output 
as
begin
	select *
	from sqlloads 
	where arn = @arn
end