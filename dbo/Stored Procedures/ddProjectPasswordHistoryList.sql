CREATE   procedure [dbo].[ddProjectPasswordHistoryList]
@ProjectCode nvarchar(100) = null, 
@error nvarchar(max) = null output 
as
begin
	declare @count int , @ProjectLoginPasswordHistoryCount int 

	select @count = ProjectLoginPasswordHistoryCount,
		@ProjectLoginPasswordHistoryCount = ProjectLoginPasswordHistoryCount
	from ddSettingsExt 

	select top (@count) * , @ProjectLoginPasswordHistoryCount as ProjectLoginPasswordHistoryCount
	from ddProjectPasswordHistory 
	where ProjectCode = @ProjectCode
	order by createddate desc 
end