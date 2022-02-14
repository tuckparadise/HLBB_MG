create   procedure [dbo].[tbd_poc_result]
as
begin
	select 'arn1' as arn, 'jack@gmail.com' as email, '01/12/2021' as datesent, 'sent' as status
	union 
	select 'arn2' as arn, 'jill@gmail.com' as email, '01/12/2021' as datesent, 'sent' as status
	union 
	select 'arn3' as arn, 'joe@gmail.com' as email, '01/12/2021' as datesent, 'sent' as status
end