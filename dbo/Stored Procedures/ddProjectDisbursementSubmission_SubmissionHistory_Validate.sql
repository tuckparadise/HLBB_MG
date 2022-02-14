CREATE   procedure [dbo].[ddProjectDisbursementSubmission_SubmissionHistory_Validate]
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

end