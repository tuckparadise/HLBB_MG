CREATE     procedure [dbo].[ddProjectDisbursementSubmission_WorkflowHistory_Validate]
  @DeveloperCode nvarchar(max) = null, 
  @ProjectCode nvarchar(max) = null ,
  @PhaseCode nvarchar(max) = null ,
  @arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
  @AddressLine1 nvarchar(max) = null ,
@error nvarchar(max) = null output
as
begin
	set @error = ''

	/*
	if (isnull(@DateFrom,'') = '' or isnull(@DateTo,'') = '')
	begin
		set @error = 'Please Fill In Date From And Date To<br>'
	end 
	*/
	/*
	if (isnull(@ProjectCode,'') = '' and isnull(@PhaseCode,'') = '' and isnull(@arn,'') = '')
	begin
		set @error = 'Please Select Project/ Phase or Insert AA No. To Proceed<br>'
	end 
	*/
end