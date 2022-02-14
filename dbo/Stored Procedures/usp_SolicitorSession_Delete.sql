CREATE procedure [dbo].[usp_SolicitorSession_Delete]
@SolicitorCode nvarchar(100),
@error nvarchar(max) =null output 
as
begin

	insert into SolicitorLogoutLog
	values (@SolicitorCode, getdate(), getdate())

	delete from SolicitorSession
	where SolicitorCode = @SolicitorCode

	/*
	if exists 
	(
		select 1 as col1
		from SolicitorSession
		where SolicitorCode = @SolicitorCode
	)
	begin
		delete from SolicitorSession
		where SolicitorCode = @SolicitorCode
	end 
	else
	begin 
		set @error = 'session not found'
	end 
	*/
end