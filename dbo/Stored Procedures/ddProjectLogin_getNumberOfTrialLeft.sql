CREATE   procedure [dbo].[ddProjectLogin_getNumberOfTrialLeft]
@ProjectCode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if exists 
	(
		select TrialLeft 
		from ddProjectLoginTrialSession
		where ProjectCode = @ProjectCode
	)
	begin
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from ddProjectLoginTrialSession
		where ProjectCode = @ProjectCode
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end