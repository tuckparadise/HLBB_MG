CREATE procedure [dbo].[usp_SQLDUMaker_SolicitorSubmission_Select_Completed]
as
begin

	SELECT LOADS.[ARN] as [ARN]
      --,[LendingType]
      --,[SalesPersonCode]
      ,[FinancingType]
      ,[ProjectName]
      ,[ProjectCode]
      --,[LegalFeePartOfLoan]
      ,[ValuationRequired]
      --,[MRTAFeePartOfLoan]
      ,[LoanAmount]
      ,[DisbursementManner]
      ,[ApplicantName]
      --,[DOB]
      ,[ApplicantEmail]
      ,[MortgateCenterCode]
      --,[ApplicantAccountType]
      --,[ApplicantContactNo]
      ,[SolicitorEmail]
      ,[ValuerEmail]
      ,LOADS.[Status] as [Status]
      ,[ClosingBranch]
      --,[BranchAddress]
      ,[BranchAddr1]
      ,[BranchAddr2]
      ,[BranchAddr3]
      ,[BranchAddrPostCode]
      ,[BranchAddrCity]
      ,[BranchAddrState]
      ,[BranchAddrCountry]
      --,[SalesPersonName]
      --,[SalesPersonEmailAddress]
      ,[BranchManagerName]
      ,[BranchManagerEmailAddress]
      ,LOADS.[SolicitorCode] as [SolicitorCode]
      ,[SolicitorName]
      --,[SolicitorEmail2]
      ,[SolicitorAddr1]
      ,[SolicitorAddr2]
      ,[SolicitorAddr3]
      ,[SolicitorAddrPostCode]
      ,[SolicitorAddrCity]
      ,[SolicitorAddrState]
      ,[SolicitorAddrCountry]
      ,[SolicitorAccountType]
      ,[SolicitorAccountNbr]
      ,[TopUpLoanIndicator]
      --,[DateOfLOAcceptance]
	  ,FORMAT (DateOfLOAcceptance, 'dd/MM/yyyy') as DateOfLOAcceptance
      ,[CustomerName]
      ,[CustomerID]
      ,[CustomerAddr1]
      ,[CustomerAddr2]
      ,[CustomerAddr3]
      ,[CustomerAddrPostCode]
      ,[CustomerAddrCity]
      ,[CustomerAddrState]
      ,[CustomerAddrCountry]
      ,[EStatementFlagIndicator]
      ,[ChargorName]
      ,[ChargorIDNumber]
      ,[GuarantorName]
      ,[GuarantorIDNumber]
      --,[RelationshipToApplication]
      --,[RelationshipToPrincipal]
      ,[PurposeCode]
      --,[MainProduct]
      ,[TotalFinancingAmount]
      ,[LegalFeesFinancedAmount]
      ,[ValuationFeesFinancedAmount]
      ,[MRTAFinancedAmount]
      ,[GracePeriod]
      ,[PropertyType]
      ,[PropertyAddress]
      ,[TitleDetailsLO]
      ,[DeveloperCode]
      ,[DeveloperName]
      ,[LandArea]
      ,[BuildUpArea]
      ,[ValuerCode]
      ,[ValuerName]
      ,[ValuerAddr1]
      ,[ValuerAddr2]
      ,[ValuerAddr3]
      ,[ValuerAddrPostCode]
      ,[ValuerAddrCity]
      ,[ValuerAddrState]
      ,[ValuerAddrCountry]
      ,[ValuerAccountType]
      ,[ValuerAccountNBR]
      ,[VerbalIndicativeValue]
      ,[MortgateCenterEmail]
      --,[ValuationFeePartOfLoan]
      --,[AccountType]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION]
      --,[MortgageCentre]
      --,[TotalFinancialAmount]
      --,[SolicitorType]
      --,[FinancingPurpose]
      --,[BorrowersIDNumber]
      ,[PFCSalesName]
      ,[PFSalesEmailAddress]
	  , solicitor.Status as SolicitorStatus
	  , DATEDIFF(day, solicitor.UpdatedDate, getdate()) as aging	
	  , dumaker.DUMakerEmail as lastmodifieduser 	
	  --, dumaker.UpdatedDate as lastmodifieddate 	
	  ,FORMAT (dumaker.UpdatedDate, 'dd/MM/yyyy') as lastmodifieddate	  
	  --, solicitor.UpdatedDate as submissiondate 
	  ,FORMAT (solicitor.UpdatedDate, 'dd/MM/yyyy') as submissiondate	
	  FROM [dbo].[SQLLOADS] LOADS
	  INNER JOIN [dbo].[SQLSolicitorDPSubmission] solicitor on solicitor.arn = LOADS.arn
	  inner join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	  where 
		--LOADS.ARN not in (select arn from [dbo].SQLDUMakerDP_SolicitorSubmission)
		--and 
		--solicitor.Status in ('Submitted', 'Cancelled')
		solicitor.Status in ('Submitted', 'Cancelled', 'Resubmitted')
		--and LOADS.ARN not in (select arn from K2Instance where Workflow = 'DPDUMakerSolicitorApproval') 
		and LOADS.ARN in (select arn from [dbo].SQLDUMakerDP_SolicitorSubmission where status in ('Completed'))
		


end