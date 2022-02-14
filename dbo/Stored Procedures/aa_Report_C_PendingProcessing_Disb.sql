CREATE             procedure [dbo].[aa_Report_C_PendingProcessing_Disb]
@DateFrom datetime = null,
@DateTo datetime = null,
@MortgageCentre nvarchar(max) = null,
@MortgageCentreFlag bit = null,
@SolCode nvarchar(max) = null,
@SolCodeFlag bit = null,
@ValCode nvarchar(max) = null,
@ValCodeFlag bit = null,
@DocVRANDFlag bit = null,
@Stage nvarchar(max) = null,
@Error nvarchar(max) = null OUTPUT 
as
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
			--,[DocumentationStatus]
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
			,LOADS.[DeveloperCode]
			,[DeveloperName]
			,[CollateralPurpose]
			,[LandArea]
			,LOADS.[ProjectCode]
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
			,FORMAT (sol_disbursement.[CreatedDate], 'dd/MM/yyyy') as [CreatedDate]
			,FORMAT (sol_disbursement.[UpdatedDate], 'dd/MM/yyyy') as [UpdatedDate]			  
			, DATEDIFF(day, sol_disbursement.UpdatedDate, getdate()) as [Aging]
			/*
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
			INNER JOIN [dbo].[vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn 
			INNER join SQLDUMakerDP_SolicitorSubmission sol_dumaker on sol_dumaker.arn = LOADS.arn 
			INNER join aaSolDisbursementSubmission_DisMakerSubmission sol_disbursement on sol_disbursement.arn = LOADS.arn 			
			LEFT JOIN [dbo].vw_SQLValuerDPSubmission valuer on valuer.arn = LOADS.arn 
			left JOIN [dbo].[SQLValuerDPSubmission_updateinfo] valuer_ui on valuer_ui.arn = LOADS.arn			
			left join SQLDUMakerDP_ValuerSubmission valuer_dumaker on valuer_dumaker.arn = LOADS.arn 
			--left JOIN [dbo].SQLDUMakerDP_ValuerSubmission_LoweredOMV Valuer_lowerOMV on Valuer_lowerOMV.arn = LOADS.arn															
			--left JOIN [dbo].[SQLSolicitorDPSubmission_updateinfo] Sol_UI on Sol_UI.arn = LOADS.arn
			left JOIN [dbo].SQLDUMakerDP_SolicitorSubmission_Rejected Sol_Rejected on Sol_Rejected.arn = LOADS.arn									
		where 				
			sol_disbursement.UpdatedDate between @DateFrom and @DateFrom
			and MortgateCenterCode like case when @MortgageCentreFlag = 1 then @MortgageCentre else '%' end 
			and LOADS.SolicitorCode like case when @SolCodeFlag = 1 then @SolCode else '%' end 
			and LOADS.ValuerCode like case when @ValCodeFlag = 1 then @ValCode else '%' end 															
			and sol_dumaker.Status = 'Completed'
			and Sol_Rejected.arn is null 
			and sol_disbursement.SolicitorSubmissionCompleted = 1
			and isnull(sol_disbursement.DisbursementMakerSubmissionCompleted,0) = 0
		)
		select * 
		from cte 
		--where cte.VRStatus like case when @VRStatusFlag = 1 then @VRStatus else '*' end 
--			and cte.DOcumentationStatus like case when @DocStatusFlag = 1 then @DocStatus else '*' end 
		order by UpdatedDate desc		

end