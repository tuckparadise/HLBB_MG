CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Rejected]
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
	  , case solicitor.Status when 'Resubmit-New' then 'Rejected' else solicitor.Status end as SolicitorStatus
	  --, DATEDIFF(day, solicitor.UpdatedDate, getdate()) as aging	
	  , DATEDIFF(day, dumaker_reject.UpdatedDate, getdate()) as aging	
	  , dumaker_reject.dumakeremail  as lastmodifieduser 	
	  --, dumaker_reject.UpdatedDate as lastmodifieddate 		
	  ,FORMAT (dumaker_reject.UpdatedDate, 'dd/MM/yyyy') as lastmodifieddate  
	  --, solicitor.UpdatedDate as submissiondate 
	  ,FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') as submissiondate  
	  --,FORMAT (dumaker_reject.SolicitorUpdatedDate, 'dd/MM/yyyy') as submissiondate  
	  from SQLDUMakerDP_SolicitorSubmission_Rejected dumaker_reject
	  --FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].[SQLSolicitorDPSubmission] solicitor on solicitor.arn = dumaker_reject.arn
	  inner join [SQLLOADS] LOADS on LOADS.arn = solicitor.arn 
	  --left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	  --left join SQLDUMakerDP_SolicitorSubmission_Rejected dumaker_reject on dumaker_reject.arn = solicitor.arn 
	  where 
		--LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_SolicitorSubmission)
		--and 
		solicitor.Status not in ('Cancelled', 'Resubmitted','UpdateInfo')
		--and LOADS.ARN not in (select arn from K2Instance where Workflow = 'DPDUMakerSolicitorApproval') 
		and 
		LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_SolicitorSubmission where status in ('Completed'))
		


end