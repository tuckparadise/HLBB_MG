/*
declare @CaseCount int 
exec [ddProjectEmailToDeveloperLog_CaseCount] @CaseCount output 

select @CaseCount
*/

CREATE   procedure [dbo].[ddProjectEmailToDeveloperLog_CaseCount]
@CaseCount bigint = null output
as
begin	
	set @CaseCount = 
	(
		select count(*)
		from ddProjectEmailToDeveloperLog
		where 
			--isnull(EmailSentFlag,0)  = 0
			--and 
			isnull(developercode,'') <> ''
			and isnull(PhaseCode,'') <> ''
			and isnull(ProjectCode,'') <> ''
			--and isnull(EmailReceiver,'') <> ''
			and isnull(runcount,0) < 1
	)
	
end