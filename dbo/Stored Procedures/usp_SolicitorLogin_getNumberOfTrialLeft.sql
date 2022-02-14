CREATE procedure [dbo].[usp_SolicitorLogin_getNumberOfTrialLeft]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	set @error = ''

	if exists 
	(
		select TrialLeft 
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode
	)
	begin
		select 'You still have ' + CAST(TrialLeft as varchar(100)) + ' trials left' as msg
		from SolicitorLoginTrialSession
		where SolicitorCode = @solicitorcode
	end 
	else
	begin 
		set @error = 'System Error. Please retry'
	end 

end