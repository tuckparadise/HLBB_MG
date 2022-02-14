CREATE       procedure [dbo].[ddProject_Admin_ProgrressiveBilling_Validate]

@DeveloperCode nvarchar(max) = null, 
@MortgageCentre nvarchar(max) = null ,
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@Status nvarchar(max) = null ,
@BilllingDueDateFrom datetime = null,
@BilllingDueDateTo datetime = null,
@ReportDateFrom datetime = null,
@ReportDateTo datetime = null,
@Category nvarchar(max) = null ,
@Error nvarchar(max) = null output  
as
begin

	set @Error = ''
	if (isnull(@ReportDateFrom,'')= '' or isnull(@ReportDateTo,'')= '')
	begin
		set @Error = 'Date Cannot Be Blank<br>'
	end 

	/*
	if (isnull(@DateTo,'')= '')
	begin
		set @Error = 'Disbursement Checker Approval To From Cannot Be Blank<br>'
	end 
	*/
end