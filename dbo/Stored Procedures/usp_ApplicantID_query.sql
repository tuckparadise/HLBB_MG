--usp_ARN_query 'arn10'


CREATE   procedure [dbo].[usp_ApplicantID_query]
@ApplicantID nvarchar(max)
as
begin 	
	/*
	-- valuer resubmission for pending anti virus scan
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Resubmission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when loweromv.DUMakerEmail is null then null else loweromv.DUMakerEmail end as lastmodifieduser,		
		case when loweromv.DUMakerEmail is null then null else loweromv.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLValuerDPSubmission_staging] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweromv on loweromv.arn = loads.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[SQLValuerDPSubmission_staging] VALUER ON VALUER.ARN = LOADS.ARN 
			and VALUER.Status IN  ('Resubmitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
		AND loads.CustomerID = @ApplicantID

		UNION
	
	-- valuer submission while pending virus scan
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Submission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when loweredomv.DUMakerEmail is null then dumaker.DUMakerEmail else loweredomv.DUMakerEmail end as lastmodifieduser,		
		case when loweredomv.DUMakerEmail is null then dumaker.UpdatedDate else loweredomv.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLValuerDPSubmission_staging] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredomv on loweredomv.arn = valuer.arn 
	left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[SQLValuerDPSubmission_staging] VALUER ON VALUER.ARN = LOADS.ARN 
			--and VALUER.Status IN  ('Submitted','Cancelled','LowerOMV')
			and VALUER.Status IN  ('Submitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
		AND loads.CustomerID = @ApplicantID

		UNION

	-- get DU Maker for solicitor new submission - submitted while pending virus scan
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Submission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then dumaker.DUMakerEmail else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then dumaker.UpdatedDate else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLSolicitorDPSubmission_staging] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = solicitor.arn 
	left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[SQLSolicitorDPSubmission_staging] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Submitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
			
	UNION

		-- get DU Maker for solicitor cancelled case	while pending virus scan 
		select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Cancelled' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then dumaker.DUMakerEmail else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then dumaker.UpdatedDate else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLSolicitorDPSubmission_staging] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = solicitor.arn 
	left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[SQLSolicitorDPSubmission_staging] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Cancelled')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID

	UNION


	-- get DU Maker for solicitor resubmission case	while pending virus scan 
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Resubmission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then null else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then null else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLSolicitorDPSubmission_staging] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = loads.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[SQLSolicitorDPSubmission_staging] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Resubmitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
	union 
	*/

	-- get DU Maker for solicitor submission completed case (submitted)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Submission-Completed' as [Morgage_Status],
	--	loads.arn as arn,
	--	loads.FinancingType as financiangtype,
	--	loads.TotalFinancingAmount as totalfinancingamount,
	--	loads.ApplicantName as applicantname,
	--	loads.MortgateCenterCode as mortgagecentercode,
		solicitor.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
	--	,loads.CustomerID as borowerid
	from SQLDUMakerDP_SolicitorSubmission dumaker
	inner join vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = solicitor.arn 
	where dumaker.[Status] = 'Completed'
		and solicitor.status = 'submitted'
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
	
	UNION
	-- get DU Maker for solicitor submission completed case (cancelled)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Cancelled-Completed' as [Morgage_Status],
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from SQLDUMakerDP_SolicitorSubmission dumaker
	inner join vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = solicitor.arn 
	where dumaker.[Status] = 'Completed'
		and solicitor.status = 'cancelled'
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
	
	UNION
	-- get DU Maker for solicitor submission completed case (resubmitted)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Resubmission-Completed' as [Morgage_Status],
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from SQLDUMakerDP_SolicitorSubmission dumaker
	inner join vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = solicitor.arn 
	where dumaker.[Status] = 'Completed'
		and solicitor.status = 'resubmitted'
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID

	UNION
	-- get solicitor new case (Loads)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-New' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		null as submissiondate,
		'' as lastmodifieduser, 
		null as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	--where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN and SOLICITOR.Status IN ('Submitted', 'Cancelled','Resubmitted','Resubmit-New' ,'UpdateInfo') )
	where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[vw_SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN and SOLICITOR.Status IN ('Submitted', 'Cancelled','Resubmitted','Resubmit-New') )
		and LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLSolicitorDPSubmission_staging] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN and SOLICITOR.Status IN ('Submitted', 'Cancelled','Resubmitted','Resubmit-New') )
		and LOADS.ARN NOT IN (select arn from SQLDUMakerDP_SolicitorSubmission_Rejected)
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)		
		AND loads.CustomerID = @ApplicantID
	/*
	UNION
	
	-- get solicitor update info case
	select 'Solicitor-UpdateInfo' as [status] ,
		loads.arn as arn,
		loads.FinancingType as financiangtype,
		loads.TotalFinancingAmount as totalfinancingamount,
		loads.ApplicantName as applicantname,
		loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then null else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then null else rejected.UpdatedDate end as lastmodifieddate		
		,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = loads.arn 
	where LOADS.ARN IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN and SOLICITOR.Status IN ('UpdateInfo' ) )
		AND loads.ARN = @arn  
	*/
	UNION
	-- get solicitor update info case
	select loads.[ARN] as [ARN]
		  ,loads.[Status] as [Status]
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
		  ,[DateOfLOAcceptance]
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
		  ,loads.[SolicitorCode]
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
		  ,[RESPONSEDESCRIPTION],
		'Solicitor-UpdateInfo' as [status] ,
		/*
		loads.arn as arn,		
		loads.FinancingType as financiangtype,
		loads.TotalFinancingAmount as totalfinancingamount,
		loads.ApplicantName as applicantname,
		loads.MortgateCenterCode as mortgagecentercode,
		*/
		updateinfo.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then null else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then null else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = loads.arn 
	left join SQLSolicitorDPSubmission_UpdateInfo updateinfo on updateinfo.arn = loads.arn 
	where LOADS.ARN IN (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
	
	UNION
	-- get DU Maker for solicitor new submission - submitted/ cancelled case	
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Submission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then dumaker.DUMakerEmail else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then dumaker.UpdatedDate else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = solicitor.arn 
	left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Submitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID
		
	UNION
	-- get DU Maker for solicitor new submission - submitted/ cancelled case	
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Cancelled' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then dumaker.DUMakerEmail else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then dumaker.UpdatedDate else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = solicitor.arn 
	left join SQLDUMakerDP_SolicitorSubmission dumaker on dumaker.arn = solicitor.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Cancelled')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID

	UNION
	-- get DU Maker for solicitor submission rejected case
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Rejected' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then null else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then null else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	inner join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = loads.arn 
	where
		
		LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			--and SOLICITOR.Status IN  ('Resubmitted','Cancelled')
			and SOLICITOR.Status IN  ('Resubmit-New','UpdateInfo')
		)
		and 		
		
		loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID

	UNION

	-- get DU Maker for solicitor resubmission case	
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,[RESPONSEDESCRIPTION],
		'Solicitor-Resubmission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		solicitor.updateddate as submissiondate,
		case when rejected.DUMakerEmail is null then null else rejected.DUMakerEmail end as lastmodifieduser,		
		case when rejected.DUMakerEmail is null then null else rejected.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLSolicitorDPSubmission] solicitor on solicitor.arn = loads.arn 
	left join SQLDUMakerDP_SolicitorSubmission_Rejected rejected on rejected.arn = loads.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLSolicitorDPSubmission] SOLICITOR ON SOLICITOR.ARN = LOADS.ARN 
			and SOLICITOR.Status IN  ('Resubmitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_SolicitorSubmission where status = 'completed')
		and loads.arn not in (select arn from SQLSolicitorDPSubmission_UpdateInfo)	
		AND loads.CustomerID = @ApplicantID

	UNION
	-- get DU Maker for valuer submission completed case (submitted)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Submission-Completed' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from SQLDUMakerDP_ValuerSubmission dumaker
	inner join vw_SQLValuerDPSubmission valuer on valuer.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = valuer.arn 
	where dumaker.[Status] = 'Completed'
		and valuer.Status in ('submitted')
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID

	UNION
	-- get DU Maker for valuer submission completed case (cancelled)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Cancelled-Completed' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from SQLDUMakerDP_ValuerSubmission dumaker
	inner join vw_SQLValuerDPSubmission valuer on valuer.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = valuer.arn 
	where dumaker.[Status] = 'Completed'
		and valuer.Status = 'Cancelled'
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID

	
	UNION
	-- get DU Maker for valuer submission completed case (Resubmitted)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Resubmission-Completed' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.UpdatedDate as submissiondate,
		dumaker.DUMakerEmail as lastmodifieduser, 
		dumaker.UpdatedDate as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from SQLDUMakerDP_ValuerSubmission dumaker
	inner join vw_SQLValuerDPSubmission valuer on valuer.arn = dumaker.arn 
	inner join sqlloads loads on loads.arn = valuer.arn 
	where dumaker.[Status] = 'Completed'
		and valuer.Status = 'Resubmitted'
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID
	
	UNION
	-- get Valuer new case (Loads)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-New' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		null as submissiondate,
		'' as lastmodifieduser, 
		null as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweromv on loweromv.arn = loads.arn 
	--where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.[Status] IN ('Submitted', 'Cancelled','Resubmitted','LowerOMV','Resubmit-New','UpdateInfo'  ) )
	where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.[Status] IN ('Submitted', 'Cancelled','Resubmitted','LowerOMV','Resubmit-New' ) )
		and LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission_staging] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.[Status] IN ('Submitted', 'Cancelled','Resubmitted','LowerOMV','Resubmit-New' ) )
		
		and loads.ValuationRequired = 1
		and loweromv.arn is null 
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID
	/*
	UNION
	-- get Valuer new case (Loads)
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-NotRequired' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		'' as submissiondate,
		'' as lastmodifieduser, 
		'' as lastmodifieddate 
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	--where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.[Status] IN ('Submitted', 'Cancelled','Resubmitted','LowerOMV','Resubmit-New','UpdateInfo'  ) )
	--where LOADS.ARN NOT IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN and VALUER.[Status] IN ('Submitted', 'Cancelled','Resubmitted','LowerOMV','Resubmit-New' ) )
	where 
	 loads.CustomerID = @ApplicantID
	  and loads.ValuationRequired = 0
	*/
	/*
	UNION
	-- get valuer update info case
	select 'Valuer-UpdateInfo' as [status] ,
		loads.arn as arn,
		loads.FinancingType as financiangtype,
		loads.TotalFinancingAmount as totalfinancingamount,
		loads.ApplicantName as applicantname,
		loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when loweredOMW.DUMakerEmail is null then null else loweredOMW.DUMakerEmail end as lastmodifieduser,		
		case when loweredOMW.DUMakerEmail is null then null else loweredOMW.UpdatedDate end as lastmodifieddate		
		,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredOMW on loweredOMW.arn = loads.arn 
	where LOADS.ARN IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] valuer ON valuer.ARN = LOADS.ARN and valuer.Status IN ('UpdateInfo' ) )
		AND loads.ARN = @arn 
	*/	
	select loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-UpdateInfo' as [status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		updateinfo.updateddate as submissiondate,
		case when loweredOMW.DUMakerEmail is null then null else loweredOMW.DUMakerEmail end as lastmodifieduser,		
		case when loweredOMW.DUMakerEmail is null then null else loweredOMW.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredOMW on loweredOMW.arn = loads.arn 
	left join SQLValuerDPSubmission_UpdateInfo updateinfo on updateinfo.arn = loads.arn 
	where 
		LOADS.ARN IN (select arn from SQLValuerDPSubmission_UpdateInfo)
		--LOADS.ARN IN (SELECT LOADS.ARN FROM [dbo].[SQLLOADS] LOADS INNER JOIN [DBO].[SQLValuerDPSubmission] valuer ON valuer.ARN = LOADS.ARN and valuer.Status IN ('UpdateInfo' ) )
		and loads.CustomerID = @ApplicantID
	UNION
	-- get DU Maker for valuer new submission - submitted case	
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Submission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when loweredomv.DUMakerEmail is null then dumaker.DUMakerEmail else loweredomv.DUMakerEmail end as lastmodifieduser,		
		case when loweredomv.DUMakerEmail is null then dumaker.UpdatedDate else loweredomv.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredomv on loweredomv.arn = valuer.arn 
	left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN 
			--and VALUER.Status IN  ('Submitted','Cancelled','LowerOMV')
			and VALUER.Status IN  ('Submitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID

		UNION
		-- get DU Maker for valuer new submission - cancelled case	
		select	
			loads.[ARN] as [ARN]
		  ,loads.[Status] as [Status]
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
		  ,[DateOfLOAcceptance]
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
		  ,loads.[SolicitorCode]
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
		  ,loads.[ValuerCode] as [ValuerCode]
		  ,[ValuerEmail]
		  ,[ValuerName]
		  ,[VerbalIndicativeValue]
		  ,[RESPONSECODE]
		  ,[RESPONSEDESCRIPTION],
			'Valuer-Cancelled' as [Morgage_Status] ,
			--loads.arn as arn,
			--loads.FinancingType as financiangtype,
			--loads.TotalFinancingAmount as totalfinancingamount,
			--loads.ApplicantName as applicantname,
			--loads.MortgateCenterCode as mortgagecentercode,
			valuer.updateddate as submissiondate,
			case when loweredomv.DUMakerEmail is null then dumaker.DUMakerEmail else loweredomv.DUMakerEmail end as lastmodifieduser,		
			case when loweredomv.DUMakerEmail is null then dumaker.UpdatedDate else loweredomv.UpdatedDate end as lastmodifieddate		
			--,loads.CustomerID as borowerid
		from sqlloads loads 
		inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
		left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredomv on loweredomv.arn = valuer.arn 
		left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
		where LOADS.ARN IN 
			(
				SELECT LOADS.ARN 
				FROM [dbo].[SQLLOADS] LOADS 
				INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN 
				and VALUER.Status IN  ('Cancelled')
			)
			and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
			and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
			AND loads.CustomerID = @ApplicantID
	
		UNION
		-- get DU Maker for valuer new submission - LowerOMV case	
		select 
			loads.[ARN] as [ARN]
		  ,loads.[Status] as [Status]
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
		  ,[DateOfLOAcceptance]
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
		  ,loads.[SolicitorCode]
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
		  ,loads.[ValuerCode] as [ValuerCode]
		  ,[ValuerEmail]
		  ,[ValuerName]
		  ,[VerbalIndicativeValue]
		  ,[RESPONSECODE]
		  ,[RESPONSEDESCRIPTION],
			'Valuer-LowerOMV' as [Morgage_Status] ,
			--loads.arn as arn,
			--loads.FinancingType as financiangtype,
			--loads.TotalFinancingAmount as totalfinancingamount,
			--loads.ApplicantName as applicantname,
			--loads.MortgateCenterCode as mortgagecentercode,
			valuer.updateddate as submissiondate,
			case when loweredomv.DUMakerEmail is null then dumaker.DUMakerEmail else loweredomv.DUMakerEmail end as lastmodifieduser,		
			case when loweredomv.DUMakerEmail is null then dumaker.UpdatedDate else loweredomv.UpdatedDate end as lastmodifieddate		
			--,loads.CustomerID as borowerid
		from sqlloads loads 
		inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
		left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweredomv on loweredomv.arn = valuer.arn 
		left join SQLDUMakerDP_ValuerSubmission dumaker on dumaker.arn = valuer.arn 
		where LOADS.ARN IN 
			(
				SELECT LOADS.ARN 
				FROM [dbo].[SQLLOADS] LOADS 
				INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN 
				and VALUER.Status IN  ('LowerOMV')
			)
			and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
			and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
			AND loads.CustomerID = @ApplicantID
			
	UNION
	-- get DU Maker for valuer submission lowerOMV case
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-LowerOMV-Approved' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when lowerOMV.DUMakerEmail is null then null else lowerOMV.DUMakerEmail end as lastmodifieduser,		
		case when lowerOMV.DUMakerEmail is null then null else lowerOMV.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
	inner join SQLDUMakerDP_ValuerSubmission_LoweredOMV lowerOMV on lowerOMV.arn = loads.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN 
			--and VALUER.Status IN  ('Resubmitted','UpdateInfo')
			--and VALUER.Status IN  ('Resubmitted','LowerOMV','Cancelled')
			and VALUER.Status IN  ('Resubmit-New','UpdateInfo')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID

	UNION
	-- get DU Maker for valuer resubmission case	
	select 
		loads.[ARN] as [ARN]
      ,loads.[Status] as [Status]
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
      ,[DateOfLOAcceptance]
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
      ,loads.[SolicitorCode]
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
      ,loads.[ValuerCode] as [ValuerCode]
      ,[ValuerEmail]
      ,[ValuerName]
      ,[VerbalIndicativeValue]
      ,[RESPONSECODE]
      ,[RESPONSEDESCRIPTION],
		'Valuer-Resubmission' as [Morgage_Status] ,
		--loads.arn as arn,
		--loads.FinancingType as financiangtype,
		--loads.TotalFinancingAmount as totalfinancingamount,
		--loads.ApplicantName as applicantname,
		--loads.MortgateCenterCode as mortgagecentercode,
		valuer.updateddate as submissiondate,
		case when loweromv.DUMakerEmail is null then null else loweromv.DUMakerEmail end as lastmodifieduser,		
		case when loweromv.DUMakerEmail is null then null else loweromv.UpdatedDate end as lastmodifieddate		
		--,loads.CustomerID as borowerid
	from sqlloads loads 
	inner join [vw_SQLValuerDPSubmission] valuer on valuer.arn = loads.arn 
	left join SQLDUMakerDP_ValuerSubmission_LoweredOMV loweromv on loweromv.arn = loads.arn 
	where LOADS.ARN IN 
		(
			SELECT LOADS.ARN 
			FROM [dbo].[SQLLOADS] LOADS 
			INNER JOIN [DBO].[vw_SQLValuerDPSubmission] VALUER ON VALUER.ARN = LOADS.ARN 
			and VALUER.Status IN  ('Resubmitted')
		)
		and loads.arn not in (select arn from SQLDUMakerDP_ValuerSubmission where status = 'completed')
		and loads.ARN not in (select arn from SQLValuerDPSubmission_UpdateInfo)
		AND loads.CustomerID = @ApplicantID
	/*
	union 
	-- new first advice disbursement 
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-New' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	null as lastmodifieduser	,
	null as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.SolicitorSubmissioncompleted =1 )				
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )	
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )	
	AND loads.CustomerID = @ApplicantID
union 

--disbursement first advice submitted
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Submitted' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	disb_activesubmission.DisbursementMakerEmailAddress as lastmodifieduser	,
	--disb_activesubmission.UpdatedDate as lastmodifieddate
	case when disb_activesubmission.DisbursementMakerEmailAddress is not null then disb_activesubmission.UpdatedDate else null end as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Submitted'
	AND loads.CustomerID = @ApplicantID
	
union 
--disbursement first advice maker rejected

select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Maker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then rejected.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then rejected.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate		
	rejected.DisbursementMakerEmailAddress as lastmodifieduser,
	rejected.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and rejected.SolicitorSubmissionOption in ('Submitted','Resubmitted')
	AND loads.CustomerID = @ApplicantID
	
union 

--disbursement first advice re-submitted
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Resubmitted' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementMakerEmailAddress is null then rejected.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then rejected.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )	
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	AND loads.CustomerID = @ApplicantID
	
union 

--disbursement first advice maker approved
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Maker-Approved' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementCheckerEmailAddress is null then disb_activesubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementCheckerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then disb_activesubmission.DisbursementMakerSubmissionDate else disb_activesubmission.UpdatedDate end as lastmodifieddate		
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' 
	and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.[ARN] and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption in ('Submitted','Resubmitted')	
	AND loads.CustomerID = @ApplicantID
	
union 

--disbursement first advice update info
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-UpdateInfo' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	null 	as lastmodifieduser,
	null 	as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )		
	AND loads.CustomerID = @ApplicantID
union 

--disbursement first advice checker rejected
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Checker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	checker_rejected.DisbursementCheckerEmailAddress as lastmodifieduser,
	checker_rejected.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	AND loads.CustomerID = @ApplicantID
	
union 



--disbursement Completed
select 	
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Completed' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	disb_historysubmission.DisbursementCheckerEmailAddress as lastmodifieduser,
	disb_historysubmission.UpdatedDate as lastmodifieddate		
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join vw_aaSolDisbursementSubmission disb_anysubmission on disb_anysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	--and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	--and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )					
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 and BalanceAdviceLetterApplicableFlag=0 union select arn from aaSolDisbursementSubmission_history a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 and BalanceAdviceLetterApplicableFlag=0)					
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_anysubmission.SolicitorSubmissionOption in ('Submitted','Resubmitted')	
	AND loads.CustomerID = @ApplicantID
union 
-- new balance advice disbursement 
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-New' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	--disb_balanceadvice.UpdatedDate as lastmodifieddate	
	null as lastmodifieduser,
	null as UpdatedDate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.arn and arn = dumaker.[ARN] )	
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )		
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.arn and arn = dumaker.[ARN] and BalanceAdviceLetterApplicableFlag=0)
	AND loads.CustomerID = @ApplicantID
	
union 

--disbursement balance advice submitted
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-Submitted' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	disb_activesubmission.DisbursementMakerEmailAddress as lastmodifieduser	,
	case when disb_activesubmission.DisbursementMakerEmailAddress is not null then disb_activesubmission.UpdatedDate else null end as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )	
	and disb_activesubmission.SolicitorSubmissionOption = 'Submitted'
	AND loads.CustomerID = @ApplicantID
union 
--disbursement balance advice maker rejected
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-Maker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then rejected.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then rejected.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	rejected.DisbursementMakerEmailAddress as lastmodifieduser	,
	rejected.UpdatedDate as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' 
	and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and rejected.SolicitorSubmissionOption in ('Submitted','Resubmitted')
	AND loads.CustomerID = @ApplicantID
union 

--disbursement balance advice re-submitted
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-FirstAdvice-Resubmitted' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementMakerEmailAddress is null then rejected.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then rejected.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	--disb_balanceadvice.UpdatedDate as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisMakerRejected rejected on rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )	
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	AND loads.CustomerID = @ApplicantID
	
union 

--disbursement balance advice maker approved
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-Maker-Approved' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementCheckerEmailAddress is null then disb_activesubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementCheckerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then disb_activesubmission.DisbursementMakerSubmissionDate else disb_activesubmission.UpdatedDate end as lastmodifieddate		
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption in ('Submitted','Resubmitted')	
	AND loads.CustomerID = @ApplicantID
union 

--disbursement balance advice update info
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-UpdateInfo' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then updateinfo.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then updateinfo.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	null as lastmodifieduser,
	null as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_UpdateInfo updateinfo on updateinfo.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	--and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )		
	AND loads.CustomerID = @ApplicantID
union 

--disbursement balance advice checker rejected
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-BalanceAdvice-Checker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementCheckerEmailAddress is null then checker_reject.DisbursementCheckerEmailAddress else disb_activesubmission.DisbursementCheckerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then checker_reject.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate		
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisCheckerRejected checker_reject on checker_reject.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )	
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_History where arn = dumaker.[ARN] )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	AND loads.CustomerID = @ApplicantID
	
union 


--disbursement cancelled submitted- pending antivirus

select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Submitted-PendingVirusScan' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	null as lastmodifieduser	,
	null as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_staging staging on staging.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.DisbursementMakerSubmissionCompleted =1 )					
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID
union 

--disbursement cancelled submitted
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Submitted' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate
	disb_activesubmission.DisbursementMakerEmailAddress as lastmodifieduser	,
	disb_activesubmission.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where a.DisbursementMakerSubmissionCompleted =1 )					
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID
	
union

--disbursement cancelled maker approved
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Maker-Approved' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	case when disb_activesubmission.DisbursementCheckerEmailAddress is null then disb_activesubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementCheckerEmailAddress end as lastmodifieduser,
	case when disb_activesubmission.UpdatedDate is null then disb_activesubmission.DisbursementMakerSubmissionDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )					
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )		
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID
/*
union

--disbursement cancelled maker rejected
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Maker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then maker_rejected.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then maker_rejected.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	maker_rejected.DisbursementMakerEmailAddress as lastmodifieduser,
	maker_rejected.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisMakerRejected maker_rejected on maker_rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )					
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )		
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID
union 

--disbursement cancelled checker rejected
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Checker-Rejected' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	checker_rejected.DisbursementCheckerEmailAddress as lastmodifieduser,
	checker_rejected.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
left join aaSolDisbursementSubmission_DisCheckerRejected checker_rejected on checker_rejected.arn = dumaker.arn 
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )					
	and LOADS.[ARN] not in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 )		
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_activesubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID
*/
union 

--disbursement cancelled checker approved 
select 
	loads.[ARN] as [ARN]
    ,loads.[Status] as [Status]
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
    ,[DateOfLOAcceptance]
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
    ,loads.[SolicitorCode]
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
    ,[RESPONSEDESCRIPTION],
	'Disbursement-Cancellation-Completed' as [Morgage_Status],
	solicitor.UpdatedDate as submissiondate,
	--case when disb_activesubmission.DisbursementMakerEmailAddress is null then disb_historysubmission.DisbursementMakerEmailAddress else disb_activesubmission.DisbursementMakerEmailAddress end as lastmodifieduser,
	--case when disb_activesubmission.UpdatedDate is null then disb_historysubmission.UpdatedDate else disb_activesubmission.UpdatedDate end as lastmodifieddate	
	disb_historysubmission.DisbursementCheckerEmailAddress as lastmodifieduser,
	disb_historysubmission.UpdatedDate as lastmodifieddate
from SQLDUMakerDP_SolicitorSubmission dumaker
inner join vw_SQLSolicitorDPSubmission solicitor on solicitor.arn = dumaker.arn 
inner join sqlloads loads on loads.arn = solicitor.arn 
left join vw_aaSolDisbursementSubmission disb_activesubmission on disb_activesubmission.arn = dumaker.arn and disb_activesubmission.RunningIDForCompletedSubmission= 0
left join vw_aaSolDisbursementSubmission disb_historysubmission on disb_historysubmission.arn = dumaker.arn and disb_historysubmission.RunningIDForCompletedSubmission<> 0
where 
	dumaker.[Status] = 'Completed' and dumaker.Decision in ('Document in order for execution')
	--and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.SolicitorSubmissioncompleted =1 )				
	--and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementMakerSubmissionCompleted =1 )					
	and LOADS.[ARN] in (select arn from aaSolDisbursementSubmission a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1 union select arn from aaSolDisbursementSubmission_history a where arn = dumaker.arn and a.DisbursementCheckerSubmissionCompleted =1)		
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisMakerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_DisCheckerRejected where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_UpdateInfo where arn = dumaker.arn )
	and dumaker.arn not in (select arn from aaSolDisbursementSubmission_staging where arn = dumaker.arn )
	and disb_historysubmission.SolicitorSubmissionOption = 'Cancelled'
	AND loads.CustomerID = @ApplicantID

	*/

end