CREATE         procedure [dbo].[aa_Report_A_CaseAccepted_Validate]
@Category nvarchar(max) = null,
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
@DocStatus nvarchar(max) = null,
@DocStatusFlag bit = null,
@VRStatus nvarchar(max) = null,
@VRStatusFlag bit = null,
@SolCode nvarchar(max) = null,
@SolCodeFlag bit = null,
@ValCode nvarchar(max) = null,
@ValCodeFlag bit = null,
@DocVRANDFlag bit = null,
@Error nvarchar(max) = null OUTPUT 
as
begin

	set @error = ''

	--if (isnull(@Category,'') = '') set @error =  @error + 'Category cannot be blank<br>'
	if (isnull(@DateFrom,'') = '') set @error =  @error + 'Date From cannot be blank<br>'
	if (isnull(@DateTo,'') = '') set @error =  @error + 'Date To cannot be blank<br>'
	if (DATEDIFF(day, @DateFrom, @DateTo) > 185) set @error =  @error + 'Date range cannot be more than 185 days<br>'
	
	if (isnull(@MortgageCentre,'') = '' and @MortgageCentreFlag = 1) set @error =  @error + 'Mortgage Centre cannot be blank<br>'
	if (isnull(@DocStatus,'') = '' and @DocStatusFlag = 1) set @error =  @error + 'Documentation Status cannot be blank<br>'
	if (isnull(@VRStatus,'') = '' and @VRStatusFlag = 1) set @error =  @error + 'VR Status cannot be blank<br>'
	if (isnull(@SolCode,'') = '' and @SolCodeFlag = 1) set @error =  @error + 'Solicitor Code cannot be blank<br>'
	if (isnull(@ValCode,'') = '' and @ValCodeFlag = 1) set @error =  @error + 'Valuer Code cannot be blank<br>'

	if (@ValCodeFlag = 1 and @VRStatus = 'N/A') set @error =  @error + 'N/A status is not valid for category Valuer Submission Case<br>'


end