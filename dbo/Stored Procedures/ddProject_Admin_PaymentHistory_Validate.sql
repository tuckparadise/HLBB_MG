CREATE     procedure [dbo].[ddProject_Admin_PaymentHistory_Validate]
@DeveloperCode nvarchar(max) = null, 
@ProjectCode nvarchar(max) = null ,
@PhaseCode nvarchar(max) = null ,
@arn nvarchar(max) = null ,
@DateFrom datetime = null,
@DateTo datetime = null,
@TimeFromHour int = null,
@TimeToHour int = null,
@TimeFromMin int = null,
@TimeToMin int = null,
@MortgageCentre nvarchar(max) = null ,
@DeveloperName nvarchar(max) = null ,
@PhaseName nvarchar(max) = null ,
    @Error nvarchar(max) = null output  
as
begin
	set @Error = ''
	if (isnull(@DateFrom,'')= '' or isnull(@DateTo,'')= '')
	begin
		set @Error = 'Date Cannot Be Blank<br>'
	end 

	if (DATEDIFF(day, @DateFrom, @DateTo) > 31) set @error =  @error + 'Date range cannot be more than 31 days<br>'

	/*
	if (isnull(@DateTo,'')= '')
	begin
		set @Error = 'Disbursement Checker Approval To From Cannot Be Blank<br>'
	end 
	*/
end