CREATE procedure [dbo].[usp_ValuerSession_Create]
@ValuerCode nvarchar(100),
@ClientSessionID bigint, 
@error nvarchar(max) =null output 
as
begin

	delete from ValuerLoginTrialSession where ValuerCode = @ValuerCode
	
	delete from ValuerSession where ValuerCode = @ValuerCode

	declare @ValuerSessionInMinutes int 

	select @ValuerSessionInMinutes = ValuerSessionInMinutes
	from settings 

	insert into ValuerSession (ValuerCode, LogonDatetime, Expired, ClientSessionID ) 
	values( @ValuerCode, getdate(),DATEADD(MINUTE, @ValuerSessionInMinutes, getdate()),@ClientSessionID)

	insert into ValuerUserLoginLog
	values (@ValuerCode, getdate(), getdate())

	/*
	if not exists 
	(
		select 1 as col1
		from ValuerSession
		where ValuerCode = @ValuerCode
	)
	begin
		insert into ValuerSession (ValuerCode, LogonDatetime, Expired) 
		values( @ValuerCode, getdate(),DATEADD(MINUTE, 20, getdate()))
	end 
	else
	begin 
		set @error = 'session existed'
	end 
	*/
end