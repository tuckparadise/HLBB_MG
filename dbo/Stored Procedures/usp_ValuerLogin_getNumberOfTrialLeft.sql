CREATE procedure [dbo].[usp_ValuerLogin_getNumberOfTrialLeft]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if exists 
	(
		select TrialLeft 
		from ValuerLoginTrialSession
		where ValuerCode = @valuercode
	)
	begin
		 
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from ValuerLoginTrialSession
		where ValuerCode = @valuercode
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end