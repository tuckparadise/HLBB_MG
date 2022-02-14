CREATE   procedure [dbo].[TBD_usp_ValuerUISession_SetVar1]
@ValCode nvarchar(max) =null ,
@Var1 nvarchar(max) =null 
as
begin
	if exists
	(
		select 1
		from ValuerUISession
		where ValuerCode = @ValCode
	)
	begin
		update ValuerUISession
		set var1 = @Var1
	end
	else
	begin
		insert into ValuerUISession (ValuerCode, Var1)
		values (@ValCode, @Var1)
	end 
end