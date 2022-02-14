CREATE procedure [dbo].[usp_solicitorpasswordhistorylist]
@solicitorcode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	declare @count int , @SolicitorLoginPasswordHistoryCount int 

	select @count = SolicitorLoginPasswordHistoryCount,
		@SolicitorLoginPasswordHistoryCount = SolicitorLoginPasswordHistoryCount
	from settings 

	select top (@count) * , @SolicitorLoginPasswordHistoryCount as SolicitorLoginPasswordHistoryCount
	from SolicitorPasswordHistory 
	where solicitorcode = @solicitorcode
	order by createddate desc 
end