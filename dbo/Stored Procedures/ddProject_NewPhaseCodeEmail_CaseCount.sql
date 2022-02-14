CREATE     procedure [dbo].[ddProject_NewPhaseCodeEmail_CaseCount]
@CaseCount bigint = null output
as
begin	
	set @CaseCount = 
	(
		select count(*)
		from [ddProjectNewPhaseCodeEmailToAdminLog]
		where isnull(EmailSentFlag,0)  = 0		
	)
	
end