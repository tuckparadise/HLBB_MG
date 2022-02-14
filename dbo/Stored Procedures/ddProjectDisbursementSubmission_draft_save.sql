CREATE     procedure [dbo].[ddProjectDisbursementSubmission_draft_save]
@DeveloperCode nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@DeveloperLoginID nvarchar(max) = null ,
@DraftID bigint = null ,
@arn nvarchar(max) = null ,
@PR_Earliest_BillingDueDate datetime = null ,
@PR_TotalBillingAmount money = null ,
@attachment1  nvarchar(max)  = null ,
@attachment2  nvarchar(max)  = null ,
@error nvarchar(max) = null output 
as
begin
	
	if (rtrim(ltrim(@attachment1)) = '<file><name>scnull</name><content>scnull</content></file>')
	begin
		set @attachment1 = null 
	end 
	
	if (rtrim(ltrim(@attachment2)) = '<file><name>scnull</name><content>scnull</content></file>')
	begin
		set @attachment2 = null 
	end 

	update ddProjectDisbursementSubmission_draft
	set 
		--PR_EarliestBillingDueDate = @PR_Earliest_BillingDueDate,
		BillingAmount = @PR_TotalBillingAmount,
		attachment1 = @attachment1,
		attachment2 = @attachment2,
		UpdatedDate = getdate()
	where arn = @arn 	
		and DraftID = @DraftID

end