CREATE     procedure [dbo].[ddProjectSession_Create]
@ProjectCode nvarchar(100),
@ClientSessionID bigint, 
@error nvarchar(max) =null output 
as
begin
	
	delete from ddProjectLoginTrialSession where ProjectCode = @ProjectCode

	delete from ddProjectSession where ProjectCode = @ProjectCode

	declare @ProjectSessionInMinutes int 

	select @ProjectSessionInMinutes = ProjectSessionInMinutes
	from ddSettingsExt 

	insert into ddProjectSession (ProjectCode, LogonDatetime, Expired, ClientSessionID) 
		values( @ProjectCode, getdate(),DATEADD(MINUTE, @ProjectSessionInMinutes, getdate()), @ClientSessionID)

	insert into ddProjectUserLoginLog
	values (@ProjectCode, getdate(), getdate())

end