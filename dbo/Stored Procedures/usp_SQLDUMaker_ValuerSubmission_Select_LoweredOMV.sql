CREATE procedure [dbo].[usp_SQLDUMaker_ValuerSubmission_Select_LoweredOMV]
as
begin

	SELECT 
		LOADS.[ARN] as [ARN]
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
      --,[DateOfLOAcceptance]
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
      ,LOADS.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION]
	  --, case valuer.Status when 'Resubmit-New' then 'LowerOMV' else valuer.Status end as ValuerStatus
	  /*
	  ,case VALUER.[Status] 
		when 'Resubmit-New' then 'LowerOMV' 
		when 'UpdateInfo' then 
			case loweredOMV.arn 
				when null then 'UpdateInfo' 
			else 'LowerOMV' 
		end else isnull(VALUER.[Status],'New') end as ValuerStatus
		*/		
		, case VALUER.Status when 'Resubmit-New' then 'LowerOMV' else VALUER.Status end as ValuerStatus
	  --, valuer.Status as ValuerStatus
	  --, DATEDIFF(day, valuer.UpdatedDate, getdate()) as aging	
	  , DATEDIFF(day, dumaker_lowerOMV.UpdatedDate, getdate()) as aging	
	  , dumaker_lowerOMV.dumakeremail as lastmodifieduser 	
	  --, dumaker_lowerOMV.UpdatedDate as lastmodifieddate 
	  ,FORMAT (dumaker_lowerOMV.UpdatedDate, 'dd/MM/yyyy') as lastmodifieddate	
	  --,valuer.UpdatedDate as submissiondate 
	  ,FORMAT (valuer.UpdatedDate, 'dd/MM/yyyy') as submissiondate	
	  --,FORMAT (dumaker_lowerOMV.ValuerUpdatedDate, 'dd/MM/yyyy') as submissiondate	  		
	  FROM SQLDUMakerDP_ValuerSubmission_LoweredOMV dumaker_lowerOMV
	  --FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].SQLValuerDPSubmission valuer on valuer.arn = dumaker_lowerOMV.arn
	  INNER JOIN [dbo].[SQLLOADS] LOADS on LOADS.arn = valuer.arn 
	  --LEFT OUTER JOIN [DBO].SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredOMV ON loweredOMV.ARN = LOADS.ARN 
	 -- left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	 -- left join SQLDUMakerDP_ValuerSubmission_LoweredOMV dumaker_lowerOMV on dumaker_lowerOMV.arn = valuer.arn 
	  where 
		--valuer.Status not in ( 'Cancelled','Resubmitted','LowerOMV')
		valuer.Status not in ( 'Cancelled','Resubmitted')
		--and LOADS.ARN not in (select arn from K2Instance where Workflow = 'DPDUMakerValuerApproval') 
		and 
		LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_ValuerSubmission where Status in ('Completed'))
		

end