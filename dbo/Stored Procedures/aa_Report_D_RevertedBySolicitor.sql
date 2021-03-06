CREATE       procedure [dbo].[aa_Report_D_RevertedBySolicitor]
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
@SolCode nvarchar(max) = null,
@SolCodeFlag bit = null,
@SolicitorOption nvarchar(max) = null,
@SolicitorOptionFlag bit = null,
@Error nvarchar(max) = null OUTPUT 
as
begin

	set @error = ''
	/*
	if (isnull(@DateFrom,'') = '') set @error =  @error + 'Date From cannot be blank<br>'
	if (isnull(@DateTo,'') = '') set @error =  @error + 'Date To cannot be blank<br>'
	if (DATEDIFF(day, @DateFrom, @DateTo) > 31) set @error =  @error + 'Date range cannot be more than 90 days<br>'
	
	if (isnull(@MortgageCentre,'') = '' and @MortgageCentreFlag = 1) set @error =  @error + 'Mortgage Centre cannot be blank<br>'
	if (isnull(@SolCode,'') = '' and @SolCodeFlag = 1) set @error =  @error + 'Solicitor Code cannot be blank<br>'
	if (isnull(@SolicitorOption,'') = '' and @SolicitorOptionFlag = 1) set @error =  @error + 'Solicitor Submission Option cannot be blank<br>'
	*/
	
	if (@error ='')
	begin							
		with CTE 
		(	[ARN]
			,[Status]
			,[BranchAddr1]
			,[BranchAddr2]
			,[BranchAddr3]
			,[BranchAddrCity]
			,[BranchAddrCountry]
			,[BranchAddrPostCode]
			,[BranchAddrState]
			,[BranchManagerEmailAddress]
			,[BranchManagerName]
			,[ClosingBranch]			  
			,DateOfLOAcceptance
			,[FinancingType]
			,[MortgateCenterCode]
			,[MortgateCenterEmail]
			,[PFSalesEmailAddress]
			,[PFCSalesName]
			,[SolicitorAccountNbr]
			,[SolicitorAccountType]
			,[SolicitorAddr1]
			,[SolicitorAddr2]
			,[SolicitorAddr3]
			,[SolicitorAddrCity]
			,[SolicitorAddrCountry]
			,[SolicitorAddrPostCode]
			,[SolicitorAddrState]
			,[SolicitorEmail]
			,[SolInternalStatus]
			,[SolicitorName]
			,[SolicitorCode]
			,[TopUpLoanIndicator]
			,[ChargorIDNumber]
			,[ChargorName]
			,[CustomerAddr1]
			,[CustomerAddr2]
			,[CustomerAddr3]
			,[CustomerAddrCity]
			,[CustomerAddrCountry]
			,[CustomerAddrPostCode]
			,[CustomerAddrState]
			,[ApplicantEmail]
			,[CustomerID]
			,[ApplicantName]
			,[CustomerName]
			,[EStatementFlagIndicator]
			,[GuarantorIDNumber]
			,[GuarantorName]
			,[DisbursementManner]
			,[LoanAmount]
			,[FacilityAmount1]
			,[FacilityAmount2]
			,[FacilityAmount3]
			,[FacilityAmount4]
			,[FinancingProductName1]
			,[FinancingProductName2]
			,[FinancingProductName3]
			,[FinancingProductName4]
			,[GracePeriod]
			,[LegalFeesFinancedAmount]
			,[MRTAFinancedAmount]
			,[PurposeCode]
			,[TotalFinancingAmount]
			,[ValuationFeesFinancedAmount]
			,[BuildUpArea]
			,[DeveloperCode]
			,[DeveloperName]
			,[CollateralPurpose]
			,[LandArea]
			,[ProjectCode]
			,[ProjectName]
			,[PropertyAddress]
			,[PropertyType]
			,[ValuationRequired]
			,[TitleDetailsLO]
			,[ValuerAccountNBR]
			,[ValuerAccountType]
			,[ValuerAddr1]
			,[ValuerAddr2]
			,[ValuerAddr3]
			,[ValuerAddrCity]
			,[ValuerAddrCountry]
			,[ValuerAddrPostCode]
			,[ValuerAddrState]
			,[ValuerCode]
			,[ValuerEmail]
			,[ValuerName]
			,[VerbalIndicativeValue]
			,[RESPONSECODE]
			,[RESPONSEDESCRIPTION]     			
			,[CreatedDate]
			,[UpdatedDate]						
			,[Aging]
			,[DocumentationStatus]
			--,[VRStatus]
		)
		as
		(
		SELECT LOADS.[ARN] as [ARN]
			,LOADS.[Status] as [Status]
			,[BranchAddr1]
			,[BranchAddr2]
			,[BranchAddr3]
			,[BranchAddrCity]
			,[BranchAddrCountry]
			,[BranchAddrPostCode]
			,[BranchAddrState]
			,[BranchManagerEmailAddress]
			,[BranchManagerName]
			,[ClosingBranch]			  
			,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
			,[FinancingType]
			,[MortgateCenterCode]
			,[MortgateCenterEmail]
			,[PFSalesEmailAddress]
			,[PFCSalesName]
			,[SolicitorAccountNbr]
			,[SolicitorAccountType]
			,[SolicitorAddr1]
			,[SolicitorAddr2]
			,[SolicitorAddr3]
			,[SolicitorAddrCity]
			,[SolicitorAddrCountry]
			,[SolicitorAddrPostCode]
			,[SolicitorAddrState]
			,[SolicitorEmail]
			,[SolInternalStatus]
			,[SolicitorName]
			,LOADS.[SolicitorCode] as [SolicitorCode]
			,[TopUpLoanIndicator]
			,[ChargorIDNumber]
			,[ChargorName]
			,[CustomerAddr1]
			,[CustomerAddr2]
			,[CustomerAddr3]
			,[CustomerAddrCity]
			,[CustomerAddrCountry]
			,[CustomerAddrPostCode]
			,[CustomerAddrState]
			,[ApplicantEmail]
			,[CustomerID]
			,[ApplicantName]
			,[CustomerName]
			,[EStatementFlagIndicator]
			,[GuarantorIDNumber]
			,[GuarantorName]
			,[DisbursementManner]
			,[LoanAmount]
			,[FacilityAmount1]
			,[FacilityAmount2]
			,[FacilityAmount3]
			,[FacilityAmount4]
			,[FinancingProductName1]
			,[FinancingProductName2]
			,[FinancingProductName3]
			,[FinancingProductName4]
			,[GracePeriod]
			,[LegalFeesFinancedAmount]
			,[MRTAFinancedAmount]
			,[PurposeCode]
			,[TotalFinancingAmount]
			,[ValuationFeesFinancedAmount]
			,[BuildUpArea]
			,[DeveloperCode]
			,[DeveloperName]
			,[CollateralPurpose]
			,[LandArea]
			,[ProjectCode]
			,[ProjectName]
			,[PropertyAddress]
			,[PropertyType]
			,[ValuationRequired]
			,[TitleDetailsLO]
			,[ValuerAccountNBR]
			,[ValuerAccountType]
			,[ValuerAddr1]
			,[ValuerAddr2]
			,[ValuerAddr3]
			,[ValuerAddrCity]
			,[ValuerAddrCountry]
			,[ValuerAddrPostCode]
			,[ValuerAddrState]
			,LOADS.[ValuerCode] as [ValuerCode]
			,[ValuerEmail]
			,[ValuerName]
			,[VerbalIndicativeValue]
			,[RESPONSECODE]
			,[RESPONSEDESCRIPTION]     			
			,FORMAT (solicitor.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
			,FORMAT (solicitor.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]			  
			, DATEDIFF(day, solicitor.UpdatedDate, getdate()) as [Aging]			
			, case 
				when sol_dumaker.Status = 'Completed' and solicitor.Status = 'Cancelled' then 'Ended-Cancelled' 
				when sol_dumaker.Status = 'Completed' then 'Ended-Approved' 
				when Sol_UI.arn is not null then 'UpdateInfo' 
				when solicitor.Completed =1 and solicitor.Status = 'Cancelled' then 'Cancelled' 						
				when Sol_Rejected.arn is not null and solicitor.Completed = 1 then 'Resubmitted' 
				when Sol_Rejected.arn is not null and solicitor.Completed = 0 then 'Rejected' 
				when solicitor.Completed =1 and solicitor.Status = 'Submitted' then 'Submitted' 																													
				else 'New' 
			end as [DocumentationStatus]
			/*
			,case 
				when isnull(LOADS.ValuationRequired,0) = 0 then 'N/A'
				when valuer_dumaker.Status = 'Completed' and valuer.status = 'Cancelled' then 'Ended-Cancelled'
				when valuer_dumaker.Status = 'Completed' then 'Ended-Approved'
				when valuer_ui.arn is not null then 'UpdateInfo'
				when valuer.Completed = 1 and valuer.status = 'Cancelled' then 'Cancelled'
				when valuer.Completed = 1 and Valuer_lowerOMV.arn is not null and valuer.Completed = 1 then 'Resubmitted'
				when valuer.Completed = 1 and Valuer.Status = 'LowerOMV' then 'LowerOMV'
				when valuer.Completed = 1 and Valuer.Status = 'Submitted' then 'Submitted'
				else 'New'
			end as [VRStatus]
			*/
		FROM [dbo].[SQLLOADS] LOADS			
			LEFT JOIN [dbo].[vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn 
			LEFT join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = LOADS.arn 
			--LEFT JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn 
			--left JOIN [dbo].[SQLValuerDPSubmission_updateinfo] valuer_ui on valuer_ui.arn = LOADS.arn			
			--left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = LOADS.arn 
			--left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = LOADS.arn															
			left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = LOADS.arn
			left JOIN [dbo].SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = LOADS.arn									
		where 				
			solicitor.UpdatedDate between @DateFrom and @DateFrom
			and MortgateCenterCode like case when @MortgageCentreFlag = 1 then @MortgageCentre else '*' end 
			and LOADS.SolicitorCode like case when @SolCodeFlag = 1 then @SolCode else '*' end 
			--and LOADS.ValuerCode like case when @ValCodeFlag = 1 then @ValCode else '*' end 															
			and sol_dumaker.Status <> 'Completed'
			and Sol_Rejected.arn is null 
		)
		select * 
		from cte 
		--where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '*' end 
--			and 
		where cte.DOcumentationStatus in ('UpdateInfo','Cancelled')
			and cte.DOcumentationStatus like case when @SolicitorOptionFlag = 1 then @SolicitorOption else '*' end 
		order by UpdatedDate desc		
	end 		
end