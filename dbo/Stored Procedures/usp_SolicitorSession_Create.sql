CREATE   procedure [dbo].[usp_SolicitorSession_Create]
@SolicitorCode nvarchar(100),
@ClientSessionID bigint, 
@error nvarchar(max) =null output 
as
begin
	
	delete from SolicitorLoginTrialSession where SolicitorCode = @SolicitorCode

	delete from SolicitorSession where SolicitorCode = @SolicitorCode

	declare @SolicitorSessionInMinutes int 

	select @SolicitorSessionInMinutes = SolicitorSessionInMinutes
	from settings 

	insert into SolicitorSession (SolicitorCode, LogonDatetime, Expired, ClientSessionID) 
		values( @SolicitorCode, getdate(),DATEADD(MINUTE, @SolicitorSessionInMinutes, getdate()), @ClientSessionID)

	insert into SolicitorUserLoginLog
	values (@SolicitorCode, getdate(), getdate())

	/*
	if not exists 
	(
		select 1 as col1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode
	)
	begin
		insert into SolicitorSession (SolicitorCode, LogonDatetime, Expired) 
		values( @SolicitorCode, getdate(),DATEADD(MINUTE, 20, getdate()))
	end 
	else
	begin 
		set @error = 'session existed'
	end 
	*/
end