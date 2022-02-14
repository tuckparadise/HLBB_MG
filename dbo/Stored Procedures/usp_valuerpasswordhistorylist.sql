CREATE procedure [dbo].[usp_valuerpasswordhistorylist]
@valuercode nvarchar(100) = null, 
@error nvarchar(max) = null output
as
begin
	declare @count int , @ValuerLoginPasswordHistoryCount int 

	select @count = ValuerLoginPasswordHistoryCount,
		@ValuerLoginPasswordHistoryCount = ValuerLoginPasswordHistoryCount
	from settings 

	select top (@count) * , @ValuerLoginPasswordHistoryCount as ValuerLoginPasswordHistoryCount
	from ValuerPasswordHistory 
	where valuercode = @valuercode
	order by createddate desc 
end