CREATE procedure [dbo].[usp_ValuerSession_Delete]
@ValuerCode nvarchar(100),
@error nvarchar(max) =null output 
as
begin
	
	insert into ValuerLogoutLog
	values (@ValuerCode, getdate(), getdate())

	delete from ValuerSession
	where ValuerCode = @ValuerCode

	/*
	if exists 
	(
		select 1 as col1
		from ValuerSession
		where ValuerCode = @ValuerCode
	)
	begin
		delete from ValuerSession
		where ValuerCode = @ValuerCode
	end 
	else
	begin 
		set @error = 'session not found'
	end 
	*/
end