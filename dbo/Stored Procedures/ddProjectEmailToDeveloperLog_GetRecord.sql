/*

update ddProjectEmailToDeveloperLog
set runcount = null , EmailSentFlag = null, EmailSentDate = null



declare @SurrogateID bigint 
declare @EmailHeader nvarchar(max)  
declare @EmailContent nvarchar(max)  
declare @EmailSender nvarchar(max)  
declare @EmailReceiver nvarchar(max)  
exec ddProjectEmailToDeveloperLog_GetRecord @SurrogateID output ,  @EmailHeader output ,  @EmailContent output ,  @EmailSender output ,  @EmailReceiver output 

select @SurrogateID, @EmailHeader, @EmailContent, @EmailSender, @EmailReceiver

*/

CREATE   procedure [dbo].[ddProjectEmailToDeveloperLog_GetRecord]
@SurrogateID bigint = null output,
@EmailHeader nvarchar(max) = null output,
@EmailContent nvarchar(max) = null output,
@EmailSender nvarchar(max) = null output,
@EmailReceiver nvarchar(max) = null output
as
begin
	set @SurrogateID = 
	(
		select top 1 SurrogateID
		from ddProjectEmailToDeveloperLog
		where 
			--isnull(EmailSentFlag,0)  = 0
			--and 
			isnull(developercode,'') <> ''
			and isnull(PhaseCode,'') <> ''
			and isnull(ProjectCode,'') <> ''
			--and isnull(EmailReceiver,'') <> ''
			and isnull(runcount,0) < 1
		order by CreatedDate asc 
	)	

	declare @PhaseCode nvarchar(max)
	declare @ProjectCode nvarchar(max)
	declare @DeveloperCode nvarchar(max)

	set @PhaseCode = 
	(
		select PhaseCode
		from ddProjectEmailToDeveloperLog
		where SurrogateID = @SurrogateID
	)

	set @ProjectCode = 
	(
		select ProjectCode
		from ddProjectEmailToDeveloperLog
		where SurrogateID = @SurrogateID
	)

	set @DeveloperCode = 
	(
		select DeveloperCode
		from ddProjectEmailToDeveloperLog
		where SurrogateID = @SurrogateID
	)

	set @EmailHeader = 
	(
		select dbo.[ufn_DocApprovedEmailToDeveloper_header_generate](@PhaseCode,@ProjectCode,@DeveloperCode)		
	)

	set @EmailContent = 
	(
		select dbo.[ufn_DocApprovedEmailToDeveloper_body_generate](@PhaseCode,@ProjectCode,@DeveloperCode)		
	)

	set @EmailSender = null

	set @EmailReceiver = 
	(
		/*
		select EmailReceiver
		from ddProjectEmailToDeveloperLog
		where SurrogateID = @SurrogateID
		*/

		
		select phaseemail
		from ddProjectPhase
		where developercode = @developercode
			and projectcode = @projectcode
			and phasecode = @phasecode
		
		--select null 
	)

	update ddProjectEmailToDeveloperLog
	set EmailReceiver = @EmailReceiver,
		runcount  = 1
	where SurrogateID = @SurrogateID
end