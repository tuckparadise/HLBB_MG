CREATE       procedure [dbo].[ddProject_Admin_ProgressiveBilling_Validate]

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
@DeveloperName nvarchar(max) = null ,
@PhaseName nvarchar(max) = null ,
@Error nvarchar(max) = null output  
as
begin

	set @Error = ''
	if (isnull(@ReportDateFrom,'')= '' or isnull(@ReportDateTo,'')= '')
	begin
		set @Error = 'Date Cannot Be Blank<br>'
	end 
	
	--set @Error =  @Error + 'test:' + cast(isnull(@BilllingDueDateFrom,'2000-01-01') as nvarchar(max))

	if (DATEDIFF(day, @ReportDateFrom, @ReportDateTo) > 185) set @error =  @error + 'Date range cannot be more than 185 days<br>'

	if (isnull(@BilllingDueDateFrom,'') <> '')
	begin
		--if (@BilllingDueDateTo is  null)
		if (isnull(@BilllingDueDateTo,'') ='')
		begin
			set @Error = @Error + 'Please Fill In Billing Due Date To<br>'
		end
	end 

	if (isnull(@BilllingDueDateTo,'') <>'' )
	begin
		if (isnull(@BilllingDueDateFrom,'') ='')
		begin
			set @Error =  @Error + 'Please Fill In Billing Due Date From<br>'
		end
	end 

	/*
	if (isnull(@DateTo,'')= '')
	begin
		set @Error = 'Disbursement Checker Approval To From Cannot Be Blank<br>'
	end 
	*/
end