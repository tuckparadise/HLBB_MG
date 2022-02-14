create   procedure [dbo].[ddProjectDisbursementSubmission_NotificationOfPayment_Regenerate_Validate]
@DevCode nvarchar(max) = null,
@ProjCode nvarchar(max) = null,
@PhaseCode nvarchar(max) = null,
@CheckerApprovalDate datetime = null ,
@error nvarchar(max) = null output 
as
begin
	
	set @error = ''

	if (isnull(@PhaseCode,'') ='')
	begin
		set @error = 'Phase Code Cannot Be Blank<br>'
	end 

	if (isnull(@CheckerApprovalDate,'') ='')
	begin
		set @error = @error + 'Approval Date Cannot Be Blank<br>'
	end 
end